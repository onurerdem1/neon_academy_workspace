import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

class RemoteConfigScreen extends StatefulWidget {
  @override
  _RemoteConfigScreenState createState() => _RemoteConfigScreenState();
}

class _RemoteConfigScreenState extends State<RemoteConfigScreen> {
  String _displayString = "Default String";
  int _displayNumber = 0;
  String _imageUrl = "";
  bool _isImageHidden = false;

  late FirebaseRemoteConfig _remoteConfig;

  @override
  void initState() {
    super.initState();
    _initializeRemoteConfig();
  }

  Future<void> _initializeRemoteConfig() async {
    _remoteConfig = FirebaseRemoteConfig.instance;

    try {
      await _remoteConfig.setDefaults({
        'display_string': 'Default String',
        'display_number': 0,
        'image_url': '',
        'is_image_hidden': false,
      });

      await _remoteConfig.fetchAndActivate();

      setState(() {
        _displayString = _remoteConfig.getString('display_string');
        _displayNumber = _remoteConfig.getInt('display_number');
        _imageUrl = _remoteConfig.getString('image_url');
        _isImageHidden = _remoteConfig.getBool('is_image_hidden');
      });
    } catch (e) {
      print("Failed to fetch remote config: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Remote Config Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('String: $_displayString', style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            Text('Number: $_displayNumber', style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
            if (!_isImageHidden && _imageUrl.isNotEmpty)
              Image.network(_imageUrl, height: 200),
            if (_isImageHidden || _imageUrl.isEmpty)
              Text('Image is hidden or URL is empty', style: TextStyle(fontSize: 16, color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}