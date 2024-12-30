import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PackageModel {
  final String packageName;
  final String packageDescription;
  final String packageAuthor;
  final String packageLicense;
  final int likeCount;
  final String githubLink;
  final List<String> packageVersions;
  final String popularity;
  final String pubPoint;

  PackageModel({
    required this.packageName,
    required this.packageDescription,
    required this.packageAuthor,
    required this.packageLicense,
    required this.likeCount,
    required this.githubLink,
    required this.packageVersions,
    required this.popularity,
    required this.pubPoint,
  });

  factory PackageModel.fromMap(Map<String, dynamic> map) {
    return PackageModel(
      packageName: map['packageName'],
      packageDescription: map['packageDescription'],
      packageAuthor: map['packageAuthor'],
      packageLicense: map['packageLicense'],
      likeCount: map['likeCount'],
      githubLink: map['githubLink'],
      packageVersions: List<String>.from(map['packageVersions']),
      popularity: map['popularity'],
      pubPoint: map['pubPoint'],
    );
  }
}

class ApiCall {
  String url =
      "https://flutter-packages-api.herokuapp.com/flutter-packages/api/walf";

  Future<PackageModel> getPackageData(String packageName) async {
    http.Response response = await http.get(Uri.parse(url + packageName));
    Map<String, dynamic> data = jsonDecode(response.body);
    return PackageModel.fromMap(data);
  }
}

class ApiWidget extends StatefulWidget {
  final String packageName;
  const ApiWidget({super.key, required this.packageName});

  @override
  State<ApiWidget> createState() => _ApiWidgetState();
}

class _ApiWidgetState extends State<ApiWidget> {
  ApiCall apiCall = ApiCall();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<PackageModel>(
        future: apiCall.getPackageData(widget.packageName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          var data = snapshot.data!;
          return Column(
            children: [
              Text(data.packageName),
              Text(data.packageDescription),
              Text(data.packageAuthor),
              Text(data.packageLicense),
              Text(data.likeCount.toString()),
              Text(data.githubLink),
              Text(data.packageVersions.toString()),
              Text(data.popularity),
              Text(data.pubPoint),
            ],
          );
        },
      ),
    );
  }
}
