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

  /// `email or password isn't correct`
  String get authValidationMessage {
    return Intl.message(
      'email or password isn\'t correct',
      name: 'authValidationMessage',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get homeBottomNav {
    return Intl.message('Home', name: 'homeBottomNav', desc: '', args: []);
  }

  /// `Cart`
  String get cartBottomNav {
    return Intl.message('Cart', name: 'cartBottomNav', desc: '', args: []);
  }

  /// `Profile`
  String get profileBottomNav {
    return Intl.message(
      'Profile',
      name: 'profileBottomNav',
      desc: '',
      args: [],
    );
  }

  /// `search here`
  String get searchText {
    return Intl.message('search here', name: 'searchText', desc: '', args: []);
  }

  /// `Recent product`
  String get recentProduct {
    return Intl.message(
      'Recent product',
      name: 'recentProduct',
      desc: '',
      args: [],
    );
  }

  /// `Delivery address`
  String get deliveryAddress {
    return Intl.message(
      'Delivery address',
      name: 'deliveryAddress',
      desc: '',
      args: [],
    );
  }

  /// `select your delivery address`
  String get selectDeliveryAddress {
    return Intl.message(
      'select your delivery address',
      name: 'selectDeliveryAddress',
      desc: '',
      args: [],
    );
  }

  /// `category`
  String get category {
    return Intl.message('category', name: 'category', desc: '', args: []);
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `search for anything`
  String get searchHintText {
    return Intl.message(
      'search for anything',
      name: 'searchHintText',
      desc: '',
      args: [],
    );
  }

  /// `Cart`
  String get cart {
    return Intl.message('Cart', name: 'cart', desc: '', args: []);
  }

  /// `cart is empty`
  String get cartEmpty {
    return Intl.message('cart is empty', name: 'cartEmpty', desc: '', args: []);
  }

  /// `Order Summery`
  String get cartOrderSummery {
    return Intl.message(
      'Order Summery',
      name: 'cartOrderSummery',
      desc: '',
      args: [],
    );
  }

  /// `Continue for payments`
  String get cartContinueButton {
    return Intl.message(
      'Continue for payments',
      name: 'cartContinueButton',
      desc: '',
      args: [],
    );
  }

  /// `Total`
  String get totalPrice {
    return Intl.message('Total', name: 'totalPrice', desc: '', args: []);
  }

  /// `Products`
  String get cartProducts {
    return Intl.message('Products', name: 'cartProducts', desc: '', args: []);
  }

  /// `Settings`
  String get settings {
    return Intl.message('Settings', name: 'settings', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message('Dark Mode', name: 'darkMode', desc: '', args: []);
  }

  /// `Continue with Credit card`
  String get creditCard {
    return Intl.message(
      'Continue with Credit card',
      name: 'creditCard',
      desc: '',
      args: [],
    );
  }

  /// `Continue with Paypal`
  String get paypal {
    return Intl.message(
      'Continue with Paypal',
      name: 'paypal',
      desc: '',
      args: [],
    );
  }

  /// `Your Transaction is Successful`
  String get transactionSuccessful {
    return Intl.message(
      'Your Transaction is Successful',
      name: 'transactionSuccessful',
      desc: '',
      args: [],
    );
  }

  /// `Thank You!`
  String get thankYou {
    return Intl.message('Thank You!', name: 'thankYou', desc: '', args: []);
  }

  /// `back to home screen`
  String get backToHome {
    return Intl.message(
      'back to home screen',
      name: 'backToHome',
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
