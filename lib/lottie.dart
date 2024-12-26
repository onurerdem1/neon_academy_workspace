import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieWidget extends StatefulWidget {
  const LottieWidget({super.key});

  @override
  State<LottieWidget> createState() => _LottieWidgetState();
}

class _LottieWidgetState extends State<LottieWidget> {
  void initState() {
    super.initState();
    timer();
  }

  void timer() async {
    await Future.delayed(Duration(seconds: 5));
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("assets/Lottie1.json", height: 100, width: 100)
        ],
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double sigmaX = 10.0;
  double sigmaY = 10.0;
  bool isTimerOn = false;
  late Timer timer;
  int seconds = 10;
  int percentage = 0;

  void startTimer() {
    if (isTimerOn) {
      timer.cancel();
      setState(() {
        isTimerOn = false;
      });
    } else {
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (seconds == 0) {
          timer.cancel();
          setState(() {
            isTimerOn = false;
          });
        } else {
          setState(() {
            seconds--;
            sigmaX--;
            sigmaY--;
            percentage += 10;
          });
        }
      });
      setState(() {
        isTimerOn = true;
      });
    }
  }

  void startOver() {
    setState(() {
      sigmaX = 10.0;
      sigmaY = 10.0;
      isTimerOn = false;
      seconds = 10;
      percentage = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: Image.asset("assets/war_image.png").image,
                      fit: BoxFit.cover)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: sigmaX, sigmaY: sigmaY),
                child: Text(""),
              ),
            ),
            Text("%$percentage"),
            isTimerOn
                ? Lottie.asset("assets/Lottie1.json", height: 100, width: 100)
                : SizedBox(
                    height: 20,
                  ),
            isTimerOn
                ? ElevatedButton(
                    onPressed: () {
                      startTimer();
                    },
                    child: Text("Stop Timer"))
                : ElevatedButton(
                    onPressed: () {
                      startTimer();
                    },
                    child: Text("Start Timer")),
            percentage == 100
                ? ElevatedButton(
                    onPressed: () {
                      startOver();
                    },
                    child: Text("Start Over"),
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
