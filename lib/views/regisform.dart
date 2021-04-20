import 'package:flutter/material.dart';
import 'package:flutter_firebase_connect/action/dogs.dart';
import 'package:flutter_firebase_connect/views/login.dart';

// ignore: camel_case_types
class regisform extends StatefulWidget {
  regisform({Key key}) : super(key: key);

  @override
  _regisformState createState() => _regisformState();
}

// ignore: camel_case_types
class _regisformState extends State<regisform> {
  void initState() {
    super.initState();
  }

  double padding = 8;
  String welcome = "";
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController addresscontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false, //แก้ขอบชน
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Register'),
      ),
      body: Container(
        color: Colors.blueGrey,
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,

          children: [
            SizedBox(
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: TextField(
                  controller: firstnamecontroller,
                  decoration: InputDecoration(
                    hintText: 'FirstName',
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(padding),
              child: TextField(
                controller: lastnamecontroller,
                decoration: InputDecoration(hintText: 'LastName'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(padding),
              child: TextField(
                controller: addresscontroller,
                decoration: InputDecoration(hintText: 'Address'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(padding),
              child: TextField(
                controller: phonecontroller,
                decoration: InputDecoration(hintText: 'Tell'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(padding),
              child: TextField(
                controller: emailcontroller,
                decoration: InputDecoration(hintText: 'Email'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(padding),
              child: TextField(
                controller: passwordcontroller,
                decoration: InputDecoration(hintText: 'Password'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: 90,
                    height: 50,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(primary: Colors.green),
                        onPressed: () {
                          final res = ActionRegis().addNewRegis({
                            "FirstName": firstnamecontroller.text.trim(),
                            "LastName": lastnamecontroller.text.trim(),
                            "Address": addresscontroller.text.trim(),
                            "Tell": phonecontroller.text.trim(),
                            "Email": emailcontroller.text.trim(),
                            "Password": passwordcontroller.text.trim(),
                          });
                          print(res);
                          setState(() {
                            welcome = 'Register Success';
                          });
                        },
                        child: Text('Submit')),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SizedBox(
                    width: 90,
                    height: 50,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Login(),
                              ));
                        },
                        child: Text('Login')),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              welcome,
            ),
          ],
        ),
      ),
    );
  }
}
