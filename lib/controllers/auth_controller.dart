import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../app/data/models/favourite.dart';
import '../app/data/models/profile_model.dart';
import '../app/data/models/response_model.dart';
import '../app/routes/app_pages.dart';
import '../repository/authentication_repo.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;

  AuthController({required this.authRepo});
  late String deviceData;
  late Profile _profile;
  bool isLoading = false;
  List<Favourite>? _fovourites;
  List<Favourite>? get favourites => _fovourites;

  Profile get profile => _profile;
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  late TextEditingController emailController,
      passwordController,
      phoneController,
      firstnameController,
      lastNameController,
      userNameController,
      dobController,
      genderController,
      countryController;

  var email = "";
  var password = "";
  var phone = "";
  var name = "";

  bool isLoggedIn() {
    return authRepo.isLoggedIn();
  }

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide Valid Email";
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return "Password must of 6 characters";
    }
    return null;
  }
  //
  // String getUserEmail(){
  //   return loginService.getUserEmail() ?? "";
  // }
  // String getUserPassword(){
  //   return loginService.getUserPassword() ?? "";
  // }

  Future<List<Favourite>> readJson() async {
    final response = await authRepo.getFavourites();
    if (response.statusCode == 200) {
      var result = response.body;
      return List<Favourite>.from(result.map((x) => Favourite.fromJson(x)));
    } else {
      throw Exception(response.statusText);
    }
  }

  Future<ResponseModel> login(String email, String password) async {
    isLoading = true;
    update();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceData = androidInfo.id!;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      deviceData = iosDeviceInfo.model!;
    }
    Response response = await authRepo.login(email, password, deviceData);
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body['token']);
      responseModel = ResponseModel(true, 'successful', 200);
    } else if (response.statusCode == 422) {
      responseModel = ResponseModel(false, "${response.body['message']}", 422);
    } else if (response.statusCode == 404) {
      responseModel = ResponseModel(false, "${response.body['message']}", 404);
    } else {
      responseModel = ResponseModel(false, "${response.statusText}", 0);
    }
    isLoading = false;
    update();
    return responseModel;
  }

  Future<void> getProfile() async {
    Response response = await authRepo.getProfileInfo("24");
    print(response.body);
    if (response.statusCode == 200) {
      _profile = Profile.fromJson(response.body);
    }
    update();
  }

  Future<ResponseModel> loginWithGoogle() async {
    GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken);
    // final authResult = await _auth.signInWithCredential(credential);
    // final _user = authResult.user;
    // final currentUser = await _auth.currentUser;

    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceData = androidInfo.id!;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      deviceData = iosDeviceInfo.model!;
    }

    print("User Access Token: ${googleSignInAuthentication.accessToken}");

    Response response = await authRepo.loginWithGoogle(
        "${googleSignInAuthentication.accessToken}", deviceData);
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      authRepo.saveUserToken(response.body['token']);
      await Get.find<AuthController>().getProfile();
      Get.offAllNamed(Routes.DASHBOARD);
      responseModel = ResponseModel(true, 'successful', 200);
    } else if (response.statusCode == 422) {
      responseModel = ResponseModel(false, "${response.body['message']}", 422);
    } else if (response.statusCode == 404) {
      responseModel = ResponseModel(false, "${response.body['message']}", 404);
    } else {
      responseModel = ResponseModel(false, "${response.statusText}", 0);
    }
    return responseModel;
  }

  Future<ResponseModel> register() async {
    final data = {
      "email": emailController.text.trim(),
      "password": passwordController.text.trim(),
      "username": userNameController.text.trim(),
      "first_name": firstnameController.text.trim(),
      "last_name": lastNameController.text.trim(),
      "gender": genderController.text.trim(),
      "country": countryController.text.trim(),
      "dob": dobController.text.trim(),
    };
    isLoading = true;
    update();
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceData = androidInfo.id!;
    } else if (Platform.isIOS) {
      IosDeviceInfo iosDeviceInfo = await deviceInfo.iosInfo;
      deviceData = iosDeviceInfo.model!;
    }
    Response response = await authRepo.register(data);
    ResponseModel responseModel;
    if (response.statusCode == 201) {
      authRepo.saveUserToken(response.body['token']);
      responseModel = ResponseModel(true, 'successful', 200);
    } else if (response.statusCode == 422) {
      responseModel = ResponseModel(false, "unprocessed entity, please check your details and try again", 422);
    } else if (response.statusCode == 404) {
      responseModel = ResponseModel(false, "${response.body['message']}", 404);
    } else {
      responseModel = ResponseModel(false, "${response.statusText}", 0);
    }
    isLoading = false;
    update();
    return responseModel;
  }

  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
    firstnameController = TextEditingController();
    lastNameController = TextEditingController();
    userNameController = TextEditingController();
    dobController = TextEditingController();
    genderController = TextEditingController();
    countryController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    userNameController.dispose();
    phoneController.dispose();
  }
}
