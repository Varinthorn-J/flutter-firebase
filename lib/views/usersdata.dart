import 'package:flutter/material.dart';
import 'package:flutter_firebase_connect/action/dogs.dart';
import 'package:flutter_firebase_connect/views/listdog.dart';
import 'package:flutter_firebase_connect/views/login.dart';

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

  String submit = '';
  String message = '';
  double padding = 8;
  String usedata = "";
  TextEditingController namecontroller = TextEditingController();
  TextEditingController speciescontroller = TextEditingController();
  TextEditingController agecontroller = TextEditingController();
  TextEditingController weightcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Register Form'),
      ),
      body: Container(
        color: Colors.blueGrey,
        child: Column(
          children: [
            // Container(
            //     color: Colors.blue,
            //     width: MediaQuery.of(context).size.width / 2,
            //     height: 20),
            Container(
              child: Column(
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
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: 100,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      onPressed: () {
                        final res = ActionDog().addNewDog({
                          "name": namecontroller.text.trim(),
                          "species": speciescontroller.text.trim(),
                          "weight": weightcontroller.text.trim(),
                          "age": agecontroller.text.trim(),
                        });
                        setState(() {
                          submit = 'submit success';
                          print(submit);
                        });

                        print(res);
                      },
                      child: Text('submit'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: 100,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.red,
                        ),
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => listdog(),
                              ));
                        },
                        child: Text('list')),
                  ),
                ),
                SizedBox(
                  width: 100,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.blue),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Login(),
                          ));
                    },
                    child: Text('home'),
                  ),
                ),
                Center(child: Text(usedata)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
