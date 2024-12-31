import 'package:flutter/material.dart';

class VisibilityWidget extends StatefulWidget {
  const VisibilityWidget({super.key});

  @override
  State<VisibilityWidget> createState() => _VisibilityWidgetState();
}

class _VisibilityWidgetState extends State<VisibilityWidget> {
  bool isVisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(visible: isVisible, child: Text("Invisibility Spell")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    isVisible = !isVisible;
                  });
                },
                child: isVisible ? Text("Hide") : Text("Show"))
          ],
        ),
      ),
    );
  }
}

class RotationWidget extends StatefulWidget {
  const RotationWidget({super.key});

  @override
  State<RotationWidget> createState() => _RotationWidgetState();
}

class _RotationWidgetState extends State<RotationWidget> {
  double rotation = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedRotation(
                turns: rotation,
                duration: Duration(seconds: 1),
                child: Container(
                    height: 100,
                    width: 100,
                    child: Image.asset("assets/axe.jpg"))),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        rotation += 0.1;
                      });
                    },
                    child: Text("Rotate Right")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        rotation -= 0.1;
                      });
                    },
                    child: Text("Rotate Left"))
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PositionWidget extends StatefulWidget {
  const PositionWidget({super.key});

  @override
  State<PositionWidget> createState() => _PositionWidgetState();
}

class _PositionWidgetState extends State<PositionWidget> {
  double topPosition = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      AnimatedPositioned(
        child: Text("Movement Spell"),
        duration: Duration(seconds: 1),
        top: topPosition,
        left: 100,
      ),
      Positioned(
        bottom: 50,
        left: 100,
        child: Row(
          children: [
            ElevatedButton(
              onPressed: () => setState(() => topPosition -= 50),
              child: Text("Move Up"),
            ),
            SizedBox(width: 10),
            ElevatedButton(
              onPressed: () => setState(() => topPosition += 50),
              child: Text("Move Down"),
            ),
          ],
        ),
      )
    ]));
  }
}

class SizeWidget extends StatefulWidget {
  const SizeWidget({super.key});

  @override
  State<SizeWidget> createState() => _SizeWidgetState();
}

class _SizeWidgetState extends State<SizeWidget> {
  double size = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 1),
              height: size,
              width: size,
              color: Colors.blue,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        size += 25;
                      });
                    },
                    child: Text("Grow")),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        size -= 25;
                      });
                    },
                    child: Text("Shrink"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
