enum Flavor {
  PRODUCTION,
  STAGING,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.PRODUCTION:
        return 'HSE';
      case Flavor.STAGING:
        return 'Staging HSE';
      default:
        return 'title';
    }
  }

  static String get baseUrl {
    switch (appFlavor) {
      case Flavor.STAGING:
        return 'https://dev-api-lms.apps-madhani.com/v1/';
      case Flavor.PRODUCTION:
        return 'https://api-lms.apps-madhani.com/v1/';
      default:
        return 'https://dev-api-lms.apps-madhani.com/v1/';
    }
  }
}
