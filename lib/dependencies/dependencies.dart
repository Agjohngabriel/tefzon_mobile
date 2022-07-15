import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tefzon/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:tefzon/app/modules/get_started/controllers/get_started_controller.dart';
import 'package:tefzon/app/modules/leagues/controllers/league_controller.dart';
import 'package:tefzon/controllers/auth_controller.dart';
import 'package:tefzon/repository/league_repository.dart';

import '../repository/authentication_repo.dart';
import '../services/api_client.dart';

Future<void> init() async{
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => ApiClient(appBaseUrl: "https://tefzon.herokuapp.com/api/", sharedPreferences: Get.find()));
  Get.lazyPut(() => AuthRepo(apiClient: Get.find(), sharedPreferences: Get.find()));
  Get.lazyPut(() => LeagueRepo(apiClient: Get.find()));

  Get.lazyPut(() => GetStartedController());
  Get.lazyPut(() => AuthController(authRepo: Get.find()));
  Get.lazyPut(() => DashboardController());
  Get.lazyPut(() => LeagueController(leagueRepo: Get.find()));
}