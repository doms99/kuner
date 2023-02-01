class Constants {
  Constants._();

  static const rotaryChannelId = 'rotary-channel';
  static const ambientChannelId = 'ambient-channel';
  static const methodChannelId = 'method-channel';

  static const defaultConversionRate = 7.5345;
  static const defaultSettingsDecimal = true;
}

class StorageConstants {
  StorageConstants._();

  static const conversionRateKey = 'conversion-rate';

  static const settingsDecimalKey = 'settings-decimal-key';

  static const directionKey = 'direction-key';
  static const inputKey = 'input-key';
  static const outputKey = 'output-key';
}

class API {
  API._();

  static const String baseURL = 'https://api.exchangeratesapi.io';
}
