import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
class UserViewModel with ChangeNotifier {

  Future<bool> saveUser(int userId) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setInt('token', userId);
    notifyListeners();
    return true;
  }
  Future<int?> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    int? token = sp.getInt('token');
    return token;
  }
  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true;
  }
  Future<bool> saveToken(String token) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('access_token', token);
    notifyListeners();
    return true;
  }
  Future<String?> getToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return sp.getString('access_token');
  }
  Future<bool> removeToken() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    return await sp.remove('access_token');
  }

  //
  // Future<bool> saveRole(int token) async {
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   sp.setInt('role', token);
  //   notifyListeners();
  //   return true;
  // }
  // Future<int?> getRole() async {
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   return sp.getInt('role');
  // }
  // Future<bool> removeRole() async {
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   return await sp.remove('role');
  // }


}