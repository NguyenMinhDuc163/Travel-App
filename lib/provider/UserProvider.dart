import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/models/user_model.dart';

class UserProvider extends ChangeNotifier {
  UserModel? user;

  void setUser(UserModel userModel) {
    user = userModel;
    notifyListeners();
  }
  void getUserData() async {
    String? userId = FirebaseAuth.instance.currentUser?.uid;
    if (userId != null) {
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance.collection('users').doc(userId).get();
      if (documentSnapshot.exists) {
        user = UserModel.fromMap(documentSnapshot.data() as Map<String, dynamic>, documentSnapshot.id);
        notifyListeners();
      }
    }
  }
}
