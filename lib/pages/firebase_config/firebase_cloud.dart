import 'package:cloud_firestore/cloud_firestore.dart';

/// Base of the configuration
abstract class Database {
  // Add user
  Future<void> addUser();
}

///This function is use to add data to your firestore. You can call the one which fit for you
class AddToDatabase extends Database {
  // Create a CollectionReference called users that references the firestore collection
  CollectionReference users = FirebaseFirestore.instance.collection('users');
  @override
  Future addUser({Map<String, dynamic> data}) {
    // Call the user's CollectionReference to add a new user
    return users.add(data);
  }
}
