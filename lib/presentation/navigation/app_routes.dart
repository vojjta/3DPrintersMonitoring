enum AppRoutes {
  home('/'),
  addPrinter('/add-printer');

  final String path;

  const AppRoutes(this.path);

  @override
  toString() => path;
}
