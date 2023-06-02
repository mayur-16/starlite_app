enum Flavor {
  dev,
  staging,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Starlite dev';
      case Flavor.staging:
        return 'Starlite';
      case Flavor.prod:
        return 'Starlite';
      default:
        return 'title';
    }
  }

}
