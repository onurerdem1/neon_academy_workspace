import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neon_academy_workspace/storage/download_screen.dart';
import 'package:path/path.dart'as path;

class MascotSelectionScreen extends StatefulWidget {
  @override
  _MascotSelectionScreenState createState() => _MascotSelectionScreenState();
}

class _MascotSelectionScreenState extends State<MascotSelectionScreen> {
  File? _selectedImage;
  String? _downloadURL;

  Future<void> _pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  Future<void> _uploadImage() async {
    if (_selectedImage == null) return;

    final fileName = path.basename(_selectedImage!.path);
    final storageRef = FirebaseStorage.instance.ref().child('mascots/$fileName');

    try {
      final uploadTask = await storageRef.putFile(_selectedImage!);
      final downloadURL = await storageRef.getDownloadURL();

      setState(() {
        _downloadURL = downloadURL;
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DownloadScreen(downloadURL: downloadURL),
        ),
      );
    } catch (e) {
      print('Upload failed: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Select Team Mascot')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (_selectedImage != null) ...[
              Image.file(_selectedImage!, height: 200),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _uploadImage,
                child: Text('Upload Mascot'),
              ),
            ] else
              ElevatedButton(
                onPressed: _pickImage,
                child: Text('Pick Mascot Image'),
              ),
          ],
        ),
      ),
    );
  }
}