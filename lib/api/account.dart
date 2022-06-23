import 'dart:convert';
import 'dart:io';

import 'package:applikasi_keuangan/global/error_message.dart';
import 'package:applikasi_keuangan/global/variable.dart';
import 'package:applikasi_keuangan/model/global_response.dart';
import 'package:applikasi_keuangan/model/user.dart';
import 'package:dio/dio.dart';

class ApiProfile {
  String? status;
  String? message;
  User? user;

  ApiProfile({this.status, this.message, this.user});

  ApiProfile.fromJson(Map<String, dynamic> json)
      : status = json["status"],
        message = json["message"],
        user = User.fromJson(json);

  ApiProfile.fromStringJson(String stringJson) : this.fromJson(json.decode(stringJson));

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "id": user!.id,
        "email": user!.email,
        "id_token": user!.idToken
      };

  String toStringJson() => json.encode(this.toJson());

  bool isSuccess() => status!.toUpperCase() == "SUCCESS";

  static Future<ApiProfile> futureApiProfile(String token) async {
    var dio = Dio();
    String url = api_url + "users/detail_profile";
    try {
      Response response =
          await dio.get(url, options: Options(headers: {"Authorization": "Bearer " + token}));
      print(response);
      return ApiProfile.fromStringJson(response.toString());
    } on DioError catch (e) {
      if (e.response != null) {
        return ApiProfile(status: "fail", message: ErrorMessage.getMessage(0));
      } else {
        return ApiProfile(status: "fail", message: ErrorMessage.getMessage(0));
      }
    }
  }

  static Future<GlobalResponse> futureApiLogout(String token) async {
    var dio = Dio();
    String url = api_url + "users/logout";
    dio.options.headers[HttpHeaders.authorizationHeader] = 'Bearer ' + token;
    try {
      Response response = await dio.post(url);
      print(response.data);
      return GlobalResponse.fromStringJson(response.toString());
    } on DioError catch (e) {
      if (e.response != null) {
        return GlobalResponse(status: "fail", message: ErrorMessage.getMessage(e.hashCode));
      } else {
        return GlobalResponse(status: "fail", message: ErrorMessage.getMessage(0));
      }
    }
  }
}
