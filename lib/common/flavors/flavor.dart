import 'package:kuner/common/flavors/flavor_config.dart';

enum Flavor {
  dev(FlavorConfig.dev()),
  prod(FlavorConfig.prod());

  final FlavorConfig config;

  const Flavor(this.config);

  bool get isProduction => this == Flavor.prod;
  bool get isDev => this == Flavor.dev;
}
