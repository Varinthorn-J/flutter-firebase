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
          backgroundColor: Colors.black,
          title: Text('Dog Data'),
        ),
        body: ListView.builder(
          itemCount: dogs.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text('Name:  ${dogs[index]['name']}'),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text('Species:  ${dogs[index]['species']}'),
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
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(14),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: SizedBox(
                            width: 80,
                            height: 40,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.red),
                                onPressed: () {
                                  final res = ActionDog()
                                      .deleteDog("${dogs[index]['name']}");
                                  print(res);
                                },
                                child: Text('delete')),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: SizedBox(
                            width: 80,
                            height: 40,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => usersdata(),
                                    ),
                                  );
                                },
                                child: Text('back')),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ));
  }
}
