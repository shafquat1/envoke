import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

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
  set nfcTag(String _value) {
    _nfcTag = _value;
  }

  String _nfcUserId = '';
  String get nfcUserId => _nfcUserId;
  set nfcUserId(String _value) {
    _nfcUserId = _value;
  }

  bool _writeTag = false;
  bool get writeTag => _writeTag;
  set writeTag(bool _value) {
    _writeTag = _value;
  }

  String _userGuid = 'M9TXnAFedha4gCLmu0X4c4liYXX2';
  String get userGuid => _userGuid;
  set userGuid(String _value) {
    _userGuid = _value;
  }
}
