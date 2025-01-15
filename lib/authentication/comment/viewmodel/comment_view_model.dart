import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:neon_academy_workspace/authentication/home/view/home_view.dart';

class CommentViewModel extends ChangeNotifier {
  final TextEditingController _commentController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  TextEditingController get commentController => _commentController;

  Future<void> addComment(String photoId) async {
    final userName = await FirebaseAuth.instance.currentUser!.displayName;
    if (_commentController.text.isNotEmpty) {
      await _firestore
          .collection('photos')
          .doc(photoId)
          .collection('comments')
          .add({
        'text': _commentController.text,
        'timestamp': FieldValue.serverTimestamp(),
        "username": userName,
      });
      _commentController.clear();
    }
  }

  void navigatetoHome(BuildContext context) {
    Navigator.pushReplacement(
        context,
        PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const HomeScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              const begin = Offset(-1.0, 0.0);
              const end = Offset.zero;
              const curve = Curves.ease;

              var tween = Tween(
                begin: begin,
                end: end,
              ).chain(CurveTween(curve: curve));

              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
            transitionDuration: Duration(milliseconds: 750)));
    commentController.clear();
  }
}
