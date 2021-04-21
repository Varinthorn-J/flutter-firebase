import 'package:flutter/material.dart';
import 'package:flutter_firebase_connect/views/login.dart';
import 'package:flutter_firebase_connect/views/regisform.dart';
import 'package:flutter_firebase_connect/views/usersdata.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_firebase_connect/views/profile.dart';

import 'usersdata.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('uidToken') != null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => usersdata(),
          ));
    }
  }

  String uid;
  String newuid = '';
  void getUid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      uid = prefs.getString('uidToken');
    });
  }

  @override
  void initState() {
    getUid();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF8BAFDB),
          title: Text('Home'),
        ),
        backgroundColor: Color(0xFF73AEF5),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
              )),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          width: 100,
                          child: ElevatedButton(
                              style:
                                  ElevatedButton.styleFrom(primary: Colors.red),
                              onPressed: () async {
                                SharedPreferences prefs =
                                    await SharedPreferences.getInstance();
                                // prefs.clear();
                                prefs.remove('uidToken');
                                setState(() {
                                  uid = 'Logout success';
                                  print(uid);
                                });
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Login(),
                                    ));
                              },
                              child: Text('Logout')),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          width: 100,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.green),
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => usersdata(),
                                    ));
                              },
                              child: Text('Insert ')),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: SizedBox(
                          width: 100,
                          child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => profile(),
                                    ));
                              },
                              child: Text('Profle')),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
