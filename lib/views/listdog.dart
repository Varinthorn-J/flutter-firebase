import 'package:flutter/material.dart';
import 'package:flutter_firebase_connect/action/dogs.dart';
import 'package:flutter_firebase_connect/views/usersdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_connect/views/login.dart';
import 'package:flutter/services.dart';
import 'package:flutter_firebase_connect/utilities/constants.dart';

// ignore: camel_case_types
class listdog extends StatefulWidget {
  listdog({Key key}) : super(key: key);

  @override
  _listdogState createState() => _listdogState();
}

// ignore: camel_case_types
class _listdogState extends State<listdog> {
  List dogs = [];
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    ActionDog().getAllDog().then((result) {
      print(result);
      setState(() {
        dogs = result;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF8BAFDB),
          title: Text('Animal Data'),
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF73AEF5),
                Color(0xFF61A4F1),
                Color(0xFF478DE0),
                Color(0xFF398AE5),
              ],
              stops: [0.1, 0.4, 0.7, 0.9],
            ),
          ),
          child: ListView.builder(
            itemCount: dogs.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Container(
                        color: Colors.white,
                        width: 350,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text('Name:  ${dogs[index]['name']}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child:
                                  Text('Species:  ${dogs[index]['species']}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text('Weight:  ${dogs[index]['weight']}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text('Age: ${dogs[index]['age']}'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: SizedBox(
                              width: 100,
                              height: 50,
                              child: RaisedButton(
                                elevation: 5.0,
                                onPressed: () {
                                  final res = ActionDog()
                                      .deleteDog("${dogs[index]['name']}");

                                  print(res);
                                  print('Delete Success');
                                },
                                padding: EdgeInsets.all(15.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                color: Colors.white,
                                child: Text(
                                  'Delete',
                                  style: TextStyle(
                                    color: Color(0xFF527DAA),
                                    letterSpacing: 1.5,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: SizedBox(
                              width: 100,
                              height: 50,
                              child: RaisedButton(
                                elevation: 5.0,
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => usersdata(),
                                    ),
                                  );
                                },
                                padding: EdgeInsets.all(15.0),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30.0),
                                ),
                                color: Colors.white,
                                child: Text(
                                  'Insert',
                                  style: TextStyle(
                                    color: Color(0xFF527DAA),
                                    letterSpacing: 1.5,
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ));
  }
}
