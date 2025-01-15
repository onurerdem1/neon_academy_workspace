import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:neon_academy_workspace/authentication/home/viewmodel/home_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<HomeViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Homepage'),
        actions: [
          IconButton(
              onPressed: () {
                viewModel.logoutButtonAction(context);
              },
              icon: Icon(Icons.power_settings_new))
        ],
      ),
      body: StreamBuilder(
        stream: _firestore
            .collection('photos')
            .orderBy('timestamp', descending: true)
            .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No photos yet.'));
          }

          final photos = snapshot.data!.docs;

          return ListView.builder(
            itemCount: photos.length,
            itemBuilder: (context, index) {
              final photo = photos[index];
              final photoId = photo.id;
              final photoUrl = photo['url'];
              final timestamp = photo['timestamp'] as Timestamp?;
              final userName = photo['username'];

              final formattedDate = timestamp != null
                  ? DateFormat('dd MMM yyyy, HH:mm').format(timestamp.toDate())
                  : "Unknown Date";

              return Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(15),
                          ),
                          child: Image.network(
                            photoUrl,
                            fit: BoxFit.cover,
                            height: 250,
                            width: double.infinity,
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 15,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  userName,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 4, horizontal: 8),
                            decoration: BoxDecoration(
                              color: Colors.black54,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              formattedDate,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.favorite_border),
                                onPressed: () {},
                              ),
                              SizedBox(width: 10),
                              IconButton(
                                icon: Icon(Icons.chat_bubble_outline),
                                onPressed: () {
                                  viewModel.navigateToComments(
                                      context, photoId, photoUrl);
                                },
                              ),
                              SizedBox(width: 10),
                              Icon(Icons.send),
                            ],
                          ),
                          Icon(Icons.bookmark_border),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await viewModel.uploadPhoto();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
