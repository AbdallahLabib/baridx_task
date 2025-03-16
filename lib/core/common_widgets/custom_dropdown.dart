import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../helpers/themes/colors/app_colors.dart';
import 'custom_text_fields/string_text_field.dart';

/// A customizable dropdown widget that supports both single and multiple selection.
///
/// [T] is the type of the data represented in the dropdown.
class CustomDropdown<T> extends StatefulWidget {
  /// A list of items to display in the dropdown.
  final List<T> items;

  /// The currently selected item (used in single-select mode).
  final T? selectedItem;

  /// The currently selected items (used in multi-select mode).
  final List<T>? selectedItems;

  /// Flag to indicate whether the dropdown should allow multiple selections.
  /// Defaults to `false` for single selection.
  final bool isMultiSelect;

  /// A flag to specify whether the field is required.
  /// Defaults to `true`.
  final bool isRequired;

  /// Placeholder text to display when no item is selected.
  final String placeholder;

  /// Function that returns the display label for an item of type [T].
  final String Function(T) itemLabel;

  /// Callback function that triggers when a single item is selected.
  /// Used in single selection mode.
  final ValueChanged<T?>? onItemSelected;

  /// Callback function that triggers when multiple items are selected.
  /// Used in multi-selection mode.
  final ValueChanged<List<T>>? onMultiSelect;

  /// Padding inside the dropdown field.
  final EdgeInsetsGeometry? padding;

  /// Flag to enable or disable the dropdown.
  /// Defaults to `true`.
  final bool isEnabled;

  /// Flag to indicate if the dropdown is loading.
  /// Defaults to `false`.
  final bool isLoading;

  /// Creates a [CustomDropdown] widget.
  const CustomDropdown({
    super.key,
    required this.items,
    this.selectedItem,
    this.selectedItems,
    this.isMultiSelect = false,
    this.isRequired = true,
    this.isEnabled = true,
    this.isLoading = false,
    required this.placeholder,
    required this.itemLabel,
    this.onItemSelected,
    this.onMultiSelect,
    this.padding,
  });

  @override
  CustomDropdownState<T> createState() => CustomDropdownState<T>();
}

class CustomDropdownState<T> extends State<CustomDropdown<T>> {
  late T? _selectedItem;
  late List<T> _selectedItems;
  bool _isOpen = false;
  late TextEditingController _textController;
  late FocusNode _focusNode;
  late final ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _textController = TextEditingController();
    _scrollController = ScrollController();
    _selectedItem = widget.selectedItem;
    _textController.text = _selectedItem != null ? widget.itemLabel(_selectedItem as T) : "";
    _selectedItems = [...?widget.selectedItems];
    if (widget.isMultiSelect) {
      _textController.text = _selectedItems.isNotEmpty ? _selectedItems.map((e) => widget.itemLabel(e)).join(", ") : "";
    }
  }

  @override
  void didUpdateWidget(covariant CustomDropdown<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.selectedItem != widget.selectedItem) {
      _selectedItem = widget.selectedItem;
      // Schedule the text update for the next frame
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          setState(() {
            _textController.text = _selectedItem != null ? widget.itemLabel(_selectedItem as T) : "";
            if (widget.isMultiSelect) {
              _selectedItems = [...?widget.selectedItems];
              _textController.text =
                  _selectedItems.isNotEmpty ? _selectedItems.map((e) => widget.itemLabel(e)).join(", ") : "";
            }
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _textController.dispose();
    super.dispose();
  }

  /// Toggles the dropdown's open and close states.
  void _toggleDropdown() {
    setState(() {
      if (_isOpen) {
        _focusNode.unfocus();
      } else {
        _focusNode.requestFocus();
      }

      _isOpen = !_isOpen;
    });
  }

  /// Handles the selection of a single item in the dropdown.
  ///
  /// [item] is the selected item of type [T].
  void _onSingleSelect(T item) {
    setState(() {
      _selectedItem = item;
      _textController.text = widget.itemLabel(item);
      _closeDropdown();
      if (widget.onItemSelected != null) {
        widget.onItemSelected!(item);
      }
    });
  }

  /// Handles the selection or deselection of an item in multi-select mode.
  ///
  /// [item] is the item of type [T], and [isSelected] indicates if the item is selected.
  void _onMultiSelect(T item, bool isSelected) {
    setState(() {
      if (isSelected) {
        _selectedItems.add(item);
      } else {
        _selectedItems.remove(item);
      }
      _textController.text = _selectedItems.isNotEmpty ? _selectedItems.map((e) => widget.itemLabel(e)).join(", ") : "";
      if (widget.onMultiSelect != null) widget.onMultiSelect!(_selectedItems);
    });
  }

  /// Closes the dropdown and clears the focus.
  void _closeDropdown() {
    setState(() {
      _isOpen = false;
    });
    _focusNode.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: _focusNode,
      onFocusChange: (hasFocus) {
        if (!hasFocus && _isOpen) _closeDropdown();
      },
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _dropDownHeader().animate().fadeIn(duration: 300.ms).slideX(begin: 0.1, end: 0),
            if (_isOpen) _dropDownBody().animate().fadeIn(duration: 200.ms).slideY(begin: -0.1, end: 0),
          ],
        ),
      ),
    );
  }

  /// Builds the body of the dropdown, which contains the list of selectable items.
  Widget _dropDownBody() {
    if (widget.items.isEmpty) return const SizedBox();
    final color = _isOpen ? AppColors.primary700 : AppColors.borderColor;
    const borderRadius = Radius.circular(8);

    return Container(
      height: _getDropdownHeight(),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(borderRadius),
        border: Border.all(color: color),
        boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 4, offset: Offset(0, 2))],
      ),
      child: Scrollbar(
        thumbVisibility: true,
        controller: _scrollController,
        child: ListView(
          controller: _scrollController,
          padding: EdgeInsets.zero,
          children: widget.items.map((T item) {
            return (widget.isMultiSelect ? _buildMultiSelectItem(item) : _buildSingleSelectItem(item))
                .animate()
                .fadeIn(delay: 100.ms, duration: 300.ms)
                .slideY(begin: 0.1, end: 0);
          }).toList(),
        ),
      ),
    );
  }

  Widget _buildMultiSelectItem(T item) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: _selectedItems.contains(item)
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: AppColors.primary10,
            )
          : null,
      child: CheckboxListTile(
        value: _selectedItems.contains(item),
        title: Text(
          widget.itemLabel(item),
          style: TextStyle(fontSize: 10.sp, color: Colors.black),
        ),
        checkColor: _selectedItem != null || _selectedItems.isNotEmpty ? AppColors.primary10 : null,
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.primary500;
          return Colors.white;
        }),
        onChanged: (bool? checked) {
          _onMultiSelect(item, checked!);
        },
        controlAffinity: ListTileControlAffinity.trailing,
      ),
    );
  }

  Widget _buildSingleSelectItem(T item) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      decoration: _selectedItem == item
          ? BoxDecoration(
              borderRadius: BorderRadius.circular(6.r),
              color: AppColors.primary10,
            )
          : null,
      child: RadioListTile<T>(
        value: item,
        groupValue: _selectedItem,
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.primary500;
          return Colors.black;
        }),
        title: Text(
          widget.itemLabel(item),
          style: TextStyle(fontSize: 10.sp, color: Colors.black),
        ),
        onChanged: (T? value) => _onSingleSelect(item),
        controlAffinity: ListTileControlAffinity.trailing,
      ),
    );
  }

  /// Builds the header of the dropdown, which includes the text field and icon.
  Widget _dropDownHeader() {
    final color = _isOpen ? AppColors.primary700 : Colors.grey.shade400;
    return StringTextField(
      controller: _textController,
      isReadOnly: true,
      isEnabled: widget.items.isNotEmpty && widget.isEnabled,
      isRequired: widget.isRequired,
      onTap: _toggleDropdown,
      borderColor: color,
      borderRadius: 8.0,
      suffixIcon: widget.isLoading
          ? const SizedBox(
              height: 15,
              width: 15,
              child: CircularProgressIndicator(
                color: AppColors.secondary800,
                strokeWidth: 2.5,
                strokeAlign: -12,
              ),
            )
          : Icon(
              _isOpen ? CupertinoIcons.chevron_up : CupertinoIcons.chevron_down,
              size: 20,
              color: Colors.black,
            ),
      hintText: widget.placeholder,
      textStyle: TextStyle(
        color: Colors.black,
        fontSize: 14.sp,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  /// Determines the height of the dropdown body based on the number of items.
  double _getDropdownHeight() {
    if (widget.items.length < 4) return widget.items.length * 70.h;
    return 250.h;
  }
}
