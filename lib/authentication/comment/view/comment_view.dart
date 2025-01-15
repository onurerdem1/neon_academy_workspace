import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:neon_academy_workspace/authentication/comment/viewmodel/comment_view_model.dart';
import 'package:provider/provider.dart';

class CommentScreen extends StatefulWidget {
  final String photoId;
  final String photoUrl;

  const CommentScreen({Key? key, required this.photoId, required this.photoUrl})
      : super(key: key);

  @override
  State<CommentScreen> createState() => _CommentPageState();
}

class _CommentPageState extends State<CommentScreen> {
  final TextEditingController _commentController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CommentViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Comments'),
        leading: IconButton(
            onPressed: () {
              viewModel.navigatetoHome(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                widget.photoUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            child: StreamBuilder(
              stream: _firestore
                  .collection('photos')
                  .doc(widget.photoId)
                  .collection('comments')
                  .orderBy('timestamp', descending: true)
                  .snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(child: Text('No comments yet.'));
                }

                final comments = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: comments.length,
                  itemBuilder: (context, index) {
                    final comment = comments[index];
                    final commentText = comment['text'];
                    final timestamp = comment['timestamp'] as Timestamp?;
                    final userName = comment['username'];
                    final formattedDate = timestamp != null
                        ? DateFormat('dd MMM yyyy, HH:mm')
                            .format(timestamp.toDate())
                        : 'Unknown Date';

                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                userName,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black87,
                                ),
                              ),
                              Text(
                                formattedDate,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Text(
                            commentText,
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: viewModel.commentController,
                    decoration: InputDecoration(
                      hintText: 'Write a comment...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () async {
                    await viewModel.addComment(widget.photoId);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
