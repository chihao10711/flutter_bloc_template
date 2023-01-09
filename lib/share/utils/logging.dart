// 🎯 Dart imports:
import 'dart:developer' as developer;

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc_template/share/share.dart';

var start = '\x1b[90m';
const end = '\x1b[0m';
const white = '\x1b[37m';

void logInfo(Object? data) {
  if (kDebugMode) {
    var time = '';

    try {
      start = '\x1b[34m';
      final now = DateTime.now().formatDateddMMMyyyyHHmmaa;
      final message = '$white[$now]$time$end$start ${data.toString()}$end';
      developer.log(message, level: 1, name: "INFO");
      if (data.toString().contains('is not a subtype of type')) {
        throw Exception();
      }
    } catch (e, trace) {
      developer.log('🔴 ${data.toString()}');
      developer.log(trace.toString());
    }
  }
}

void logError(Object? data) {
  if (kDebugMode) {
    var time = '';

    try {
      start = '\x1b[31m';
      final now = DateTime.now().formatDateddMMMyyyyHHmmaa;
      final message = '$white[$now]$time$end$start ${data.toString()}$end';
      developer.log(message, name: "ERROR");
      if (data.toString().contains('is not a subtype of type')) {
        throw Exception();
      }
    } catch (e, trace) {
      developer.log('🔴 ${data.toString()}');
      developer.log(trace.toString());
    }
  }
}

void logWarning(Object? data) {
  if (kDebugMode) {
    var time = '';
    try {
      start = '\x1b[93m';
      final now = DateTime.now().formatDateddMMMyyyyHHmmaa;
      final message = '$white[$now]$time$end$start ${data.toString()}$end';
      developer.log(message, name: "WARNING");
      if (data.toString().contains('is not a subtype of type')) {
        throw Exception();
      }
    } catch (e, trace) {
      developer.log('🔴 ${data.toString()}');
      developer.log(trace.toString());
    }
  }
}
