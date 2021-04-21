import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_connect/views/login.dart';
import 'package:flutter_firebase_connect/views/regisform.dart';
import 'package:flutter_firebase_connect/views/usersdata.dart';

main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(App());
}
// main() => runApp(App());

class App extends StatelessWidget {
  // const App({Key key}) : super(key: key);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          // Check for errors
          if (snapshot.hasError) {
            return Scaffold(

              body: Center(
                child: Text('Error'),


              ),

            );
          }

          // Once complete, show your application
          if (snapshot.connectionState == ConnectionState.done) {
            return Login();
          }

          // Otherwise, show something whilst waiting for initialization to complete
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}
