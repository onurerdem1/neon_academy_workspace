import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Maze Challenge")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome to the maze. If you succeed, you are ready for the real world",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MazePage()),
                );
              },
              child: const Text("Next"),
            ),
          ],
        ),
      ),
    );
  }
}

class MazePage extends StatefulWidget {
  const MazePage({super.key});

  @override
  State<MazePage> createState() => _MazePageState();
}

class _MazePageState extends State<MazePage> {
  final List<String> correctPath = [
    "up",
    "right",
    "right",
    "down",
    "left",
    "up",
    "left"
  ];
  List<String> userPath = [];

  void _navigate(String direction, BuildContext context) async {
    setState(() {
      userPath.add(direction);
    });
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              DirectionScreen(title: "Moving $direction", color: Colors.red)),
    );
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pop(context);

    if (userPath.length <= correctPath.length) {
      for (int i = 0; i < userPath.length; i++) {
        if (userPath[i] != correctPath[i]) {
          _showMessage(context, "You're trapped, try again!");
          setState(() {
            userPath.clear();
          });
          return;
        }
      }
      if (userPath.length == correctPath.length) {
        _showMessage(context, "Congratulations, you did it!");
      }
    }
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Maze")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Navigate through the maze",
                style: TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Image.asset("assets/maze.jpg", height: 200),
            const SizedBox(height: 20),
            HeroArrowButton(
              direction: "Up",
              icon: Icons.arrow_upward,
              onPressed: () => _navigate("up", context),
            ),
            const SizedBox(height: 20),
            HeroArrowButton(
              direction: "Right",
              icon: Icons.arrow_forward,
              onPressed: () => _navigate("right", context),
            ),
            const SizedBox(height: 20),
            HeroArrowButton(
              direction: "Left",
              icon: Icons.arrow_back,
              onPressed: () => _navigate("left", context),
            ),
            const SizedBox(height: 20),
            HeroArrowButton(
                direction: "Down",
                icon: Icons.arrow_downward,
                onPressed: () => _navigate("down", context)),
          ],
        ),
      ),
    );
  }
}

class HeroArrowButton extends StatelessWidget {
  final String direction;
  final IconData icon;
  final VoidCallback onPressed;
  const HeroArrowButton(
      {required this.direction, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: direction,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        ),
        child: Icon(icon, size: 30),
      ),
    );
  }
}

class DirectionScreen extends StatelessWidget {
  final String title;
  final Color color;

  const DirectionScreen({
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Hero(
          tag: title.split(" ").last,
          child: Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
