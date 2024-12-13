import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatefulWidget {
  const ButtonWidget({super.key});

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget>
    with SingleTickerProviderStateMixin {
  bool isBlacksmithIn = false;
  bool _showImage = false;
  String blacksmithText = "Bring blacksmith to shop";
  late AnimationController _controller;
  late Animation<double> _shakeAnimation;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _shakeAnimation = Tween<double>(begin: -8, end: 12)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _startShake() async {
    _controller.forward().then((_) => _controller.reverse().then((_) {
          setState(() {
            _showImage = false;
          });
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sheriff Actions'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 200,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.red.withOpacity(0.5),
                    Colors.red.withOpacity(0.7)
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: Offset(3, 3),
                        color: Colors.black.withOpacity(0.5))
                  ],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(width: 2, color: Colors.blue),
                  color: Colors.red,
                  image: DecorationImage(
                      image: AssetImage("assets/saloon.jpg"),
                      fit: BoxFit.cover)),
              child: PopupMenuButton<String>(
                child: Text(
                  "Saloon Button",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onSelected: (String action) {
                  switch (action) {
                    case 'Order Beer':
                      _orderBeer(context);
                      break;
                    case 'Order Gin':
                      _orderGin(context);
                      break;
                    case 'Order Town Special':
                      _orderTownSpecial(context);
                      break;
                  }
                },
                itemBuilder: (BuildContext context) => [
                  const PopupMenuItem(
                    value: 'Order Beer',
                    child: Text('Order Beer'),
                  ),
                  const PopupMenuItem(
                    value: 'Order Gin',
                    child: Text('Order Gin'),
                  ),
                  const PopupMenuItem(
                    value: 'Order Town Special',
                    child: Text('Order Town Special'),
                  ),
                ],
              ),
            ),
            Container(
              width: 200,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.amber,
              ),
              child: PopupMenuButton<String>(
                child: Text("Sheriff Button"),
                onSelected: (String action) {
                  switch (action) {
                    case 'Call Backup':
                      _callBackup(context);
                      break;
                    case 'Issue Warning':
                      _issueWarning(context);
                      break;
                    case 'Patrol Town':
                      _patrolTown(context);
                      break;
                  }
                },
                itemBuilder: (BuildContext context) => [
                  const PopupMenuItem(
                    value: 'Call Backup',
                    child: Text('Call Backup'),
                  ),
                  const PopupMenuItem(
                    value: 'Issue Warning',
                    child: Text('Issue Warning'),
                  ),
                  const PopupMenuItem(
                    value: 'Patrol Town',
                    child: Text('Patrol Town'),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onLongPress: () => setState(() {
                _buttonColor = Colors.yellow;
              }),
              onLongPressEnd: (details) => setState(() {
                _buttonColor = Colors.purple;
              }),
              child: Container(
                width: 200,
                height: 50,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(_buttonColor)),
                  onPressed: () {},
                  child: Text(
                    "Vigilantes",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Container(
              height: 50,
              width: 200,
              child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isBlacksmithIn = !isBlacksmithIn;
                      blacksmithText = isBlacksmithIn
                          ? "Send blacksmith home"
                          : "Bring blacksmith to shop";
                    });
                    _blacksmithNotify(context);
                  },
                  child: Text(blacksmithText)),
            ),
            isBlacksmithIn
                ? Container(
                    width: 200,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        _upgradeGear(context);
                      },
                      child: Text("Upgrade your gear"),
                    ),
                  )
                : Container(),
            AnimatedBuilder(
              animation: _shakeAnimation,
              builder: (context, child) {
                return Transform.translate(
                    offset: Offset(_shakeAnimation.value, 0), child: child);
              },
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue,
                    image: _showImage
                        ? DecorationImage(
                            image: AssetImage("assets/thief.jpg"),
                            fit: BoxFit.cover)
                        : null),
                child: GestureDetector(
                    onTap: () async {
                      _startShake();
                      setState(() {
                        _showImage = !_showImage;
                      });
                      await Duration(milliseconds: 500);
                    },
                    child: Center(
                      child: _showImage
                          ? Text(
                              "Raise your hands!",
                              style: TextStyle(color: Colors.white),
                            )
                          : Text("Rob the bank"),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }

  Color _buttonColor = Colors.purple;

  void _upgradeGear(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Your gear upgraded')),
    );
  }

  void _blacksmithNotify(BuildContext context) {
    isBlacksmithIn
        ? ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Blacksmith has arrived!")))
        : ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Blacksmith has left!")));
  }

  void _callBackup(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Backup is on its way!')),
    );
  }

  void _issueWarning(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Warning issued to the townspeople.')),
    );
  }

  void _patrolTown(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Sheriff is now patrolling the town.')),
    );
  }

  void _orderTownSpecial(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Town Special for the special one!')),
    );
  }

  void _orderGin(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Gin is coming up!')),
    );
  }

  void _orderBeer(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Beer is coming up!')),
    );
  }
}

class ShakeButton extends StatefulWidget {
  const ShakeButton({super.key});

  @override
  State<ShakeButton> createState() => _ShakeButtonState();
}

class _ShakeButtonState extends State<ShakeButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _shakeAnimation;
  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));

    _shakeAnimation = Tween<double>(begin: -10, end: 10)
        .chain(CurveTween(curve: Curves.elasticIn))
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    _audioPlayer.dispose();
    super.dispose();
  }

  void _startShake() async {
    _controller.forward().then((_) => _controller.reverse());

    // await _audioPlayer.play(AssetSource("assets/sounds/shake.mp3"));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _shakeAnimation,
      builder: (context, child) {
        return Transform.translate(offset: Offset(_shakeAnimation.value, 0));
      },
      child: Container(
        width: 200,
        height: 50,
        child: ElevatedButton(
            onPressed: () {
              _startShake();
            },
            child: Text("Shake")),
      ),
    );
  }
}
