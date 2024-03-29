import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

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

  String _userGuid = 'M9TXnAFedha4gCLmu0X4c4liYXX2';
  String get userGuid => _userGuid;
  set userGuid(String value) {
    _userGuid = value;
  }
}
