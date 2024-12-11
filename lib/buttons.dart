import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({super.key});

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
          ],
        ),
      ),
    );
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
