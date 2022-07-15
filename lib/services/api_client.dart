import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../app/data/response/error_response.dart';

class ApiClient extends GetConnect implements GetxService {
  final String appBaseUrl;
  final SharedPreferences sharedPreferences;

  String? token;
  Map<String, String>? mainHeaders;

  ApiClient({required this.appBaseUrl,required this.sharedPreferences}) {
    baseUrl = appBaseUrl;
    timeout = Duration(seconds: 30);
    token = sharedPreferences.getString("TOKEN");
    print('Token: $token');
    mainHeaders = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token'
    };
  }

  Future<Response> getData(
      String uri, {
        Map<String, dynamic>? query,
        String? contentType,
        Map<String, String>? headers,
        Function(dynamic)? decoder,
      }) async {
    try {
      if (kDebugMode) {
        print('====> GetX Call: $uri\nToken: $token');
      }
      Response response = await get(
        uri,
        contentType: contentType,
        query: query,
        headers: headers ?? mainHeaders,
        decoder: decoder,
      );
      response = handleResponse(response);
      if (kDebugMode) {
        print(
            '====> GetX Response: [${response.statusCode}] $uri\n${response.body}');
      }
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(
      String uri,
      dynamic body, {
        Map<String, dynamic>? query,
        String? contentType,
        Map<String, String>? headers,
        Function(dynamic)? decoder,
        Function(double)? uploadProgress,
      }) async {
    try {
      if (kDebugMode) {
        print('====> GetX Call: $uri\nToken: $token');
        print('====> GetX Body: $body');
      }
      Response response = await post(
        uri,
        body,
        query: query,
        contentType: contentType,
        headers: headers ?? mainHeaders,
        decoder: decoder,
        uploadProgress: uploadProgress,
      );
      if (kDebugMode) {
        print(response.statusCode);
      }
      response = handleResponse(response);
      if (kDebugMode) {
        print(
            '====> GetX Response: [${response.statusCode}] $uri\n${response.body}');
      }
      return response;
    } catch (e) {
      print(e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> putData(
      String uri,
      dynamic body, {
        Map<String, dynamic>? query,
        String? contentType,
        Map<String, String>? headers,
        Function(dynamic)? decoder,
        Function(double)? uploadProgress,
      }) async {
    try {
      if (kDebugMode) {
        print('====> GetX Call: $uri\nToken: $token');
        print('====> GetX Body: $body');
      }
      Response response = await put(
        uri,
        body,
        query: query,
        contentType: contentType,
        headers: headers ?? mainHeaders,
        decoder: decoder,
        uploadProgress: uploadProgress,
      );
      response = handleResponse(response);
      if (kDebugMode) {
        print(
            '====> GetX Response: [${response.statusCode}] $uri\n${response.body}');
      }
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> deleteData(
      String uri, {
        Map<String, dynamic>? query,
        String? contentType,
        Map<String, String>? headers,
        Function(dynamic)? decoder,
      }) async {
    try {
      if (kDebugMode) {
        print('====> GetX Call: $uri\nToken: $token');
      }
      Response response = await delete(
        uri,
        headers: headers ?? mainHeaders,
        contentType: contentType,
        query: query,
        decoder: decoder,
      );
      response = handleResponse(response);
      if (kDebugMode) {
        print(
            '====> GetX Response: [${response.statusCode}] $uri\n${response.body}');
      }
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Response handleResponse(Response eResponse) {
    Response response = eResponse;
    if (response.hasError &&
        response.body != null &&
        response.body is! String) {
      if (response.body.toString().startsWith('{errors: [{code:')) {
        ErrorResponse errorResponse = ErrorResponse.fromJson(response.body);
        response = Response(
            statusCode: response.statusCode,
            body: response.body,
            statusText: errorResponse.errors[0].message);
      } else if (response.body.toString().startsWith('{message')) {
        response = Response(
            statusCode: response.statusCode,
            body: response.body,
            statusText: response.body['message']);
      }
    } else if (response.hasError && response.body == null) {
      response = const Response(
          statusCode: 0,
          statusText:
          'Connection to API server failed due to internet connection');
    }
    return response;
  }
}
