import 'package:flutter/material.dart';

import 'login.dart';

// ignore: camel_case_types
class usersdata extends StatefulWidget {
  usersdata({Key key}) : super(key: key);

  @override
  _usersdataState createState() => _usersdataState();
}

// ignore: camel_case_types
class _usersdataState extends State<usersdata> {
  void initState() {
    super.initState();
  }

  double padding = 8;
  String usedata = "";
  TextEditingController namecontroller = TextEditingController();
  TextEditingController speciescontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController weightcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dog data'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: namecontroller,
              decoration: InputDecoration(hintText: 'name'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: speciescontroller,
              decoration: InputDecoration(hintText: 'species'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: weightcontroller,
              decoration: InputDecoration(hintText: 'weight'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: agecontroller,
              decoration: InputDecoration(hintText: 'age'),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  usedata = "${namecontroller.text.trim()}\n"
                      "${speciescontroller.text.trim()}\n"
                      "${weightcontroller.text.trim()}\n"
                      "${agecontroller.text.trim()}\n";
                });
              },
              child: Text('submit')),
          ElevatedButton(
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ));
            },
            child: Text('back'),
          ),
          Center(child: Text(usedata)),
        ],
      ),
    );
  }
}
