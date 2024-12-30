import 'dart:convert';

import 'package:flutter/material.dart';

class Album {
  final int userId;
  final int id;
  final String title;

  Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}

class Http {
  get http => null;

  Future<Album> fetchAlbum() async {
    final response = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/albums/1"));

    if (response.statusCode == 200) {
      return Album.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    } else {
      throw Exception('Failed to load album');
    }
  }
}

class httpWidget extends StatefulWidget {
  const httpWidget({super.key});

  @override
  State<httpWidget> createState() => _httpWidgetState();
}

class _httpWidgetState extends State<httpWidget> {
  late Future<Album> futureAlbum;

  void initState() {
    super.initState();
    futureAlbum = Http().fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            var data = snapshot.data;
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(data!.title),
                ],
              ),
            );
          }),
    );
  }
}
