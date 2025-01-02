import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesWidget extends StatefulWidget {
  const SharedPreferencesWidget({super.key});

  @override
  State<SharedPreferencesWidget> createState() =>
      _SharedPreferencesWidgetState();
}

class _SharedPreferencesWidgetState extends State<SharedPreferencesWidget> {
  List countryList = [];
  List<int> visitList = [];
  List<bool> isCheckedList = [];
  bool isChecked = false;
  TextEditingController visitedTimes = TextEditingController();
  TextEditingController visitedCountry = TextEditingController();

  void initState() {
    super.initState();
    _getInfotoList();
  }

  Future<void> _getInfotoList() async {
    final prefs = await SharedPreferences.getInstance();
    countryList = await prefs.getKeys().toList();
    visitList.clear();
    isCheckedList.clear();
    for (var i = 0; i < countryList.length; i++) {
      visitList.add(await _getInfo(countryList[i]));
      isCheckedList.add(false);
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 75,
          ),
          Container(
            padding: EdgeInsets.all(8),
            width: 400,
            height: 50,
            decoration: BoxDecoration(color: Colors.blueGrey[50]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 120,
                  child: TextField(
                    controller: visitedCountry,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintText: "country",
                        contentPadding: EdgeInsets.only(left: 15, top: 8),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                Container(
                  width: 120,
                  child: TextField(
                    controller: visitedTimes,
                    decoration: InputDecoration(
                        hintText: "times visited",
                        contentPadding: EdgeInsets.all(8),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
                ElevatedButton(
                    onPressed: () async {
                      await _saveInfo(
                          visitedCountry.text, int.parse(visitedTimes.text));
                      await _getInfotoList();
                      setState(() {});
                    },
                    child: Text("Submit")),
              ],
            ),
          ),
          Expanded(
            child: countryList.isEmpty
                ? Center(child: Text("No countries visited yet"))
                : Center(
                    child: ListView.builder(
                      itemCount: countryList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(12),
                          width: 400,
                          height: 50,
                          decoration: BoxDecoration(color: Colors.blueGrey[50]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${countryList[index]}",
                                style: TextStyle(fontSize: 15),
                              ),
                              Text(
                                "${visitList[index]} times visited",
                                style: TextStyle(fontSize: 15),
                              ),
                              Checkbox(
                                value: isCheckedList[index],
                                onChanged: (bool? value) async {
                                  setState(() {
                                    isChecked = value ?? false;
                                    isCheckedList[index] = isChecked;
                                  });
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
          )
        ],
      ),
    );
  }

  Future<void> _saveInfo(String name, int number) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(name, number);
  }

  Future<int> _getInfo(String name) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var numara = await prefs.getInt(name) ?? 0;
    return numara;
  }
}
