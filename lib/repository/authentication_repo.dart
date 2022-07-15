import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/api_client.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  AuthRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> login(
      String email, String password, String device_name) async {
    return await apiClient.postData("login",
        {"email": email, "password": password, "device_name": device_name});
  }
  Future<Response> register(Object data) async {
    return await apiClient.postData("register",
        data);
  }

  Future<Response> loginWithGoogle(String token, String device_name) async {
    return await apiClient.postData(
        "auth/google/login", {"token": token, "device_name": device_name});
  }

  Future<Response> getProfileInfo(String id) async {
    return await apiClient.getData('gamers/$id');
  }

  Future<Response> getFavourites() async {
    return await apiClient.getData('get/league/teams');
  }

  bool isLoggedIn() {
    return sharedPreferences.containsKey("TOKEN");
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.mainHeaders = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return await sharedPreferences.setString("TOKEN", token);
  }
//
// String? getUserEmail(){
//   return sharedPreferences.getString("USER_NUMBER");
// }
// String? getUserPassword(){
//   return sharedPreferences.getString("USER_PASSWORD");
// }
}
