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
    'uk6jj2ez': {
      'en': 'Signup',
      'de': 'Registrieren',
    },
    'w32fjupc': {
      'en': 'Login',
      'de': 'Login',
    },
    'cw27vr56': {
      'en': 'NFC Scan',
      'de': '',
    },
    'd2mg2fv3': {
      'en': 'Home',
      'de': '',
    },
  },
  // SignupPage
  {
    'ylitu1gq': {
      'en': 'Signup',
      'de': 'Registrieren',
    },
    '68r368mw': {
      'en': 'Create account and link\nwith Jewelry',
      'de': 'Account erstellen und\nmit Jewelryverbinden',
    },
    'g478xbar': {
      'en': 'First Name',
      'de': 'Vorname',
    },
    '5137an5s': {
      'en': 'Last Name',
      'de': 'Nachname',
    },
    'hpbyq7ly': {
      'en': 'Enter Email',
      'de': 'Email-Adresse',
    },
    'jsiql9h2': {
      'en': 'Enter Password',
      'de': 'Passwort festlegen',
    },
    'xr7uzhii': {
      'en': 'Accept ',
      'de': 'Ich bin mit den',
    },
    'dnymi8uf': {
      'en': 'Terms & Conditions ',
      'de': 'Allgemeinen Geschäftsbedingungen',
    },
    '4fa93zaz': {
      'en': 'and ',
      'de': 'Und der',
    },
    '5rhpo6v0': {
      'en': 'Data Protection ',
      'de': 'Datenschutzerklärung',
    },
    'eyul05br': {
      'en': '(Mandatory Field)',
      'de': '(einverstanden)',
    },
    'kjwio9iy': {
      'en': 'Accept terms & conditions and data\nprotection (Mandatory Filed)',
      'de':
          'Ich bin mit den Allgemeinen Geschäftsbedingungen Und der Datenschutzerklärung (einverstanden)',
    },
    'gv40r3er': {
      'en': 'Newsletter (Optional)',
      'de': 'Newsletter (optional)',
    },
    '0dixnnph': {
      'en': 'Signup',
      'de': 'Registrieren',
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
    '3futqyst': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
    },
    'u0o8gm80': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
    },
    '99krpiap': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
    },
    'dgnbbwcm': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
    },
    'vaf6y5am': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // LoginPage
  {
    'unc10t38': {
      'en': 'Login',
      'de': 'Login',
    },
    'yd4eo0sb': {
      'en': 'Email',
      'de': 'Email',
    },
    'ik6zt5el': {
      'en': 'Password',
      'de': 'Passwort',
    },
    'ld0i6ng9': {
      'en': 'Newsletter (Optional)',
      'de': 'Newsletter (Optional)',
    },
    '8wlncbon': {
      'en': 'Login',
      'de': 'Login',
    },
    'feqb67te': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
    },
    '2zpbyxmv': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
    },
    'x2befdvy': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
    },
    'he0dkuup': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
    },
    'xpxck8da': {
      'en': 'Home',
      'de': '',
    },
  },
  // CreateMemories
  {
    'z9czxuh3': {
      'en': 'Add a Title',
      'de': 'Titel hinzufügen',
    },
    'ocayeenx': {
      'en': 'Upload Cover Page',
      'de': 'Upload Cover Page',
    },
    'ywfvksyu': {
      'en': 'Next',
      'de': 'Next',
    },
    'gen3x22y': {
      'en': 'Field is required',
      'de': 'Field is required',
    },
    '0bdxh6k1': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Please choose an option from the dropdown',
    },
    '67fiycm4': {
      'en': 'Select Date',
      'de': 'Select Date',
    },
    'adnw6ctu': {
      'en': 'Save',
      'de': 'Save',
    },
    '78xy7mn5': {
      'en': 'Create\nMemories',
      'de': 'Memory erstellen',
    },
    'oqiavfu6': {
      'en': 'Home',
      'de': '',
    },
  },
  // MemoriesTimeline
  {
    '4qj8i09j': {
      'en': 'Shared by',
      'de': 'Shared by',
    },
    'rr7kpabr': {
      'en': 'Admin',
      'de': '',
    },
    'fsf6plm1': {
      'en': 'Home',
      'de': '',
    },
  },
  // createMoment
  {
    'f3dazzzd': {
      'en': 'Create Moment',
      'de': 'Moment erstellen',
    },
    '5alyusf7': {
      'en': 'Upload Image',
      'de': '',
    },
    '9lrq4761': {
      'en': 'Upload Cover Page',
      'de': 'Upload Cover Page',
    },
    'a8f5zeo9': {
      'en': 'Next',
      'de': 'Next',
    },
    'hqsbxj6p': {
      'en': 'Add Title',
      'de': 'Titel hinzufügen',
    },
    '8dphrngn': {
      'en': 'Note',
      'de': '',
    },
    '028dio4c': {
      'en': 'Photo',
      'de': 'Photo',
    },
    'pcv316fz': {
      'en': 'Audio',
      'de': '',
    },
    'n6siqkz1': {
      'en': 'Save',
      'de': 'Save',
    },
    'fbqnfowo': {
      'en': 'Field is required',
      'de': 'Field is required',
    },
    'utualx8t': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Please choose an option from the dropdown',
    },
    'suu8i9fs': {
      'en': 'Field is required',
      'de': 'Field is required',
    },
    'va4vqn3u': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Please choose an option from the dropdown',
    },
    'ex83b97a': {
      'en': 'Home',
      'de': '',
    },
  },
  // momentTimeline
  {
    'dbrr87f2': {
      'en': '/',
      'de': '',
    },
    'er82dmm5': {
      'en': 'Home',
      'de': '',
    },
  },
  // momentDetail
  {
    'yh5vfjg9': {
      'en': 'Home',
      'de': '',
    },
  },
  // profileDetail
  {
    'n8v9f64u': {
      'en': 'Profile',
      'de': 'Profil',
    },
    'fnqnsi0a': {
      'en': 'Account',
      'de': 'Account',
    },
    'fvy1beav': {
      'en': 'Email ID',
      'de': 'Email ID',
    },
    '0cehfw1e': {
      'en': 'Password',
      'de': 'Passwort',
    },
    'w1odirgf': {
      'en': '********',
      'de': '********',
    },
    'ys9vt5jj': {
      'en': 'Change',
      'de': 'Ändern',
    },
    '36r9wnme': {
      'en': 'Shared Album',
      'de': 'Geteiltes Album',
    },
    'h0rqwljz': {
      'en': 'Email ID',
      'de': 'Email ID',
    },
    '8gqg9k68': {
      'en': 'Remove',
      'de': 'Remove',
    },
    '83ms76z2': {
      'en': 'Share with an existing user',
      'de': 'Mit anderem User teilen',
    },
    '0ku1eg0e': {
      'en': 'Jewellery',
      'de': 'Jewellery',
    },
    'tfey64cp': {
      'en': 'Change language',
      'de': 'Sprache ändern',
    },
    'c0ks10l9': {
      'en': 'English',
      'de': 'Englisch',
    },
    '54vtm9lz': {
      'en': 'German',
      'de': 'Deutsch',
    },
    'f0mydqig': {
      'en': 'Change background',
      'de': 'Change background',
    },
    'n82pdtuj': {
      'en': 'Change',
      'de': 'Ändern',
    },
    '4ogb93fp': {
      'en': 'Logout',
      'de': 'Ausloggen',
    },
    'ordopf1f': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // nfcScanTag
  {
    'vsy7p8pj': {
      'en': 'Ready to scan',
      'de': 'Bereit zum Scannen',
    },
    '7b9md3sy': {
      'en': 'Approach an NFC tag',
      'de': 'Schmuck an das Smartphone halten',
    },
    'mzzpfp4l': {
      'en': 'Cancel',
      'de': 'abbrechen',
    },
  },
  // writeNfcTag
  {
    'tvkw1m40': {
      'en': 'Ready to scan',
      'de': 'Bereit zum Scannen',
    },
    'ow2e8xeh': {
      'en': 'Approach an NFC tag',
      'de': '',
    },
    'mg5431fe': {
      'en': 'Cancel',
      'de': 'abbrechen',
    },
  },
  // removeShared
  {
    'aqp2m3jq': {
      'en': 'Do you want to Remove?',
      'de': 'Do you want to Remove?',
    },
    '7wytdvrx': {
      'en': 'No',
      'de': 'No',
    },
    '12pv03a3': {
      'en': 'Yes',
      'de': '',
    },
  },
  // addShared
  {
    'zftor8xk': {
      'en': 'Share Moment',
      'de': 'Share Moment',
    },
    'qoeg2o09': {
      'en': 'Enter Email',
      'de': 'Enter Email',
    },
    '1xmio5dg': {
      'en': 'Share',
      'de': 'Share',
    },
    '8be8x666': {
      'en': 'Field is required',
      'de': 'Field is required',
    },
    'batzkmda': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Please choose an option from the dropdown',
    },
  },
  // deleteMemories
  {
    '5bayhefh': {
      'en': 'Do you want to remove this memory?',
      'de': 'Do you want to remove this memory?',
    },
    'pszy2g5t': {
      'en': 'No',
      'de': 'No',
    },
    '6fbro7s3': {
      'en': 'Yes',
      'de': 'Yes',
    },
  },
  // deleteMoment
  {
    '4csbh6wk': {
      'en': 'Do you want to remove this moment?',
      'de': 'Do you want to remove this moment?',
    },
    'uo1wjarg': {
      'en': 'No',
      'de': 'No',
    },
    '6swf9u4l': {
      'en': 'Yes',
      'de': '',
    },
  },
  // Miscellaneous
  {
    'i360jk6w': {
      'en':
          'In order to take a picture or video, this app requires permission to access the camera.',
      'de': '',
    },
    'l0nkifdh': {
      'en':
          'In order to upload data, this app requires permission to access the photo library.',
      'de': '',
    },
    'a3temrxl': {
      'en': 'This app requires permissions to record audio.',
      'de': '',
    },
    'zmw2s4jz': {
      'en': '',
      'de': '',
    },
    'w65jn2kp': {
      'en': '',
      'de': '',
    },
    '6a8qmc9v': {
      'en': '',
      'de': '',
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
      'de': '',
    },
    '9h16jelt': {
      'en': '',
      'de': '',
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
      'de': 'Quelle wählen',
    },
    '0quq8f1g': {
      'en': '',
      'de': 'Galarie',
    },
    'tv7tmm0k': {
      'en': '',
      'de': '',
    },
    'x31ct6km': {
      'en': '',
      'de': '',
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
