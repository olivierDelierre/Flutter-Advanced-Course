import 'package:ex_01/app.config.dart';
import 'package:flutter/material.dart';

late final AppConfig appConfig;

class AppBuilder {
  final AppConfig appConfig;

  AppBuilder({required this.appConfig});

  Widget _build() {
    return MaterialApp(
      debugShowCheckedModeBanner: appConfig.showDebugBanner,
      theme: ThemeData(
        primarySwatch: appConfig.color,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My App'),
        ),
        body: Text('Flutter, but in ${appConfig.color == Colors.green ? "green" : "red"}!'),
      ),
    );
  }
}

startApp(AppBuilder appBuilder) {
  appConfig = appBuilder.appConfig;

  runApp(appBuilder._build());
}
