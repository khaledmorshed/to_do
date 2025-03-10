import 'dart:async';
import 'package:flutter/material.dart';

import '../values/app_values.dart';

class DebouncerClass {
  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  DebouncerClass({this.milliseconds = AppValues.defaultDebounceTimeInMilliSeconds});

  run(VoidCallback action) {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(Duration(milliseconds: milliseconds), action);
  }
}