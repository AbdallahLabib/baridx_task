enum AppManagerEnv { dev, prod, testing }

extension AppManagerEnvHelper on AppManagerEnv {
  String get dependencyInjectionEnv => this == AppManagerEnv.prod ? 'prod' : 'dev';
  String get baseUrl => this == AppManagerEnv.prod ? "production_url" : "dev_url";
}
