import 'package:flutter/material.dart';
class PageControlWidget extends StatefulWidget {
  const PageControlWidget({super.key});

  @override
  State<PageControlWidget> createState() => _PageControlWidgetState();
}

class _PageControlWidgetState extends State<PageControlWidget> {
  String buttonText1 = "Back";
  String buttonText2 = "Continiue";
  String screenText = "";
  String textFieldText = "";
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Alert Button"),
              onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  Future.delayed(const Duration(seconds: 2), () {
                    Navigator.of(context).pop();
                  });
                  return AlertDialog(
                    title: const Text("Auto Close AlertDialog"),
                    content:
                        const Text("This dialog will close after 2 seconds."),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              child: Text("Alert Button with cancel button"),
              onPressed: () => showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    actions: <Widget>[
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("cancel"))
                    ],
                    title: const Text("Button Close AlertDialog"),
                    content: const Text("Press cancel to close."),
                  );
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Alert Button with 2 buttons"),
                          content:
                              Text("Press a button to print title to screen"),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    screenText = buttonText1;
                                    Navigator.pop(context);
                                  });
                                },
                                child: Text(buttonText1)),
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    screenText = buttonText2;
                                    Navigator.pop(context);
                                  });
                                },
                                child: Text(buttonText2))
                          ],
                        );
                      },
                    ),
                child: Text("Alert Button with 2 buttons")),
            SizedBox(
              height: 20,
            ),
            Text(screenText),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Textfield dialog"),
                          content: TextField(
                            controller: textEditingController,
                            decoration: InputDecoration(
                                hintText: "Enter a text to display"),
                          ),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () {
                                  setState(() {
                                    textFieldText = textEditingController.text;
                                    Navigator.pop(context);
                                  });
                                },
                                child: Text("Print text on screen"))
                          ],
                        );
                      },
                    ),
                child: Text("Alert button with text field")),
            SizedBox(
              height: 20,
            ),
            Text(textEditingController.text),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () => showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Action sheet dialog"),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ListTile(
                                leading: Icon(Icons.share),
                                title: Text("Share"),
                                onTap: () {
                                  print("Share pressed");
                                  // Share.share("Bu bir paylaşim mesajidir",
                                  //     subject: "Flutter lessons");
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.edit),
                                title: Text("Edit"),
                                onTap: () {
                                  print("Edit pressed");
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: Icon(Icons.delete),
                                title: Text("Delete"),
                                onTap: () {
                                  print("Delete pressed");
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          ),
                        );
                      },
                    ),
                child: Text("Alert button with action sheet"))
          ],
        ),
      ),
    );
  }
}
