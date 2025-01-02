import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class PickerWidget extends StatelessWidget {
  late XFile? image;
  String? selectedFont;
  PickerWidget({super.key, this.image, this.selectedFont});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  width: 300,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: image == null
                              ? Image.asset("assets/red_dragon.png").image
                              : FileImage(File(image!.path)) as ImageProvider,
                          fit: BoxFit.cover)),
                )),
            Expanded(flex: 1, child: SizedBox()),
            Expanded(
                flex: 1,
                child: Text(
                  "Name : Onur Can",
                  style: TextStyle(fontFamily: selectedFont),
                )),
            Expanded(
                flex: 1,
                child: Text(
                  "Age : 23",
                  style: TextStyle(fontFamily: selectedFont),
                )),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CustomImagePicker()));
                },
                child: Text("Change Image"))
          ],
        ),
      ),
    );
  }
}

class CustomImagePicker extends StatefulWidget {
  const CustomImagePicker({super.key});

  @override
  State<CustomImagePicker> createState() => _CustomImagePickerState();
}

class _CustomImagePickerState extends State<CustomImagePicker> {
  XFile? image;
  String? selectedFont;
  _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? _image = await _picker.pickImage(source: ImageSource.gallery);
    setState(() {
      image = _image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  await _pickImage();
                },
                child: Text("Select Image")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AgeAndColorPickerScreen()));
                },
                child: Text("Find Age")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PickerWidget(
                                image: image,
                              )));
                },
                child: Text("Save Image"))
          ],
        ),
      ),
    );
  }
}

class AgeAndColorPickerScreen extends StatefulWidget {
  const AgeAndColorPickerScreen({Key? key}) : super(key: key);

  @override
  State<AgeAndColorPickerScreen> createState() =>
      _AgeAndColorPickerScreenState();
}

class _AgeAndColorPickerScreenState extends State<AgeAndColorPickerScreen> {
  DateTime? _selectedDate;
  String? _age;
  Color _backgroundColor = Colors.white;

  void _pickDate(BuildContext context) async {
    DateTime today = DateTime.now();

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: today,
      firstDate: DateTime(1900),
      lastDate: today,
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _age = _calculateAge(pickedDate).toString();
      });
    }
  }

  int _calculateAge(DateTime birthDate) {
    DateTime today = DateTime.now();
    int age = today.year - birthDate.year;

    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  void _pickColor() {
    showDialog(
      context: context,
      builder: (context) {
        Color tempColor = _backgroundColor;
        return AlertDialog(
          title: const Text('Pick a Background Color'),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: _backgroundColor,
              onColorChanged: (color) {
                tempColor = color;
              },
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _backgroundColor = tempColor;
                });
                Navigator.of(context).pop();
              },
              child: const Text('Select'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      appBar: AppBar(
        title: const Text('Age and Color Picker'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              _selectedDate == null
                  ? 'Select your date of birth'
                  : 'Date of Birth: ${DateFormat('dd MMMM yyyy').format(_selectedDate!)}',
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _pickDate(context),
              child: const Text('Pick Date'),
            ),
            const SizedBox(height: 20),
            if (_age != null)
              Text(
                'Your Age: $_age years',
                style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _pickColor,
              child: const Text('Pick Background Color'),
            ),
          ],
        ),
      ),
    );
  }
}
