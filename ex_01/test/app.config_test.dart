import 'package:ex_01/app.config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('App config.', () {
    test('`red` factory should set the Red color, and banner should not appears.', () {
      final c = AppConfig.red();
      expect(c.color, Colors.red);
      expect(c.showDebugBanner, isFalse);
    });
  });
}
