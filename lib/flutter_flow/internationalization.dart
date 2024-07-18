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
      'de': 'NFC Scan',
    },
    'mxsmdcar': {
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
      'de': 'Field is required',
    },
    'nbsag65x': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Please choose an option from the dropdown',
    },
    'jnd4hegr': {
      'en': 'Field is required',
      'de': 'Field is required',
    },
    '33jqavdo': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Please choose an option from the dropdown',
    },
    '3futqyst': {
      'en': 'Field is required',
      'de': 'Field is required',
    },
    'u0o8gm80': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Please choose an option from the dropdown',
    },
    'ioh9xjsy': {
      'en': 'Field is required',
      'de': '',
    },
    'gmsfr20x': {
      'en': 'Please choose an option from the dropdown',
      'de': '',
    },
    'd2mg2fv3': {
      'en': 'Home',
      'de': '',
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
      'de': 'Field is required',
    },
    '2zpbyxmv': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Please choose an option from the dropdown',
    },
    'x2befdvy': {
      'en': 'Field is required',
      'de': 'Field is required',
    },
    'he0dkuup': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Please choose an option from the dropdown',
    },
    'vaf6y5am': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // CreateMemories
  {
    'z9czxuh3': {
      'en': 'Add a Title',
      'de': 'Titel hinzufügen',
    },
    'p5x6rhn6': {
      'en': 'Upload Cover Page',
      'de': '',
    },
    '4h30ggiu': {
      'en': 'Next',
      'de': '',
    },
    'sccjx7wi': {
      'en': 'Field is required',
      'de': '',
    },
    'yhffkuys': {
      'en': 'Please choose an option from the dropdown',
      'de': '',
    },
    'kh7kjpgx': {
      'en': 'Select Date',
      'de': '',
    },
    'jzf6h30d': {
      'en': 'Save',
      'de': '',
    },
    'sgmchl0i': {
      'en': 'Create\nMemories',
      'de': '',
    },
    'xpxck8da': {
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
    'oqiavfu6': {
      'en': 'Home',
      'de': '',
    },
  },
  // createMoment
  {
    '81as7ypk': {
      'en': 'Create Moment',
      'de': '',
    },
    '3shdzh77': {
      'en': 'Upload Image',
      'de': '',
    },
    '0rsp50m4': {
      'en': 'Upload Cover Page',
      'de': '',
    },
    'u524vqbc': {
      'en': 'Next',
      'de': '',
    },
    '2x9k2v4y': {
      'en': 'Add Title',
      'de': '',
    },
    'z6kerzdy': {
      'en': 'Note',
      'de': '',
    },
    'xinayci3': {
      'en': 'Photo',
      'de': '',
    },
    '8iy8tb7f': {
      'en': 'Audio',
      'de': '',
    },
    'w85r8uyl': {
      'en': 'Save',
      'de': '',
    },
    'gen3x22y': {
      'en': 'Field is required',
      'de': 'Field is required',
    },
    '0bdxh6k1': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Please choose an option from the dropdown',
    },
    'fbqnfowo': {
      'en': 'Field is required',
      'de': 'Field is required',
    },
    'utualx8t': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Please choose an option from the dropdown',
    },
    'fsf6plm1': {
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
    'ex83b97a': {
      'en': 'Home',
      'de': '',
    },
  },
  // momentDetail
  {
    'er82dmm5': {
      'en': 'Home',
      'de': '',
    },
  },
  // profileDetail
  {
    'p65jxrcj': {
      'en': 'Profile',
      'de': '',
    },
    '4uohkq9t': {
      'en': 'Account',
      'de': '',
    },
    'gbyqq7nq': {
      'en': 'Email ID',
      'de': '',
    },
    'oqkbyuzd': {
      'en': 'Password',
      'de': '',
    },
    '8hbce8b0': {
      'en': '********',
      'de': '',
    },
    'eo4w3r1h': {
      'en': 'Change',
      'de': '',
    },
    'kkx1086u': {
      'en': 'Shared Album',
      'de': '',
    },
    'l1sw5v5d': {
      'en': 'Email ID',
      'de': '',
    },
    'dy9qol50': {
      'en': 'Remove',
      'de': '',
    },
    'wc09zzns': {
      'en': 'Share with an existing user',
      'de': '',
    },
    'p56qj7g1': {
      'en': 'Jewellery',
      'de': '',
    },
    'e2838rm9': {
      'en': 'Change language',
      'de': '',
    },
    'tyu3ip80': {
      'en': 'English',
      'de': '',
    },
    'ravm9mxz': {
      'en': 'German',
      'de': '',
    },
    'gqv9sa85': {
      'en': 'Change background',
      'de': '',
    },
    'idi1um6l': {
      'en': 'Change',
      'de': '',
    },
    'c3rj4p4r': {
      'en': 'Logout',
      'de': '',
    },
    'yh5vfjg9': {
      'en': 'Home',
      'de': '',
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
    'suu8i9fs': {
      'en': 'Field is required',
      'de': 'Field is required',
    },
    'va4vqn3u': {
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
