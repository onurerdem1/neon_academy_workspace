import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FutureTech extends StatefulWidget {
  const FutureTech({super.key});

  @override
  State<FutureTech> createState() => _FutureTechState();
}

class _FutureTechState extends State<FutureTech> {
  bool switchState1 = true;
  bool switchState2 = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 30, bottom: 20),
                child: Container(
                  height: 50,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.grey[800]),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.cloud,
                        color: Colors.white,
                        size: 30,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_sharp,
                                size: 15,
                                color: Colors.amber,
                              ),
                              Text(
                                "Istanbul",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              )
                            ],
                          ),
                          Text(
                            "+25,cloudy",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text(
                        ">",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const Expanded(flex: 2, child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 30, bottom: 20),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey[800]),
                child: const Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
        Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey[800],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, top: 15),
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            width: 200,
                            height: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.grey[700]),
                            child: const Row(
                              children: [
                                Expanded(
                                    child: Text(
                                  "Smart speaker",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 11),
                                )),
                                Expanded(
                                    child: Text(
                                  "BROADCASTİNG",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.amber,
                                      fontSize: 11),
                                )),
                              ],
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15, top: 35),
                          child: Text(
                            "Beartooth",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15, top: 5),
                          child: Text(
                            "YOU NEVER KNOW",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 15, top: 25),
                          child: Row(
                            children: [
                              Icon(
                                Icons.bluetooth_connected,
                                color: Colors.grey,
                                size: 18,
                              ),
                              Text(
                                "SAMSUNG QN95B - YOUTUBE",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 10),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image:
                                      Image.asset("assets/beartooth_edited.jpg")
                                          .image)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )),
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20, top: 25, bottom: 5),
              child: Text(
                "Quick access",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 25, bottom: 5),
              child: Text(
                "ALL DEVICES >",
                style: TextStyle(color: Colors.amber[300], fontSize: 15),
              ),
            )
          ],
        ),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Expanded(
                  flex: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[800]),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  Icons.desktop_windows_rounded,
                                  color: Colors.white,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Switch(
                                      thumbColor:
                                          WidgetStateProperty.all(Colors.white),
                                      activeTrackColor: Colors.amber,
                                      inactiveTrackColor: Colors.grey,
                                      value: switchState1,
                                      onChanged: (value) {
                                        setState(() {
                                          switchState1 = value;
                                        });
                                      }),
                                )
                              ],
                            ),
                            Text(
                              "Smart TV",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 10),
                            ),
                            Text(
                              "Samsung 55” Neo",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "QLED 4K QN95B",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
              const Expanded(flex: 1, child: SizedBox()),
              Expanded(
                flex: 10,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 20,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey[800]),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, top: 5),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.cleaning_services,
                                color: Colors.white,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 5),
                                child: Switch(
                                    thumbColor:
                                        WidgetStateProperty.all(Colors.white),
                                    activeTrackColor: Colors.amber,
                                    inactiveTrackColor: Colors.grey,
                                    value: switchState2,
                                    onChanged: (value) {
                                      setState(() {
                                        switchState2 = value;
                                      });
                                    }),
                              )
                            ],
                          ),
                          Text(
                            "Robot Cleaner",
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                          Text(
                            "XIAOMI Mi Robot",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Vacuum-Map 2 Pro",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Row(
          children: [
            const Padding(
              padding:
                  EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 20),
              child: Text(
                "Favourite scenes",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            const Expanded(child: SizedBox()),
            Padding(
              padding: const EdgeInsets.only(
                  right: 20, left: 20, bottom: 10, top: 20),
              child: Text(
                "^",
                style: TextStyle(color: Colors.amber[300], fontSize: 20),
              ),
            )
          ],
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[800],
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Good Monday morning!",
                            style: TextStyle(
                              color: Colors.amber[200],
                              fontSize: 15,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Icon(
                            Icons.notifications_none,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Every Monday",
                              style: TextStyle(color: Colors.grey),
                            ),
                            Text(
                              "6:00AM",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Flexible(
                          child: Container(
                            height: 50,
                            width: 150,
                            decoration: BoxDecoration(
                              color: Colors.grey[850],
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey[800],
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Icon(
                                      Icons.power_settings_new,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    "Start Screen",
                                    style: TextStyle(color: Colors.white),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  ">>",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[800],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.devices_other,
                    color: Colors.white,
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.amber),
                    child: Icon(Icons.mic),
                  ),
                  Icon(
                    Icons.calendar_month,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.settings,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
