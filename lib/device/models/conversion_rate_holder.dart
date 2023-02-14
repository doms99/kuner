class ConversionRateHolder {
  Map<String, Map<String, double>> rates = {};

  double? rate(String first, String second) {
    if (rates.containsKey(first) && rates[first]!.containsKey(second)) {
      return rates[first]![second]!;
    } else if (rates.containsKey(second) && rates[second]!.containsKey(first)) {
      return rates[second]![first]!;
    }

    return null;
  }
}
