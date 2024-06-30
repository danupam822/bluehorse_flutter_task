import 'package:flutter_task/database/database_helper.dart';

import '../model/register_user_model.dart';

class RegistrationViewModel{
  final DatabaseHelper myDbHelper = DatabaseHelper();

  Future<void> saveUser(UserregisterModel userregisterModel) async {
    await DatabaseHelper.insert('users', userregisterModel.toMap());
  }
}