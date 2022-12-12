import 'package:flutter/material.dart';

class AppConfig {
  final MaterialColor color;
  bool get showDebugBanner => color == Colors.green;

  AppConfig._internal({required this.color});

  factory AppConfig.red() => AppConfig._internal(color: Colors.red);
  factory AppConfig.green() => AppConfig._internal(color: Colors.green);
}
