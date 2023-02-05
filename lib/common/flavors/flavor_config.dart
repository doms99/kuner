class FlavorConfig {
  const FlavorConfig._(this.appName);

  final String appName;

  const FlavorConfig.dev() : this._('Kuner [dev]');
  const FlavorConfig.prod() : this._('Kuner');
}
