import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:http/http.dart' as http;

class NotificationHome extends StatefulWidget {
  @override
  _NotificationHomeState createState() => _NotificationHomeState();
}

class _NotificationHomeState extends State<NotificationHome> {
  OneSignal oneSignal = OneSignal();
  @override
  void initState() {
    super.initState();
    _initializeOneSignal();
  }

  void _initializeOneSignal() async {
    OneSignal.initialize("9d85bae8-4203-4962-89d3-a911301c8de1");

    OneSignal.Notifications.requestPermission(true).then((accepted) {
      print("Notification permission: $accepted");
    });

    OneSignal.InAppMessages.addClickListener((event) {
      print(
          "In App Message Clicked: \n${event.result.jsonRepresentation().replaceAll("\\n", "\n")}");
    });
  }

  void sendNotification() async {
    const String oneSignalUrl = "https://onesignal.com/api/v1/notifications";
    const String oneSignalAppId = "9d85bae8-4203-4962-89d3-a911301c8de1";
    const String oneSignalApiKey =
        "os_v2_app_twc3v2ccanewfcotveitahen4e6f6uuzcmzebrfya3uwrfcivfpp4xqemh3xay4gowcyl3ehumpqqo2twbnucu5jytuohtoq4swetiq";

    var headers = {
      "Content-Type": "application/json; charset=UTF-8",
      "Authorization": "Basic $oneSignalApiKey"
    };

    var body = jsonEncode({
      "app_id": oneSignalAppId,
      "included_segments": ["All"],
      "headings": {"en": "Hello from Flutter!"},
      "contents": {"en": "This is a test notification."},
    });

    var response = await http.post(
      Uri.parse(oneSignalUrl),
      headers: headers,
      body: body,
    );

    if (response.statusCode == 200) {
      print("Notification sent successfully.");
    } else {
      print("Failed to send notification: ${response.body}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("OneSignal Integration")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Waiting for notifications...",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: sendNotification,
              child: Text("Send Notification"),
            ),
          ],
        ),
      ),
    );
  }
}
