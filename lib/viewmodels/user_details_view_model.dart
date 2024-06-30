// user_details_view_model.dart

import 'package:flutter/material.dart';

import '../database/database_helper.dart';
import '../model/user_details.dart';

class UserDetailsViewModel extends ChangeNotifier {
  UserDetails? user;

  Future<void> fetchUserDetails(String email) async {
    try {
      Map<String, dynamic>? userData = await DatabaseHelper.getUserDetailsByMail(email);
      if (userData != null) {
        user = UserDetails.fromJson(userData);
        notifyListeners();
      }
    } catch (e) {
      // Handle error
      print('Error fetching user details: $e');
    }
  }
}
