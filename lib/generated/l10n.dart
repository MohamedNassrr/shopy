// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Welcome to `
  String get loginWelcome {
    return Intl.message(
      'Welcome to ',
      name: 'loginWelcome',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continueButton {
    return Intl.message('Continue', name: 'continueButton', desc: '', args: []);
  }

  /// `email address`
  String get emailForm {
    return Intl.message('email address', name: 'emailForm', desc: '', args: []);
  }

  /// `email address cannot be empty`
  String get emailValidation {
    return Intl.message(
      'email address cannot be empty',
      name: 'emailValidation',
      desc: '',
      args: [],
    );
  }

  /// `password cannot be empty`
  String get passwordValidation {
    return Intl.message(
      'password cannot be empty',
      name: 'passwordValidation',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get passwordForm {
    return Intl.message('password', name: 'passwordForm', desc: '', args: []);
  }

  /// `Forget Password?`
  String get forgetPassword {
    return Intl.message(
      'Forget Password?',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `or`
  String get orText {
    return Intl.message('or', name: 'orText', desc: '', args: []);
  }

  /// `Don't have an account yet?`
  String get registryText {
    return Intl.message(
      'Don\'t have an account yet?',
      name: 'registryText',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message('Register', name: 'register', desc: '', args: []);
  }

  /// `Now`
  String get now {
    return Intl.message('Now', name: 'now', desc: '', args: []);
  }

  /// `enter email`
  String get emailForgetForm {
    return Intl.message(
      'enter email',
      name: 'emailForgetForm',
      desc: '',
      args: [],
    );
  }

  /// `please enter email`
  String get emailForgetValidation {
    return Intl.message(
      'please enter email',
      name: 'emailForgetValidation',
      desc: '',
      args: [],
    );
  }

  /// `send code`
  String get emailForgetSendButton {
    return Intl.message(
      'send code',
      name: 'emailForgetSendButton',
      desc: '',
      args: [],
    );
  }

  /// `username`
  String get registerUserName {
    return Intl.message(
      'username',
      name: 'registerUserName',
      desc: '',
      args: [],
    );
  }

  /// `username mustn't be empty`
  String get registerUserValid {
    return Intl.message(
      'username mustn\'t be empty',
      name: 'registerUserValid',
      desc: '',
      args: [],
    );
  }

  /// `name@example.com`
  String get registerEmail {
    return Intl.message(
      'name@example.com',
      name: 'registerEmail',
      desc: '',
      args: [],
    );
  }

  /// `email mustn't be empty`
  String get registerEmailValid {
    return Intl.message(
      'email mustn\'t be empty',
      name: 'registerEmailValid',
      desc: '',
      args: [],
    );
  }

  /// `password`
  String get registerPassword {
    return Intl.message(
      'password',
      name: 'registerPassword',
      desc: '',
      args: [],
    );
  }

  /// `password mustn't be empty`
  String get registerPasswordValid {
    return Intl.message(
      'password mustn\'t be empty',
      name: 'registerPasswordValid',
      desc: '',
      args: [],
    );
  }

  /// `confirm`
  String get registerPasswordConfirm {
    return Intl.message(
      'confirm',
      name: 'registerPasswordConfirm',
      desc: '',
      args: [],
    );
  }

  /// `password didn't match`
  String get registerPasswordConfirmValid {
    return Intl.message(
      'password didn\'t match',
      name: 'registerPasswordConfirmValid',
      desc: '',
      args: [],
    );
  }

  /// `01234567890`
  String get registerPhone {
    return Intl.message(
      '01234567890',
      name: 'registerPhone',
      desc: '',
      args: [],
    );
  }

  /// `phone mustn't be empty`
  String get registerPhoneValid {
    return Intl.message(
      'phone mustn\'t be empty',
      name: 'registerPhoneValid',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
