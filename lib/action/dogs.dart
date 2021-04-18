import 'package:cloud_firestore/cloud_firestore.dart';

class ActionDog {
  String collection_name = 'datadog';
  FirebaseFirestore firestore_db;

  ActionDog() {
    firestore_db = FirebaseFirestore.instance;
  }

  getAllDog() async {
    final collection = firestore_db.collection(collection_name);
    QuerySnapshot res = await collection.get();
    final dataList = res.docs.map((doc) => doc.data()).toList();
    print(dataList);
    return dataList;
  }

  addNewDog(
    Map<String, dynamic> data,
  ) async {
    final collection = firestore_db.collection(collection_name);
    collection.doc(data['name']).set(data);
  }

  updateDog() async {}

  deleteDog(String datadog) async {
    final collection = firestore_db.collection(collection_name);
    collection.doc(datadog).delete();
  }
}
