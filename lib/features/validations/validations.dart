import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:exam_app/core/languages/locale_keys.g.dart';

class Validations {
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validations_password_required.tr();
    }

    if (!value.contains(RegExp(r'[a-z]'))) {
      return LocaleKeys.validations_set_password_1_condition_error.tr();
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return LocaleKeys.validations_set_password_2_condition_error.tr();
    }
    if (!value.contains(RegExp(r'[0-9]'))) {
      return LocaleKeys.validations_set_password_3_condition_error.tr();
    }

    if (!value.contains(
      RegExp(r'[!@#\$%\^&\*\(\)_\-\+=\[\]\{\};:\,<>\./\\|~`]'),
    )) {
      return LocaleKeys.validations_set_password_4_condition_error.tr();
    }

    if (value.length < 6 || value.length > 30) {
      return LocaleKeys.validations_set_password_5_condition_error.tr();
    }

    return null;
  }

  static String? validatePasswordVerification(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validations_confirm_password.tr();
    } else if (value != password) {
      return LocaleKeys.validations_confirm_password_invalid.tr();
    }
    return null;
  }

  static String? validateLoginPassword(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validations_password_required.tr();
    }
    return null;
  }

  static String? validatePhoneNumber(String? value, int phoneLength) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validations_phone_required.tr();
    } else if (value.length < phoneLength) {
      return LocaleKeys.validations_phone_invalid.tr();
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validations_name_required.tr();
    } else {
      return null;
    }
  }

  static String? validatePin(String? value, int length) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validations_pin_required.tr();
    }
    if (value.length != length) {
      return LocaleKeys.validations_pin_invalid.tr();
    } else {
      return null;
    }
  }

  static String? validateUserImage(File? value) {
    if (value == null) {
      return LocaleKeys.validations_profile_image.tr();
    } else {
      return null;
    }
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validations_email_required.tr();
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

    if (!emailRegex.hasMatch(value)) {
      return LocaleKeys.validations_email_invalid.tr();
    }

    return null;
  }

  static String? validateUserName(String? value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.validations_username_required.tr();
    }

    return null;
  }
}