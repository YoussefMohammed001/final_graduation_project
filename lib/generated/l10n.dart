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
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
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
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Manage your health and happy future`
  String get manageYourHealthAndHappyFuture {
    return Intl.message(
      'Manage your health and happy future',
      name: 'manageYourHealthAndHappyFuture',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to HSPC`
  String get welcomeToHSPC {
    return Intl.message(
      'Welcome to HSPC',
      name: 'welcomeToHSPC',
      desc: '',
      args: [],
    );
  }

  /// `Join us now`
  String get joinUsNow {
    return Intl.message(
      'Join us now',
      name: 'joinUsNow',
      desc: '',
      args: [],
    );
  }

  /// `Phone number`
  String get phoneNumber {
    return Intl.message(
      'Phone number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Join now`
  String get joinNow {
    return Intl.message(
      'Join now',
      name: 'joinNow',
      desc: '',
      args: [],
    );
  }

  /// `Don't have account?`
  String get doNotHaveAccount {
    return Intl.message(
      'Don\'t have account?',
      name: 'doNotHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Sign up now`
  String get signUpNow {
    return Intl.message(
      'Sign up now',
      name: 'signUpNow',
      desc: '',
      args: [],
    );
  }

  /// `Forget password`
  String get forgetPassword {
    return Intl.message(
      'Forget password',
      name: 'forgetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signIn {
    return Intl.message(
      'Sign in',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Username`
  String get username {
    return Intl.message(
      'Username',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Re-password`
  String get rePassword {
    return Intl.message(
      'Re-password',
      name: 'rePassword',
      desc: '',
      args: [],
    );
  }

  /// `signUp`
  String get signUp {
    return Intl.message(
      'signUp',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Forget your password?`
  String get forgetYourPass {
    return Intl.message(
      'Forget your password?',
      name: 'forgetYourPass',
      desc: '',
      args: [],
    );
  }

  /// `Don't worry`
  String get doNotWorry {
    return Intl.message(
      'Don\'t worry',
      name: 'doNotWorry',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password`
  String get enterYourPassword {
    return Intl.message(
      'Enter your password',
      name: 'enterYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Send code`
  String get sendCode {
    return Intl.message(
      'Send code',
      name: 'sendCode',
      desc: '',
      args: [],
    );
  }

  /// `Enter OTP sent to your email`
  String get enterOTPSentToYourEmail {
    return Intl.message(
      'Enter OTP sent to your email',
      name: 'enterOTPSentToYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Try again after`
  String get tryAgainAfter {
    return Intl.message(
      'Try again after',
      name: 'tryAgainAfter',
      desc: '',
      args: [],
    );
  }

  /// `Send OTP again`
  String get sendOTPAgain {
    return Intl.message(
      'Send OTP again',
      name: 'sendOTPAgain',
      desc: '',
      args: [],
    );
  }

  /// `Update your password`
  String get updateYourPassword {
    return Intl.message(
      'Update your password',
      name: 'updateYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Hello`
  String get hello {
    return Intl.message(
      'Hello',
      name: 'hello',
      desc: '',
      args: [],
    );
  }

  /// `Hope you are ok?`
  String get hopeYouAreOk {
    return Intl.message(
      'Hope you are ok?',
      name: 'hopeYouAreOk',
      desc: '',
      args: [],
    );
  }

  /// `Search for nearest doctor`
  String get searchForNearestDoctor {
    return Intl.message(
      'Search for nearest doctor',
      name: 'searchForNearestDoctor',
      desc: '',
      args: [],
    );
  }

  /// `Want to predict one of these diseases`
  String get wantToPredictOneOfTheseDiseases {
    return Intl.message(
      'Want to predict one of these diseases',
      name: 'wantToPredictOneOfTheseDiseases',
      desc: '',
      args: [],
    );
  }

  /// `Skin Cancer`
  String get skinCancer {
    return Intl.message(
      'Skin Cancer',
      name: 'skinCancer',
      desc: '',
      args: [],
    );
  }

  /// `Diabetes`
  String get diabetes {
    return Intl.message(
      'Diabetes',
      name: 'diabetes',
      desc: '',
      args: [],
    );
  }

  /// `Heart Diseases`
  String get heartDiseases {
    return Intl.message(
      'Heart Diseases',
      name: 'heartDiseases',
      desc: '',
      args: [],
    );
  }

  /// `Specialists`
  String get specialists {
    return Intl.message(
      'Specialists',
      name: 'specialists',
      desc: '',
      args: [],
    );
  }

  /// `view all`
  String get viewAll {
    return Intl.message(
      'view all',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `Nearest Doctors`
  String get nearestDoctors {
    return Intl.message(
      'Nearest Doctors',
      name: 'nearestDoctors',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Appointments`
  String get appointments {
    return Intl.message(
      'Appointments',
      name: 'appointments',
      desc: '',
      args: [],
    );
  }

  /// `Ny account`
  String get myAccount {
    return Intl.message(
      'Ny account',
      name: 'myAccount',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Book now`
  String get bookNow {
    return Intl.message(
      'Book now',
      name: 'bookNow',
      desc: '',
      args: [],
    );
  }

  /// `Specialization`
  String get specialization {
    return Intl.message(
      'Specialization',
      name: 'specialization',
      desc: '',
      args: [],
    );
  }

  /// `Consulting Price`
  String get consultingPrice {
    return Intl.message(
      'Consulting Price',
      name: 'consultingPrice',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message(
      'Description',
      name: 'description',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get location {
    return Intl.message(
      'Location',
      name: 'location',
      desc: '',
      args: [],
    );
  }

  /// `Choose the gender`
  String get chooseTheGender {
    return Intl.message(
      'Choose the gender',
      name: 'chooseTheGender',
      desc: '',
      args: [],
    );
  }

  /// `male`
  String get maleHint {
    return Intl.message(
      'male',
      name: 'maleHint',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message(
      'Male',
      name: 'male',
      desc: '',
      args: [],
    );
  }

  /// `Female`
  String get female {
    return Intl.message(
      'Female',
      name: 'female',
      desc: '',
      args: [],
    );
  }

  /// `Chest pain type`
  String get chestPainType {
    return Intl.message(
      'Chest pain type',
      name: 'chestPainType',
      desc: '',
      args: [],
    );
  }

  /// `blood pressure`
  String get bloodPressure {
    return Intl.message(
      'blood pressure',
      name: 'bloodPressure',
      desc: '',
      args: [],
    );
  }

  /// `cholesterol`
  String get cholesterol {
    return Intl.message(
      'cholesterol',
      name: 'cholesterol',
      desc: '',
      args: [],
    );
  }

  /// `Typical angina`
  String get typicalAngina {
    return Intl.message(
      'Typical angina',
      name: 'typicalAngina',
      desc: '',
      args: [],
    );
  }

  /// `ATypical angina`
  String get aTypicalAngina {
    return Intl.message(
      'ATypical angina',
      name: 'aTypicalAngina',
      desc: '',
      args: [],
    );
  }

  /// `Non-anginal pain`
  String get nonAnginalPain {
    return Intl.message(
      'Non-anginal pain',
      name: 'nonAnginalPain',
      desc: '',
      args: [],
    );
  }

  /// `Asymptomatic`
  String get asymptomatic {
    return Intl.message(
      'Asymptomatic',
      name: 'asymptomatic',
      desc: '',
      args: [],
    );
  }

  /// `higher than 120`
  String get higherThan120Hint {
    return Intl.message(
      'higher than 120',
      name: 'higherThan120Hint',
      desc: '',
      args: [],
    );
  }

  /// `Higher than 120`
  String get higherThan120 {
    return Intl.message(
      'Higher than 120',
      name: 'higherThan120',
      desc: '',
      args: [],
    );
  }

  /// `Lower than 120`
  String get lowerThan120 {
    return Intl.message(
      'Lower than 120',
      name: 'lowerThan120',
      desc: '',
      args: [],
    );
  }

  /// `electrocardio graphic`
  String get electrocardioGraphic {
    return Intl.message(
      'electrocardio graphic',
      name: 'electrocardioGraphic',
      desc: '',
      args: [],
    );
  }

  /// `number of pregnancies`
  String get numberOfPregnancies {
    return Intl.message(
      'number of pregnancies',
      name: 'numberOfPregnancies',
      desc: '',
      args: [],
    );
  }

  /// `glucose Level`
  String get glucoseLevel {
    return Intl.message(
      'glucose Level',
      name: 'glucoseLevel',
      desc: '',
      args: [],
    );
  }

  /// `skin thickness`
  String get skinThickness {
    return Intl.message(
      'skin thickness',
      name: 'skinThickness',
      desc: '',
      args: [],
    );
  }

  /// `insulin level`
  String get insulinLevel {
    return Intl.message(
      'insulin level',
      name: 'insulinLevel',
      desc: '',
      args: [],
    );
  }

  /// `body mass index`
  String get bodyMassIndex {
    return Intl.message(
      'body mass index',
      name: 'bodyMassIndex',
      desc: '',
      args: [],
    );
  }

  /// `Diabetes pedigree function`
  String get diabetesPedigreeFunction {
    return Intl.message(
      'Diabetes pedigree function',
      name: 'diabetesPedigreeFunction',
      desc: '',
      args: [],
    );
  }

  /// `Patient age in years`
  String get patientAgeInYears {
    return Intl.message(
      'Patient age in years',
      name: 'patientAgeInYears',
      desc: '',
      args: [],
    );
  }

  /// `Predict`
  String get predict {
    return Intl.message(
      'Predict',
      name: 'predict',
      desc: '',
      args: [],
    );
  }

  /// `Attach photo of the skin`
  String get attachPhotoOfTheSkin {
    return Intl.message(
      'Attach photo of the skin',
      name: 'attachPhotoOfTheSkin',
      desc: '',
      args: [],
    );
  }

  /// `attach photo`
  String get attachPhoto {
    return Intl.message(
      'attach photo',
      name: 'attachPhoto',
      desc: '',
      args: [],
    );
  }

  /// `chang photo`
  String get changePhoto {
    return Intl.message(
      'chang photo',
      name: 'changePhoto',
      desc: '',
      args: [],
    );
  }

  /// `Result`
  String get result {
    return Intl.message(
      'Result',
      name: 'result',
      desc: '',
      args: [],
    );
  }

  /// `Specialized Doctors`
  String get specializedDoctors {
    return Intl.message(
      'Specialized Doctors',
      name: 'specializedDoctors',
      desc: '',
      args: [],
    );
  }

  /// `Current`
  String get ccurrent {
    return Intl.message(
      'Current',
      name: 'ccurrent',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get previous {
    return Intl.message(
      'Previous',
      name: 'previous',
      desc: '',
      args: [],
    );
  }

  /// `There are no reservation yet`
  String get thereAreNoReservationYet {
    return Intl.message(
      'There are no reservation yet',
      name: 'thereAreNoReservationYet',
      desc: '',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `About us`
  String get aboutUs {
    return Intl.message(
      'About us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions`
  String get termsAndConditions {
    return Intl.message(
      'Terms & Conditions',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  /// `Contact us`
  String get contactUs {
    return Intl.message(
      'Contact us',
      name: 'contactUs',
      desc: '',
      args: [],
    );
  }

  /// `Edit my data`
  String get editMyData {
    return Intl.message(
      'Edit my data',
      name: 'editMyData',
      desc: '',
      args: [],
    );
  }

  /// `Change password`
  String get changePassword {
    return Intl.message(
      'Change password',
      name: 'changePassword',
      desc: '',
      args: [],
    );
  }

  /// `Delete account`
  String get deleteAccount {
    return Intl.message(
      'Delete account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password`
  String get forgotPassword {
    return Intl.message(
      'Forgot password',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your password to delete your account`
  String get enterYourPasswordToDeleteAccount {
    return Intl.message(
      'Enter your password to delete your account',
      name: 'enterYourPasswordToDeleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to logOut?`
  String get doYouWantToLogOut {
    return Intl.message(
      'Do you want to logOut?',
      name: 'doYouWantToLogOut',
      desc: '',
      args: [],
    );
  }

  /// `No stat here`
  String get noStayHere {
    return Intl.message(
      'No stat here',
      name: 'noStayHere',
      desc: '',
      args: [],
    );
  }

  /// `LOG OUT`
  String get logOUT {
    return Intl.message(
      'LOG OUT',
      name: 'logOUT',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Arabic`
  String get arabic {
    return Intl.message(
      'Arabic',
      name: 'arabic',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Enter your note`
  String get enterYourNote {
    return Intl.message(
      'Enter your note',
      name: 'enterYourNote',
      desc: '',
      args: [],
    );
  }

  /// `Enter your name`
  String get enterYourName {
    return Intl.message(
      'Enter your name',
      name: 'enterYourName',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enterYourEmail {
    return Intl.message(
      'Enter your email',
      name: 'enterYourEmail',
      desc: '',
      args: [],
    );
  }

  /// `Save changes`
  String get saveChanges {
    return Intl.message(
      'Save changes',
      name: 'saveChanges',
      desc: '',
      args: [],
    );
  }

  /// `FAQS`
  String get faqs {
    return Intl.message(
      'FAQS',
      name: 'faqs',
      desc: '',
      args: [],
    );
  }

  /// `current password`
  String get currentPassword {
    return Intl.message(
      'current password',
      name: 'currentPassword',
      desc: '',
      args: [],
    );
  }

  /// `new password`
  String get newPass {
    return Intl.message(
      'new password',
      name: 'newPass',
      desc: '',
      args: [],
    );
  }

  /// `Change Language`
  String get changeLang {
    return Intl.message(
      'Change Language',
      name: 'changeLang',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get note {
    return Intl.message(
      'Note',
      name: 'note',
      desc: '',
      args: [],
    );
  }

  /// `Send`
  String get send {
    return Intl.message(
      'Send',
      name: 'send',
      desc: '',
      args: [],
    );
  }

  /// `already have account?`
  String get alreadyHaveAccount {
    return Intl.message(
      'already have account?',
      name: 'alreadyHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `SKIP`
  String get skip {
    return Intl.message(
      'SKIP',
      name: 'skip',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Lets start`
  String get letsStart {
    return Intl.message(
      'Lets start',
      name: 'letsStart',
      desc: '',
      args: [],
    );
  }

  /// `Verify Your Account`
  String get verifyYourAccount {
    return Intl.message(
      'Verify Your Account',
      name: 'verifyYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `to complete your registration`
  String get toCompleteYourRegistration {
    return Intl.message(
      'to complete your registration',
      name: 'toCompleteYourRegistration',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message(
      'Verify',
      name: 'verify',
      desc: '',
      args: [],
    );
  }

  /// `Congrats!`
  String get congrats {
    return Intl.message(
      'Congrats!',
      name: 'congrats',
      desc: '',
      args: [],
    );
  }

  /// `You have successfully change password!`
  String get youHaveSuccessfullyChangePassword {
    return Intl.message(
      'You have successfully change password!',
      name: 'youHaveSuccessfullyChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `Please use the new password when logging in`
  String get pleaseUseTheNewPasswordWhenLoggingIn {
    return Intl.message(
      'Please use the new password when logging in',
      name: 'pleaseUseTheNewPasswordWhenLoggingIn',
      desc: '',
      args: [],
    );
  }

  /// `Back To Login`
  String get backToLogin {
    return Intl.message(
      'Back To Login',
      name: 'backToLogin',
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
