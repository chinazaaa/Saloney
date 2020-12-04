import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'firebase_cloud.dart';

/// Base Authentication for Firebase
///
/// This is where all the magic happens.Get everything about sing in with email and password
abstract class BaseConfig<T> {
  Future<String> signUpUser({String email, String password});
  Future<String> signInUser({String email, String password});
  Future<String> checkCurrentUser();
  Future<void> logOUt();
}

/// Firebase sign in with email and password class
///
/// This class contain all the method which is needed for firebase sign with email
class Authentication<T> extends BaseConfig<T> {
  // Intiallising firebase
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  final AddToDatabase add = AddToDatabase();

  @override
  Future<String> checkCurrentUser() async {
    return auth.currentUser != null ? auth.currentUser.uid : null;
  }

  @override
  Future<void> logOUt() async {
    return _firebaseAuth.signOut();
  }

  @override
  // ignore: missing_return
  Future<String> signInUser(
      {String email,
      String password,
      GlobalKey<ScaffoldState> scaffoldKey}) async {
    //  This is where all the magic for sign in with password happens
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // Assign the error to a variable
        scaffoldKey.currentState.showSnackBar(new SnackBar(
          content: new Text("The account already exists for $email."),
        ));
      } else if (e.code == 'wrong-password') {
        // Assign the error to a snackBar
        scaffoldKey.currentState.showSnackBar(new SnackBar(
          content: new Text("The password provided is too weak"),
        ));
      }
    } catch (e) {
      scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text("$e"),
      ));
    }
  }

  @override
  // ignore: missing_return
  Future<String> signUpUser(
      {email,
      password,
      GlobalKey<ScaffoldState> scaffoldKey,
      Map<String, dynamic> info}) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
     await add.addUser(data: info);
      return userCredential.user.uid;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        // Assign the error to a snackBar
        scaffoldKey.currentState.showSnackBar(new SnackBar(
          content: new Text("The password provided is too weak."),
        ));
      } else if (e.code == 'email-already-in-use') {
        // Assign the error to a variable
        scaffoldKey.currentState.showSnackBar(new SnackBar(
          content: new Text("The account already exists for $email."),
        ));
      }
    } catch (e) {
      scaffoldKey.currentState.showSnackBar(new SnackBar(
        content: new Text("$e"),
      ));
    }
  }
}
