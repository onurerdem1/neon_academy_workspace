import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

class CrashlyticsScreen extends StatelessWidget {
  void _crashApp() {
    FirebaseCrashlytics.instance.crash();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Crashlytics Example')),
      body: Center(
        child: ElevatedButton(
          onPressed: _crashApp,
          child: Text('Crash App'),
        ),
      ),
    );
  }
}