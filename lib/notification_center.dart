import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class DecryptScreen extends StatefulWidget {
  @override
  _DecryptScreenState createState() => _DecryptScreenState();
}

class _DecryptScreenState extends State<DecryptScreen> {
  late Timer _timer;
  int _remainingTime = 15;
  bool _isDecryptionComplete = false;
  String? _decryptedMessage;

  final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    _initializeNotifications();
  }

  Future<void> _initializeNotifications() async {
    const AndroidInitializationSettings androidInitSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const InitializationSettings initSettings =
        InitializationSettings(android: androidInitSettings);
    await _notificationsPlugin.initialize(initSettings);
  }

  Future<void> _showNotification(String message) async {
    const AndroidNotificationDetails androidDetails =
        AndroidNotificationDetails(
      'decryption_channel',
      'Decryption Notifications',
      importance: Importance.high,
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidDetails);

    await _notificationsPlugin.show(
      0,
      'Decryption Complete',
      message,
      notificationDetails,
    );

    Future.delayed(Duration(seconds: 7), () {
      _notificationsPlugin.cancel(0);
    });
  }

  void _startDecryption() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _remainingTime--;
        if (_remainingTime == 0) {
          _timer.cancel();
          _decryptMessage();
        }
      });
    });
  }

  void _decryptMessage() {
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _isDecryptionComplete = true;
        _decryptedMessage = "TOP SECRET: The mission is a go!";
        _showNotification(_decryptedMessage!);
      });
      Future.delayed(Duration(seconds: 7), () {
        setState(() {
          _decryptedMessage = null;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Age and Color Picker'),
        centerTitle: true,
      ),
      body: Center(
        child: _remainingTime > 0
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Enter the code and press Decrypt.',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _startDecryption,
                    child: Text('Decrypt'),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Time remaining: $_remainingTime seconds',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ],
              )
            : _isDecryptionComplete
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Text('The message will disappear soon!'),
                    ],
                  )
                : Text(
                    'Decryption in progress...',
                    style: TextStyle(fontSize: 18),
                  ),
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }
}
