import 'package:flutter/material.dart';
import 'package:flutter_firebase_connect/action/auth.dart';
import 'package:flutter_firebase_connect/views/home.dart';
import 'package:flutter_firebase_connect/views/regisform.dart';
import 'package:flutter_firebase_connect/views/usersdata.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  checkLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getString('uidToken') != null) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ));
    }
  }

  @override
  void initState() {
    checkLogin();
    super.initState();
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Login'),
      ),
      body: Column(
        children: [
          Column(
            children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(hintText: 'email'),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(hintText: 'password'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: SizedBox(
                      width: 90,
                      height: 50,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.red),
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => regisform(),
                                ));
                          },
                          child: Text('Sign Up')),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: SizedBox(
                      width: 90,
                      height: 50,
                      child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.green),
                          onPressed: () async {
                            SharedPreferences prefs =
                                await SharedPreferences.getInstance();

                            final result = await Auth().signInWithEmail(
                              email: emailController.text.trim(),
                              password: passwordController.text.trim(),
                            );
                            print('uid : $result');

                            prefs
                                .setString('uidToken', result)
                                .whenComplete(() {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => usersdata(),
                                  ));
                            });
                          },
                          child: Text('Sign In')),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
