import 'package:flutter/material.dart';

class DialogModel {
  String? title;
  String? description;
  String? image;
  String primaryText;
  Color? primaryButtonColor;
  Color? secondaryButtonColor;
  String? secondaryText;
  Function()? onPrimaryTapped;
  Function()? onSecondaryTapped;
  late DialogType dialogType;
  double? secondaryFontSize;
  double? primaryFontSize;
  Widget? topImage;
  Widget? body;
  List<BoxShadow>? boxShadow;
  EdgeInsets? padding;

  DialogModel.confirm({
    this.title,
    this.description,
    required this.primaryText,
    this.body,
    this.image,
    this.onPrimaryTapped,
    this.primaryButtonColor,
    this.secondaryButtonColor,
    this.secondaryText,
    this.onSecondaryTapped,
    this.secondaryFontSize,
    this.primaryFontSize,
    this.topImage,
    this.boxShadow,
    this.padding,
  }) {
    dialogType = DialogType.confirmation;
  }

  DialogModel.action({
    this.title,
    this.description,
    required this.image,
    required this.primaryText,
    required this.secondaryText,
    this.body,
    this.onPrimaryTapped,
    this.primaryButtonColor,
    this.secondaryButtonColor,
    this.onSecondaryTapped,
    this.secondaryFontSize,
    this.primaryFontSize,
    this.topImage,
    this.boxShadow,
    this.padding,
  }) {
    dialogType = DialogType.action;
  }
}

enum DialogType { action, confirmation }
