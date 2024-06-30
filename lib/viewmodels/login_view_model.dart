import 'package:flutter/cupertino.dart';

import '../database/database_helper.dart';
import '../model/login_data_model.dart';

class LoginViewModel extends ChangeNotifier {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? _errorMessage;

  String? get errorMessage => _errorMessage;
  String? address;
  int? userId;

  Future<bool> login() async {
    String email = emailController.text;
    String password = passwordController.text;

    Map<String, dynamic>? userMap = await DatabaseHelper.getUser(DatabaseHelper.defaultTableName, email);

    if (userMap != null) {
      LoginUserModel loginUserModel = LoginUserModel.fromMap(userMap);
      if (loginUserModel.password == password) {
        userId=loginUserModel.id;
        _errorMessage = null;
        notifyListeners();
        return true;
      } else {
        _errorMessage = 'Incorrect password';
        notifyListeners();
        return false;
      }
    } else {
      _errorMessage = 'User not found';
      notifyListeners();
      return false;
    }
  }


}