import 'package:get/get.dart';
import '../services/api_client.dart';

class LeagueRepo{
  final ApiClient apiClient;
  LeagueRepo({required this.apiClient});

  Future<Response> createLeague(Object data) async {
    return await apiClient.postData("leagues",
        data);
  }
  Future<Response> fetchPublicLeague() async {
    return await apiClient.getData("public-leagues");
  }

  Future<Response> fetchPrivateLeague() async {
    return await apiClient.getData("private-leagues");
  }

  Future<Response> joinPrivateLeague(Object data) async {
    return await apiClient.postData("join/private/league",
        data);
  }

  Future<Response> joinPublicLeague(Object data) async {
    return await apiClient.postData("join/private/league",
        data);
  }
}