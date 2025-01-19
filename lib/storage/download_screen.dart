import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class DownloadScreen extends StatelessWidget {
  final String downloadURL;

  DownloadScreen({required this.downloadURL});

  Future<void> _downloadMascot(BuildContext context) async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      final filePath = path.join(directory.path, 'mascot.jpg');
      final file = File(filePath);

      final response = await FirebaseStorage.instance.refFromURL(downloadURL).writeToFile(file);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Mascot downloaded to: $filePath')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to download mascot: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mascot Download')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Download URL:'),
            Text(
              downloadURL,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _downloadMascot(context),
              child: Text('Download Mascot Photo'),
            ),
          ],
        ),
      ),
    );
  }
}