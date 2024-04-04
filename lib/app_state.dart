import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _userGuid = prefs.getString('ff_userGuid') ?? _userGuid;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _nfcTag = '';
  String get nfcTag => _nfcTag;
  set nfcTag(String value) {
    _nfcTag = value;
  }

  String _nfcUserId = '';
  String get nfcUserId => _nfcUserId;
  set nfcUserId(String value) {
    _nfcUserId = value;
  }

  bool _writeTag = false;
  bool get writeTag => _writeTag;
  set writeTag(bool value) {
    _writeTag = value;
  }

  String _userGuid = '';
  String get userGuid => _userGuid;
  set userGuid(String value) {
    _userGuid = value;
    prefs.setString('ff_userGuid', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
