import 'package:flutter/material.dart';

extension PhoneTextEditingControllerExtension on TextEditingController {
  static final Map<TextEditingController, String> _countryCodes = {};
  String get selectedCountryCode => _countryCodes[this] ?? '964';
  void updateSelectedCountryCode(String countryCode) {
    _countryCodes[this] = countryCode;
  }

  String get fullPhoneNumber => '+$selectedCountryCode$text';
  String get phoneNumberOnly => text;

  void clearCountryCode() {
    _countryCodes.remove(this);
  }

  bool get hasCountryCode => _countryCodes.containsKey(this);
  void initializeCountryCode(String countryCode) {
    if (!hasCountryCode) {
      updateSelectedCountryCode(countryCode);
    }
  }
}
