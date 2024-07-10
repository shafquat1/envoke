import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'de'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? deText = '',
  }) =>
      [enText, deText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // EntryScreen
  {
    '8bauxdju': {
      'en': 'Signup',
      'de': 'Melden Sie sich an',
    },
    'x4rfwak8': {
      'en': 'Login',
      'de': 'Anmeldung',
    },
    '9tyh2n55': {
      'en': 'NFC Scan',
      'de': 'NFC-Scan',
    },
    'mxsmdcar': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // SignupPage
  {
    'g29afgtn': {
      'en': 'Signup',
      'de': 'Melden Sie sich an',
    },
    'r8vanqci': {
      'en': 'Create account and link\nwith Jewelry',
      'de': 'Konto erstellen und verknüpfen\nmit Schmuck',
    },
    'mzmzndvg': {
      'en': 'First Name',
      'de': 'Vorname',
    },
    'okn0atwy': {
      'en': 'Last Name',
      'de': 'Familienname, Nachname',
    },
    'd7l42iea': {
      'en': 'Enter Email',
      'de': 'Email eingeben',
    },
    'mdxrsfez': {
      'en': 'Enter Password',
      'de': 'Passwort eingeben',
    },
    'l4chstq1': {
      'en': 'Accept ',
      'de': 'Akzeptieren',
    },
    '7jgms7a2': {
      'en': 'Terms & Conditions ',
      'de': 'Terms & amp; Bedingungen',
    },
    's24pf2te': {
      'en': 'and ',
      'de': 'Und',
    },
    'jgbv43s2': {
      'en': 'Data Protection ',
      'de': 'Datenschutz',
    },
    't6hcum7a': {
      'en': '(Mandatory Field)',
      'de': '(Pflichtfeld)',
    },
    'jygty3b5': {
      'en': 'Accept terms & conditions and data\nprotection (Mandatory Filed)',
      'de': 'AGB und Datenschutz akzeptieren (Pflichtfeld)',
    },
    'q9cpenar': {
      'en': 'Newsletter (Optional)',
      'de': 'Newsletter (optional)',
    },
    'nzu73ybr': {
      'en': 'Signup',
      'de': 'Melden Sie sich an',
    },
    'hn7facjc': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
    },
    'nbsag65x': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
    },
    'jnd4hegr': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
    },
    '33jqavdo': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
    },
    'wjx2t0tb': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
    },
    'vveq3zom': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
    },
    'bqapgnbs': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
    },
    '7unbl7kc': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
    },
    '5uhrnz4a': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // LoginPage
  {
    'yv85sux6': {
      'en': 'Login',
      'de': 'Anmeldung',
    },
    'plhe2fq4': {
      'en': 'Email',
      'de': 'Email',
    },
    'zv114nrz': {
      'en': 'Password',
      'de': 'Passwort',
    },
    '87x4eu1b': {
      'en': 'Newsletter (Optional)',
      'de': 'Newsletter (optional)',
    },
    '1rp3sxed': {
      'en': 'Login',
      'de': 'Login',
    },
    'jh9unk20': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
    },
    'c0195scg': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
    },
    'w3kbpedn': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
    },
    '9m5a6hgk': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
    },
    '2apy5h91': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // CreateMemories
  {
    'z9czxuh3': {
      'en': 'Add a Title',
      'de': 'Füge einen Titel hinzu',
    },
    '8lkntg0d': {
      'en': 'Upload Cover Page',
      'de': 'Deckblatt hochladen',
    },
    'tdmtpwlw': {
      'en': 'Next',
      'de': 'Nächste',
    },
    '104lv5k3': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
    },
    '6vddfctb': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
    },
    'kh7kjpgx': {
      'en': 'Select Date',
      'de': 'Datum auswählen',
    },
    'jzf6h30d': {
      'en': 'Save',
      'de': 'Speichern',
    },
    'po5axe7a': {
      'en': 'Create\nMemories',
      'de': 'Memory \nerstellen',
    },
    '486vl2i8': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // MemoriesTimeline
  {
    'mlh4k9n0': {
      'en': 'Shared by',
      'de': 'Geteilt von',
    },
    'wlbmob1d': {
      'en': 'Admin',
      'de': 'Administrator',
    },
    'y4seugcy': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // createMoment
  {
    'pvdu758k': {
      'en': 'Create Moment',
      'de': 'Moment erstellen',
    },
    'hqsbxj6p': {
      'en': 'Add Title',
      'de': 'Titel hinzufügen',
    },
    '8dphrngn': {
      'en': 'Note',
      'de': 'Notiz',
    },
    'svm5xn61': {
      'en': 'Photo',
      'de': 'Foto',
    },
    'pcv316fz': {
      'en': 'Audio',
      'de': 'Audio',
    },
    'kk3tofj5': {
      'en': 'Save',
      'de': 'Speichern',
    },
    'ouc01oo8': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
    },
    '6dzvivda': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
    },
    'wusawv25': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
    },
    'tq9pkci7': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
    },
    '5n1nm35a': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // momentTimeline
  {
    '07lvnb36': {
      'en': '/',
      'de': '/',
    },
    'nbrbd9lm': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // momentDetail
  {
    'uexcw5bt': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // profileDetail
  {
    '4b0rqxol': {
      'en': 'Profile',
      'de': 'Profil',
    },
    '5tllo5ij': {
      'en': 'Account',
      'de': 'Account',
    },
    'i03wi7q2': {
      'en': 'Email ID',
      'de': 'E-Mail-ID',
    },
    'ooblk8o7': {
      'en': 'Password',
      'de': 'Passwort',
    },
    'he3snuh7': {
      'en': '********',
      'de': '********',
    },
    'gxczi6tw': {
      'en': 'Change',
      'de': 'Ändern',
    },
    'kdhbogbp': {
      'en': 'Shared Album',
      'de': 'Geteiltes Album',
    },
    'vy8ziskk': {
      'en': 'Email ID',
      'de': 'E-Mail-ID',
    },
    '6v99qqye': {
      'en': 'Remove',
      'de': 'Entfernen',
    },
    'k3fxxds1': {
      'en': 'Share with an existing user',
      'de': 'Mit einem vorhandenen Benutzer teilen',
    },
    '84zkepek': {
      'en': 'Jewellery',
      'de': 'Schmuck',
    },
    'wrhahwv0': {
      'en': 'Change language',
      'de': 'Sprache ändern',
    },
    '52or7oq4': {
      'en': 'English',
      'de': 'Englisch',
    },
    'kqfv8huh': {
      'en': 'German',
      'de': 'Ändern',
    },
    'gqv9sa85': {
      'en': 'Change background',
      'de': 'Hintergrund ändern',
    },
    'ueqglvg7': {
      'en': 'Change',
      'de': 'Ändern',
    },
    'n8qmq6kn': {
      'en': 'Logout',
      'de': 'Ausloggen',
    },
    'htuashun': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // nfcScanTag
  {
    '573e8toi': {
      'en': 'Ready to scan',
      'de': 'Bereit zum Scannen',
    },
    'tqi77a8b': {
      'en': 'Approach an NFC tag',
      'de': 'Schmuck an das Smartphone halten',
    },
    'm7sxf65m': {
      'en': 'Cancel',
      'de': 'abbrechen',
    },
  },
  // writeNfcTag
  {
    'clgfwm63': {
      'en': 'Ready to scan',
      'de': 'Bereit zum Scannen',
    },
    'ojv73js6': {
      'en': 'Approach an NFC tag',
      'de': 'Schmuck an das Smartphone halten',
    },
    't38133jg': {
      'en': 'Cancel',
      'de': 'Stornieren',
    },
  },
  // removeShared
  {
    'kxspqn1p': {
      'en': 'Do you want to Remove?',
      'de': 'Möchten Sie entfernen?',
    },
    'l8ak8h1l': {
      'en': 'No',
      'de': 'NEIN',
    },
    'zdojvoyq': {
      'en': 'Yes',
      'de': 'Ja',
    },
  },
  // addShared
  {
    '5qaemse6': {
      'en': 'Share Moment',
      'de': 'Moment teilen',
    },
    'o4lbzebi': {
      'en': 'Enter Email',
      'de': 'Email eingeben',
    },
    '8xnosua5': {
      'en': 'Share',
      'de': 'Aktie',
    },
    '1ew1upa7': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
    },
    'fpom40qm': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
    },
  },
  // deleteMemories
  {
    'd3jua6u7': {
      'en': 'Do you want to remove this memory?',
      'de': 'Möchten Sie diesen Speicher entfernen?',
    },
    '0my93jvm': {
      'en': 'No',
      'de': 'NEIN',
    },
    '27upjych': {
      'en': 'Yes',
      'de': 'Ja',
    },
  },
  // deleteMoment
  {
    'y40vfda4': {
      'en': 'Do you want to remove this moment?',
      'de': 'Möchten Sie diesen Moment entfernen?',
    },
    'dshwdki0': {
      'en': 'No',
      'de': 'NEIN',
    },
    'z0syegbd': {
      'en': 'Yes',
      'de': 'Ja',
    },
  },
  // Miscellaneous
  {
    'i360jk6w': {
      'en':
          'In order to take a picture or video, this app requires permission to access the camera.',
      'de':
          'Um ein Bild oder Video aufzunehmen, benötigt diese App die Berechtigung für den Zugriff auf die Kamera.',
    },
    'l0nkifdh': {
      'en':
          'In order to upload data, this app requires permission to access the photo library.',
      'de':
          'Zum Hochladen von Daten benötigt diese App eine Berechtigung zum Zugriff auf die Fotobibliothek.',
    },
    'a3temrxl': {
      'en': 'This app requires permissions to record audio.',
      'de': 'Diese App erfordert Berechtigungen zum Aufzeichnen von Audio.',
    },
    'zmw2s4jz': {
      'en': '',
      'de': '',
    },
    'w65jn2kp': {
      'en': '',
      'de': 'E-Mail zum Zurücksetzen des Passworts gesendet!',
    },
    '6a8qmc9v': {
      'en': '',
      'de': 'Email erforderlich!',
    },
    'da6s0zyf': {
      'en': '',
      'de': '',
    },
    'qk3sky9j': {
      'en': '',
      'de': '',
    },
    'hijzusyl': {
      'en': '',
      'de': '',
    },
    '26sh39le': {
      'en': '',
      'de': '',
    },
    'ky9w5y0f': {
      'en': '',
      'de': '',
    },
    '234uxigr': {
      'en': '',
      'de': '',
    },
    'ipw8md7c': {
      'en': '',
      'de': 'E-Mail wird bereits von einem anderen Konto verwendet',
    },
    '9h16jelt': {
      'en': '',
      'de':
          'Die angegebenen Authentifizierungsdaten sind falsch, fehlerhaft oder abgelaufen',
    },
    '4ti735qg': {
      'en': '',
      'de': '',
    },
    'je3n5iy4': {
      'en': '',
      'de': '',
    },
    'kyz0rq1n': {
      'en': '',
      'de': '',
    },
    'waakr2vf': {
      'en': '',
      'de': '',
    },
    '69memqkb': {
      'en': '',
      'de': '',
    },
    '1upvf0i7': {
      'en': '',
      'de': 'Quelle Wählen',
    },
    '0quq8f1g': {
      'en': '',
      'de': 'Galerie',
    },
    'tv7tmm0k': {
      'en': '',
      'de': 'Galerie',
    },
    'x31ct6km': {
      'en': '',
      'de': 'Galerie',
    },
    'w0wctoy5': {
      'en': '',
      'de': 'Kamera',
    },
    'bjertfl5': {
      'en': '',
      'de': '',
    },
    'mcj9t504': {
      'en': '',
      'de': '',
    },
    'ss8yn79f': {
      'en': '',
      'de': '',
    },
    '7qqnf8ay': {
      'en': '',
      'de': '',
    },
  },
].reduce((a, b) => a..addAll(b));
