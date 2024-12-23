import 'dart:math';

import 'package:flutter/material.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBarWidget> {
  TextEditingController textEditingController = TextEditingController();
  List<String> randomNames = [];

  void initState() {
    super.initState();
    randomNames = generateRandomNames(50);
    var randomname = randomNames[1];
    randomNames.contains("Mini Mouse") ? null : randomNames.add("Mini Mouse");
  }

  final List<String> firstNames = [
    "John",
    "Jane",
    "Alex",
    "Emily",
    "Chris",
    "Katie",
    "Michael",
    "Sarah",
    "David",
    "Laura",
    "Mini"
  ];
  final List<String> lastNames = [
    "Smith",
    "Johnson",
    "Brown",
    "Taylor",
    "Anderson",
    "Thomas",
    "Jackson",
    "White",
    "Harris",
    "Martin",
    "Mouse"
  ];

  List<String> searchedList = [];

  List<String> generateRandomNames(int count) {
    Random random = Random();
    return List.generate(count, (index) {
      String firstName = firstNames[random.nextInt(firstNames.length)];
      String lastName = lastNames[random.nextInt(lastNames.length)];
      return "$firstName $lastName";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: SearchBar(
            padding: const WidgetStatePropertyAll(EdgeInsets.only(left: 15)),
            controller: textEditingController,
            hintText: "Search a name",
            onChanged: (value) {
              setState(() {
                searchedList.clear();

                String searchQuery = value.toLowerCase();
                for (var member in randomNames) {
                  List<String> nameParts = member.split(" ");
                  String name = nameParts.first.toLowerCase();
                  String surname = nameParts.last.toLowerCase();
                  if (name.startsWith(searchQuery) ||
                      surname.startsWith(searchQuery)) {
                    searchedList.add(member);
                  }
                }
              });
            },
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Flexible(
            child: textEditingController.text == ""
                ? Padding(
                    padding: const EdgeInsets.only(left: 100, right: 100),
                    child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: randomNames.length,
                        itemBuilder: (context, index) {
                          return Container(
                              padding: EdgeInsets.all(30),
                              height: 75,
                              width: 100,
                              color: Colors.grey[300],
                              child: Center(child: Text(randomNames[index])));
                        }),
                  )
                : Padding(
                    padding: const EdgeInsets.only(left: 100, right: 100),
                    child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: searchedList.length,
                        itemBuilder: (context, index) {
                          return Container(
                              padding: EdgeInsets.all(30),
                              height: 75,
                              width: 100,
                              color: Colors.grey[300],
                              child: Center(child: Text(searchedList[index])));
                        }),
                  )),
      ],
    );
  }
}
