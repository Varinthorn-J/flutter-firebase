import 'package:flutter/material.dart';
import 'package:flutter_firebase_connect/action/dogs.dart';
import 'package:flutter_firebase_connect/views/usersdata.dart';

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
          title: Text('data dog'),
        ),
        body: ListView.builder(
          itemCount: dogs.length,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: [
                  Text('${dogs[index]['name']}'),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => usersdata(),
                            ));
                      },
                      child: Text('back')),
                  ElevatedButton(
                      onPressed: () {
                        ActionDog().deleteDog("datadog");
                      },
                      child: Text('delete')),
                ],
              ),
            );
          },
        ));
  }
}
