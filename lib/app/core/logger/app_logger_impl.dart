import 'dart:math';

import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:mercado_v2/app/core/logger/i_app_logger.dart';

/* TODO crear el FirebaseCrashlytics.instance
   bool get _isFirebaseInitialized {
    try {
      // Si accede sin lanzar excepción, está inicializado
      FirebaseCrashlytics.instance;
      return true;
    } catch (e) {
      return false;
    }*/

// TODO al crear logger, pasar el PrettyPrinter() y methodCount = 0

class AppLoggerImpl implements IAppLogger {
  final Logger _devLogger;
  final FirebaseCrashlytics _crashlytics;

  AppLoggerImpl({
    required Logger devLogger,
    required FirebaseCrashlytics crashlytics,
  }) : _devLogger = devLogger,
       _crashlytics = crashlytics;

  @override
  void debug(String message) {
    if (kDebugMode) _devLogger.d(message);
  }

  @override
  void info(String message) {
    if (kDebugMode) {
      _devLogger.i(message);
    } else {
      _crashlytics.log(message);
    }
  }

  @override
  void warning(String message, [error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      _devLogger.w(message, error: error, stackTrace: stackTrace);
    } else {
      _crashlytics.log("WARN: $message");
    }
  }

  @override
  void error(String message, [error, StackTrace? stackTrace]) {
    if (kDebugMode) {
      _devLogger.e(message, error: error, stackTrace: stackTrace);
    } else {
      _crashlytics.recordError(e, stackTrace, reason: message);
    }
  }
}
