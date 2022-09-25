import 'package:flutter/material.dart';
import 'package:kuner/gen/assets.gen.dart';
import 'package:kuner/ui/common/components/models/currency.dart';
import 'package:kuner/ui/common/components/models/icon_size.dart';

class CurrencyIcon extends StatelessWidget {
  const CurrencyIcon._({
    required this.size,
    required this.currency,
    super.key,
  });

  factory CurrencyIcon.small({required Currency currency, Key? key}) {
    return CurrencyIcon._(currency: currency, size: IconSize.small, key: key);
  }
  factory CurrencyIcon.large({required Currency currency, Key? key}) {
    return CurrencyIcon._(currency: currency, size: IconSize.large, key: key);
  }

  final IconSize size;
  final Currency currency;

  AssetGenImage get currencyImage {
    switch (currency) {
      case Currency.eur:
        return Assets.pngs.euro;
      case Currency.hrk:
        return Assets.pngs.kn;
    }
  }

  @override
  Widget build(BuildContext context) {
    switch (size) {
      case IconSize.small:
        return currencyImage.image(height: 12);
      case IconSize.large:
        return currencyImage.image(height: 18);
    }
  }
}
