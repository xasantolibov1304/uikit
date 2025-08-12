import 'package:flutter/material.dart';
import 'package:iman_uikit/gen/assets.gen.dart';

enum CurrencyType {
  usd,
  uzs,
  rub,
  kzt,
  aed;
}

extension CurrencyExtension on CurrencyType {
  String get name => switch (this) {
        CurrencyType.usd => 'USD',
        CurrencyType.uzs => 'UZS',
        CurrencyType.rub => 'RUB',
        CurrencyType.kzt => 'KZT',
        CurrencyType.aed => 'AED',
      };

  Widget get icon => switch (this) {
        CurrencyType.usd => UikitAssets.flags.usa.svg(),
        CurrencyType.uzs => UikitAssets.flags.uz.svg(),
        CurrencyType.rub => UikitAssets.flags.ru.svg(),
        CurrencyType.kzt => UikitAssets.flags.kz.svg(),
        CurrencyType.aed => UikitAssets.flags.uae.svg(),
      };
}
