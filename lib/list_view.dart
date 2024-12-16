import 'package:flutter/material.dart';

class ListViewWidget extends StatefulWidget {
  const ListViewWidget({super.key});

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  final List _posts = ["post1", "post2", "post3", "post4", "post 5", "post6"];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _posts.length,
        itemBuilder: (context, index) {
          return news();
        });
    // return CustomScrollView(slivers: [
    //   SliverGrid(
    //       gridDelegate:
    //           SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
    //       delegate: SliverChildBuilderDelegate((context, index) {
    //         return Padding(
    //           padding: const EdgeInsets.all(8.0),
    //           child: Container(
    //             height: 300,
    //             decoration: BoxDecoration(color: Colors.red),
    //           ),
    //         );
    //       }, childCount: 8)),
    //   SliverList(
    //       delegate: SliverChildBuilderDelegate(
    //     (context, index) {
    //       return Padding(
    //         padding: EdgeInsets.all(8),
    //         child: Container(
    //           height: 300,
    //           decoration: BoxDecoration(color: Colors.amber),
    //         ),
    //       );
    //     },
    //     childCount: 5,
    //   ))
    // ]);
    // return ListView.builder(
    //     addAutomaticKeepAlives: false,
    //     itemCount: _posts.length,
    //     itemBuilder: (context, index) {
    //       return Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Container(
    //           height: 300,
    //           decoration: BoxDecoration(color: Colors.pink),
    //         ),
    //       );
    //     });
    // return ListView(
    //   children: [
    //     Padding(
    //       padding: EdgeInsets.all(8),
    //       child: Container(
    //         height: 300,
    //         decoration: BoxDecoration(color: Colors.pink),
    //       ),
    //     ),
    //     Padding(
    //       padding: EdgeInsets.all(8),
    //       child: Container(
    //         height: 300,
    //         decoration: BoxDecoration(color: Colors.pink),
    //       ),
    //     ),
    //     Padding(
    //       padding: EdgeInsets.all(8),
    //       child: Container(
    //         height: 300,
    //         decoration: BoxDecoration(color: Colors.pink),
    //       ),
    //     ),
    //     Padding(
    //       padding: EdgeInsets.all(8),
    //       child: Container(
    //         height: 300,
    //         decoration: BoxDecoration(color: Colors.pink),
    //       ),
    //     ),
    //   ],
    // );
  }

  Widget news() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 200,
        width: 300,
        decoration: BoxDecoration(
          color: Colors.blueGrey[200],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
                height: 100,
                width: 200,
                decoration: BoxDecoration(
                    color: Colors.amber[100],
                    image: DecorationImage(
                      image: Image.network(
                              "https://upload.wikimedia.org/wikipedia/commons/5/56/Donald_Trump_official_portrait.jpg")
                          .image,
                      fit: BoxFit.cover,
                    ))),
            Text(
              "Trump elected again",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
