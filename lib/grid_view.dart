import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Apps {
  Image icon;
  String appName;
  String releaseDate;
  String appCategory;
  String storeUrl;
  Apps(
      {required this.icon,
      required this.appName,
      required this.releaseDate,
      required this.appCategory,
      required this.storeUrl});
}

class GridViewWidget extends StatefulWidget {
  const GridViewWidget({super.key});

  @override
  State<GridViewWidget> createState() => _GridViewWidgetState();
}

class _GridViewWidgetState extends State<GridViewWidget> {
  List appList = [
    Apps(
        icon: Image.asset("assets/baby_tracker.jpg"),
        appName: "Baby Tracker",
        releaseDate: "19.10.2021",
        appCategory: "Helper",
        storeUrl:
            "https://apps.apple.com/tt/app/baby-tracker/id1619054370?platform=iphone"),
    Apps(
        icon: Image.asset("assets/smart_cleaner.jpg"),
        appName: "Smart Cleaner",
        releaseDate: "23.05.2022",
        appCategory: "Utility",
        storeUrl:
            "https://apps.apple.com/us/app/smart-cleaner-free-up-space/id1576477935"),
    Apps(
        icon: Image.asset("assets/tofy.jpg"),
        appName: "Tofy",
        releaseDate: "07.12.2023",
        appCategory: "Music",
        storeUrl:
            "https://apps.apple.com/us/app/tofy-baby-sleep-white-noise/id1602210371"),
    Apps(
        icon: Image.asset("assets/ai_music.jpg"),
        appName: "Ai Music",
        releaseDate: "26.09.2024",
        appCategory: "Music",
        storeUrl:
            "https://apps.apple.com/us/app/ai-music-maker-voice-changer/id6447696368"),
    Apps(
        icon: Image.asset("assets/hypnosis.jpg"),
        appName: "Hypnosis",
        releaseDate: "09.06.2023",
        appCategory: "Entertainment",
        storeUrl:
            "https://apps.apple.com/tr/app/hypnosis-mindfullness/id1555060954"),
    Apps(
        icon: Image.asset("assets/lock_screen.jpg"),
        appName: "Lock Screen",
        releaseDate: "31.12.2022",
        appCategory: "Utility",
        storeUrl:
            "https://apps.apple.com/lv/app/lock-screen-widgets-maker/id1643100878"),
  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
      itemCount: appList.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(
                          app: appList[index],
                        )));
          },
          child: Container(
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: appList[index].icon.image,
                  fit: BoxFit.fill,
                ),
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3))
                ]),
          ),
        );
      },
    );
  }
}

class DetailPage extends StatelessWidget {
  Apps app;
  DetailPage({super.key, required this.app});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            app.icon,
            Text("App Name: ${app.appName}"),
            Text("Release Date: ${app.releaseDate}"),
            Text("App Category: ${app.appCategory}"),
            Text("Store Url: ${app.storeUrl}"),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Back"))
          ],
        ),
      ),
    );
  }
}
