import 'package:flutter/material.dart';

class FlexibleClass extends StatefulWidget {
  const FlexibleClass({super.key});

  @override
  State<FlexibleClass> createState() => _FlexibleClassState();
}

class _FlexibleClassState extends State<FlexibleClass> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 100,
                width: 100,
                child: Image.asset("assets/citibank_logo.png")),
            const Column(
              children: [
                Text(
                  "Welcome to",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                Text(
                  "BANK",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Container(
            height: 65,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 5),
                  child: Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(width: 3, color: Colors.yellow),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: Image.asset("assets/user_logo.png").image)),
                  ),
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Hello"),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                      ),
                      child: Text("Alex Martinez"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        balanceContainer(context, Colors.pink[100], Colors.pink[200],
            Icons.wallet, "Account Balance", "100,00₺"),
        balanceContainer(context, Colors.blue[100], Colors.blue[200],
            Icons.credit_card, "Credit Card Balance", "200,00₺"),
        balanceContainer(context, Colors.green[100], Colors.green[200],
            Icons.account_balance, "Retiremant Balance", "1000,00₺"),
        balanceContainer(context, Colors.yellow[100], Colors.yellow[200],
            Icons.attach_money, "Total Balance", "1300,00₺"),
        Spacer(),
        Container(
          height: 75,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(20)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.home,
                size: 30,
              ),
              Icon(Icons.wallet, size: 30),
              Icon(Icons.swap_horiz, size: 30),
              Icon(Icons.settings, size: 30)
            ],
          ),
        )
      ],
    );
  }

  Widget balanceContainer(
      BuildContext context,
      Color? containerColor,
      Color? iconColor,
      IconData icon,
      String containerText,
      String balanceText) {
    return Flexible(
        child: Container(
      margin: EdgeInsets.all(8),
      alignment: Alignment.centerLeft,
      height: MediaQuery.of(context).size.height * 0.1,
      width: double.infinity,
      decoration: BoxDecoration(
          color: containerColor, borderRadius: BorderRadius.circular(60)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            width: MediaQuery.of(context).size.width * 0.2,
            decoration: BoxDecoration(shape: BoxShape.circle, color: iconColor),
            child: Icon(
              icon,
              size: 35,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              containerText,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              balanceText,
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    ));
  }
}
