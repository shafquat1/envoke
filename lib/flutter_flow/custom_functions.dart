import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

String getGreetingUsingTime() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return 'Guten Morgen';
  }
  if (hour < 17) {
    return 'Guten Tag';
  }
  return 'Guten Abend';
}

bool? setDateVisibility(
  int memoryIndex,
  List<MemoriesRecord> memoryList,
) {
  if (memoryIndex == memoryList.length - 1) {
    return true;
  } else {
    MemoriesRecord frontMemory = memoryList[memoryIndex];
    MemoriesRecord nextMemory = memoryList[memoryIndex + 1];
    DateTime date1 = frontMemory.createdTime!;
    DateTime date2 = nextMemory.createdTime!;
    if (date1.month == date2.month) {
      return false;
    } else
      true;
  }
}
