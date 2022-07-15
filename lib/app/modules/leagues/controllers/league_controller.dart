import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:tefzon/app/data/models/league_model.dart';
import 'package:tefzon/repository/league_repository.dart';

import '../../../data/models/response_model.dart';

class LeagueController extends GetxController implements GetxService {
  final LeagueRepo leagueRepo;
  LeagueController({required this.leagueRepo});
  bool isLoading = false;
  List<LeagueModel>? _leagues;
  List<LeagueModel>? get leagues => _leagues;

  Future<ResponseModel> createLeague(Object data) async {
    isLoading = true;
    update();
    Response response = await leagueRepo.createLeague(data);
    print(response.statusCode);
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, 'successful', 200);
    } else if (response.statusCode == 422) {
      responseModel = ResponseModel(false, "${response.body['message']}", 422);
    } else if (response.statusCode == 404) {
      responseModel = ResponseModel(false, "${response.body['message']}", 404);
    } else if (response.statusCode == 405) {
      responseModel = ResponseModel(false, "${response.body['message']}", 405);
    } else {
      responseModel = ResponseModel(false, "${response.statusText}", 0);
    }
    isLoading = false;
    update();
    return responseModel;
  }

  Future<List<LeagueModel>> fetchPrivate() async {
    Response response = await leagueRepo.fetchPrivateLeague();
    if (response.statusCode == 200) {
      var result = response.body;
      return List<LeagueModel>.from(result.map((x) => LeagueModel.fromJson(x)));
      ;
    } else {
      throw Exception(response.statusText);
    }
  }

  Future<ResponseModel> joinPrivateLeague(Object data) async {
    isLoading = true;
    update();
    Response response = await leagueRepo.joinPrivateLeague(data);
    if (kDebugMode) {
      print(response.statusCode);
    }
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, 'successful', 200);
    } else if (response.statusCode == 422) {
      responseModel = ResponseModel(false, "${response.body['message']}", 422);
    } else if (response.statusCode == 404) {
      responseModel = ResponseModel(false, "${response.body['message']}", 404);
    } else if (response.statusCode == 405) {
      responseModel = ResponseModel(false, "${response.body['message']}", 405);
    } else {
      responseModel = ResponseModel(false, "${response.statusText}", 0);
    }
    isLoading = false;
    update();
    return responseModel;
  }

  Future<List<LeagueModel>> fetchPublic() async {
    Response response = await leagueRepo.fetchPublicLeague();
    if (response.statusCode == 200) {
      var result = response.body;
      return List<LeagueModel>.from(result.map((x) => LeagueModel.fromJson(x)));
      ;
    } else {
      throw Exception(response.statusText);
    }
  }

  Future<ResponseModel> joinPublicLeague(Object data) async {
    isLoading = true;
    update();
    Response response = await leagueRepo.joinPrivateLeague(data);
    if (kDebugMode) {
      print(response.statusCode);
    }
    ResponseModel responseModel;
    if (response.statusCode == 200) {
      responseModel = ResponseModel(true, 'successful', 200);
    } else if (response.statusCode == 422) {
      responseModel = ResponseModel(false, "${response.body['message']}", 422);
    } else if (response.statusCode == 404) {
      responseModel = ResponseModel(false, "${response.body['message']}", 404);
    } else if (response.statusCode == 405) {
      responseModel = ResponseModel(false, "${response.body['message']}", 405);
    } else {
      responseModel = ResponseModel(false, "${response.statusText}", 0);
    }
    isLoading = false;
    update();
    return responseModel;
  }
}
