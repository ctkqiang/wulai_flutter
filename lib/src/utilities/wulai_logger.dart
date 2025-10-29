import 'package:flutter/foundation.dart';

class WulaiLogger {
  static WulaiLogger get instance => WulaiLogger.create();

  WulaiLogger._();
  WulaiLogger.create() : this._();

  void debug({String? message, Object? error, StackTrace? stackTrace}) {
    debugPrint(
      '[无赖] DEBUG: $message${error != null ? ', error: $error' : ''}${stackTrace != null ? ', stackTrace: $stackTrace' : ''}',
    );
  }

  void info(
    String s, {
    String? message,
    Object? error,
    StackTrace? stackTrace,
  }) {
    debugPrint(
      '[无赖] INFO: $message${error != null ? ', error: $error' : ''}${stackTrace != null ? ', stackTrace: $stackTrace' : ''}',
    );
  }

  void warn({String? message, Object? error, StackTrace? stackTrace}) {
    debugPrint(
      '[无赖] WARN: $message${error != null ? ', error: $error' : ''}${stackTrace != null ? ', stackTrace: $stackTrace' : ''}',
    );
  }

  void error({String? message, Object? error, StackTrace? stackTrace}) {
    debugPrint(
      '[无赖] ERROR: $message${error != null ? ', error: $error' : ''}${stackTrace != null ? ', stackTrace: $stackTrace' : ''}',
    );
  }
}
