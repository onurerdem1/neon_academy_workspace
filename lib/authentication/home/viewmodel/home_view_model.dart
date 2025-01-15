import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neon_academy_workspace/authentication/comment/view/comment_view.dart';
import 'package:neon_academy_workspace/authentication/login/view/login_view.dart';
import 'package:uuid/uuid.dart';

class HomeViewModel extends ChangeNotifier {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> uploadPhoto() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image == null) return;

    File file = File(image.path);

    String fileId = const Uuid().v4();
    String filePath = "photos/$fileId";

    final uploadTask = await _storage.ref(filePath).putFile(file);
    final downloadUrl = await uploadTask.ref.getDownloadURL();
    final userName = await FirebaseAuth.instance.currentUser!.displayName;

    await _firestore.collection('photos').add({
      'url': downloadUrl,
      'timestamp': FieldValue.serverTimestamp(),
      "username": userName,
    });
  }

  Future<void> logoutButtonAction(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      print("sign out succesfull");
      navigateToLogin(context);
    } catch (e) {
      print(e);
    }
  }

  void navigateToLogin(BuildContext context) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const LoginScreen(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(-1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 750),
      ),
    );
  }

  void navigateToComments(
      BuildContext context, String photoId, String photoUrl) {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => CommentScreen(
          photoId: photoId,
          photoUrl: photoUrl,
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(1.0, 0.0);
          const end = Offset.zero;
          const curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 750),
      ),
    );
  }
}
