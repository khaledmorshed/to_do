import 'dart:async';
import 'package:flutter/material.dart';

class DebounceClass{
  static VoidCallback debounce(VoidCallback action, {Duration duration = const Duration(milliseconds: 300)}) {
    Timer? timer;

    return () {
      timer?.cancel();
      timer = Timer(duration, () {
        action();
      });
    };
  }
}