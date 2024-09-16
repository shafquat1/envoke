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
      'de': 'Melden Sie sich an',
    },
    'w32fjupc': {
      'en': 'Login',
      'de': 'Anmeldung',
    },
    'cw27vr56': {
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
    'ylitu1gq': {
      'en': 'Signup',
      'de': 'Melden Sie sich an',
    },
    '68r368mw': {
      'en': 'Create account and link\nwith Jewelry',
      'de': 'Konto erstellen und verknüpfen\nmit Schmuck',
    },
    'g478xbar': {
      'en': 'First Name',
      'de': 'Vorname',
    },
    '5137an5s': {
      'en': 'Last Name',
      'de': 'Familienname, Nachname',
    },
    'hpbyq7ly': {
      'en': 'Enter Email',
      'de': 'Email eingeben',
    },
    'jsiql9h2': {
      'en': 'Enter Password',
      'de': 'Passwort eingeben',
    },
    'xr7uzhii': {
      'en': 'Accept ',
      'de': 'Akzeptieren',
    },
    'dnymi8uf': {
      'en': 'Terms & Conditions ',
      'de': 'Terms & amp; Bedingungen',
    },
    '4fa93zaz': {
      'en': 'and ',
      'de': 'Und',
    },
    '5rhpo6v0': {
      'en': 'Data Protection ',
      'de': 'Datenschutz',
    },
    'eyul05br': {
      'en': '(Mandatory Field)',
      'de': '(Pflichtfeld)',
    },
    'kjwio9iy': {
      'en': 'Accept terms & conditions and data\nprotection (Mandatory Filed)',
      'de': 'AGB und Datenschutz akzeptieren (Pflichtfeld)',
    },
    'gv40r3er': {
      'en': 'Newsletter (Optional)',
      'de': 'Newsletter (optional)',
    },
    '0dixnnph': {
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
    'd2mg2fv3': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // LoginPage
  {
    '8tm6qur5': {
      'en': 'Login',
      'de': 'Anmeldung',
    },
    'w2rjnafl': {
      'en': 'Email',
      'de': 'Email',
    },
    '3wpagmhf': {
      'en': 'Password',
      'de': 'Passwort',
    },
    '101ejo5b': {
      'en': 'Newsletter (Optional)',
      'de': 'Newsletter (optional)',
    },
    'amai4hjx': {
      'en': 'Login',
      'de': 'Anmeldung',
    },
    'feqb67te': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
    },
    '2zpbyxmv': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
    },
    'ioh9xjsy': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
    },
    'gmsfr20x': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
    },
    'vaf6y5am': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // CreateMemories
  {
    'p7pg9x9v': {
      'en': 'Create Memories',
      'de': 'Erstelle deine Memory',
    },
    'z9czxuh3': {
      'en': 'Add a Title',
      'de': 'Füge einen Titel hinzu',
    },
    'p5x6rhn6': {
      'en': 'Upload Cover Page',
      'de': 'Deckblatt hochladen',
    },
    '4h30ggiu': {
      'en': 'Next',
      'de': 'Nächste',
    },
    'sccjx7wi': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
    },
    'yhffkuys': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
    },
    '39vvgzdw': {
      'en': 'Select Date',
      'de': 'Datum auswählen',
    },
    'jzf6h30d': {
      'en': 'Save',
      'de': 'Speichern',
    },
    'feey2huy': {
      'en': 'Create Memories',
      'de': 'Erstelle deine Memory',
    },
    'sgmchl0i': {
      'en': 'Create\nMemories',
      'de': 'Erinnerungen schaffen',
    },
    'xpxck8da': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // MemoriesTimeline
  {
    'leydr36t': {
      'en': 'Shared by',
      'de': 'Geteilt von',
    },
    'wlbmob1d': {
      'en': 'Admin',
      'de': 'Administrator',
    },
    'oqiavfu6': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // createMoment
  {
    '81as7ypk': {
      'en': 'Create Moment',
      'de': 'Erstelle deinen Moment',
    },
    'wrhahwv0': {
      'en': 'Upload Image',
      'de': 'Bild hochladen',
    },
    '0rsp50m4': {
      'en': 'Upload Cover Page',
      'de': 'Deckblatt hochladen',
    },
    'u524vqbc': {
      'en': 'Next',
      'de': 'Nächste',
    },
    '2x9k2v4y': {
      'en': 'Add Title',
      'de': 'Titel hinzufügen',
    },
    'z6kerzdy': {
      'en': 'Note',
      'de': 'Notiz',
    },
    'xinayci3': {
      'en': 'Photo',
      'de': 'Foto',
    },
    '8iy8tb7f': {
      'en': 'Audio',
      'de': 'Audio',
    },
    'w85r8uyl': {
      'en': 'Save',
      'de': 'Speichern',
    },
    'x2befdvy': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
    },
    'he0dkuup': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
    },
    'gen3x22y': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
    },
    '0bdxh6k1': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
    },
    'fsf6plm1': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // momentTimeline
  {
    'u4z1w7ku': {
      'en': '/',
      'de': '/',
    },
    'yrivibpf': {
      'en': 'Moment',
      'de': 'Moment',
    },
    'ex83b97a': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // momentDetail
  {
    'er82dmm5': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // profileDetail
  {
    'p65jxrcj': {
      'en': 'Profile',
      'de': 'Profil',
    },
    '4uohkq9t': {
      'en': 'Account',
      'de': 'Konto',
    },
    'gbyqq7nq': {
      'en': 'Email ID',
      'de': 'E-Mail-ID',
    },
    'oqkbyuzd': {
      'en': 'Password',
      'de': 'Passwort',
    },
    '8hbce8b0': {
      'en': '********',
      'de': '********',
    },
    'eo4w3r1h': {
      'en': 'Change',
      'de': 'Ändern',
    },
    'kkx1086u': {
      'en': 'Shared Album',
      'de': 'Geteiltes Album',
    },
    'l1sw5v5d': {
      'en': 'Email ID',
      'de': 'E-Mail-ID',
    },
    'dy9qol50': {
      'en': 'Remove',
      'de': 'Entfernen',
    },
    'wc09zzns': {
      'en': 'Share with an existing user',
      'de': 'Mit einem vorhandenen Benutzer teilen',
    },
    'p56qj7g1': {
      'en': 'Jewellery',
      'de': 'Schmuck',
    },
    'e2838rm9': {
      'en': 'Change language',
      'de': 'Sprache ändern',
    },
    'tyu3ip80': {
      'en': 'English',
      'de': 'Englisch',
    },
    'ravm9mxz': {
      'en': 'German',
      'de': 'Deutsch',
    },
    'gqv9sa85': {
      'en': 'Change background',
      'de': 'Hintergrund ändern',
    },
    'idi1um6l': {
      'en': 'Change',
      'de': 'Ändern',
    },
    '1ku15o53': {
      'en': 'Change background',
      'de': '',
    },
    '4h3l4ucc': {
      'en': 'Delete Account',
      'de': '',
    },
    'ubi7codk': {
      'en': 'Delete Account',
      'de': '',
    },
    'c3rj4p4r': {
      'en': 'Logout',
      'de': 'Ausloggen',
    },
    'yh5vfjg9': {
      'en': 'Home',
      'de': 'Heim',
    },
  },
  // EditMemories
  {
    '4jxfqmha': {
      'en': 'Edit Memory',
      'de': 'Speicher bearbeiten',
    },
    'wiw0ksme': {
      'en': 'Add a Title',
      'de': 'Füge einen Titel hinzu',
    },
    'kqwjuxa5': {
      'en': 'Upload Cover Page',
      'de': 'Deckblatt hochladen',
    },
    '37uyt3wt': {
      'en': 'Next',
      'de': 'Nächste',
    },
    '7pqpivef': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
    },
    'g8djrr9b': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
    },
    'hbkmzc6k': {
      'en': 'Edit Memory',
      'de': 'Speicher bearbeiten',
    },
    'l14wcopl': {
      'en': 'Select Date',
      'de': 'Datum auswählen',
    },
    'cs3x4y5t': {
      'en': 'Save',
      'de': 'Speichern',
    },
    'kpmfzkll': {
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
      'de': 'Nähern Sie sich einem NFC-Tag',
    },
    'mzzpfp4l': {
      'en': 'Cancel',
      'de': 'Stornieren',
    },
  },
  // removeOrDeleteAccount
  {
    '7wytdvrx': {
      'en': 'No',
      'de': 'NEIN',
    },
    '12pv03a3': {
      'en': 'Yes',
      'de': 'Ja',
    },
  },
  // addShared
  {
    'zftor8xk': {
      'en': 'Share Moment',
      'de': 'Moment teilen',
    },
    'qoeg2o09': {
      'en': 'Enter Email',
      'de': 'Email eingeben',
    },
    '1xmio5dg': {
      'en': 'Share',
      'de': 'Aktie',
    },
    'fbqnfowo': {
      'en': 'Field is required',
      'de': 'Das Feld ist erforderlich',
    },
    'utualx8t': {
      'en': 'Please choose an option from the dropdown',
      'de': 'Bitte wählen Sie eine Option aus der Dropdown-Liste',
    },
  },
  // deleteDialogue
  {
    'uo1wjarg': {
      'en': 'No',
      'de': 'NEIN',
    },
    '6swf9u4l': {
      'en': 'Yes',
      'de': 'Ja',
    },
  },
  // popUp_menu
  {
    'znee1m7n': {
      'en': 'Edit',
      'de': 'Bearbeiten',
    },
    'ooci75tu': {
      'en': 'Delete',
      'de': 'Löschen',
    },
    'aytokox6': {
      'en': 'Memory',
      'de': 'Memory',
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
      'de': '',
    },
    '0quq8f1g': {
      'en': '',
      'de': '',
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
      'de': '',
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
