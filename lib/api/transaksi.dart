import 'dart:convert';
import 'dart:core';
import 'dart:io';

import 'package:applikasi_keuangan/global/error_message.dart';
import 'package:applikasi_keuangan/global/variable.dart';
import 'package:applikasi_keuangan/model/Account.dart';
import 'package:applikasi_keuangan/model/global_response.dart';
import 'package:applikasi_keuangan/model/transaksi.dart';
import 'package:dio/dio.dart';

class ApiListAccount {
  String? status;
  String? message;
  List<Account>? data;

  ApiListAccount({this.status, this.message, this.data});

  ApiListAccount.fromJson(Map<String, dynamic> json)
      : status = json["status"],
        message = json["message"],
        data = json.containsKey("data")
            ? List<Account>.from(json["data"].map((x) => Account.fromJson(x))).toList()
            : null;

  ApiListAccount.fromStringJson(String stringJson) : this.fromJson(json.decode(stringJson));

  Map<String, dynamic> toJson() => {"status": status, "message": message};

  String toStringJson() => jsonEncode(this.toJson());

  bool isSucces() => status!.toUpperCase() == "SUCCESS";

  static Future<ApiListAccount> futureApiListAccount({required String endPoint}) async {
    var dio = Dio();
    String url = api_url + "users/$endPoint";
    try {
      Response response = await dio.get(url);
      print(response.data);
      return ApiListAccount.fromStringJson(response.toString());
    } on DioError catch (e) {
      if (e.response != null) {
        return ApiListAccount(
            status: "fail", message: ErrorMessage.getMessage(e.response!.statusCode!));
      } else {
        return ApiListAccount(status: "fail", message: ErrorMessage.getMessage(0));
      }
    }
  }

  static Future<GlobalResponse> futureApiCreateTransaction(
      {String? token,
      String? invoiceNumber,
      int? accountId,
      String? date,
      String? description,
      int? debit,
      int? kredit}) async {
    var dio = Dio();
    String url = api_url + "users/create_transaction";
    dio.options.headers[HttpHeaders.authorizationHeader] = 'Bearer ' + token!;
    FormData formData = new FormData.fromMap({
      "invoice_number": invoiceNumber,
      "account_id": accountId,
      "transaction_date": date,
      "description": description,
      "amount_debit": debit,
      "amount_credit": kredit,
    });
    try {
      Response response = await dio.post(url, data: formData);
      print(response.data);
      return GlobalResponse.fromStringJson(response.toString());
    } on DioError catch (e) {
      if (e.response != null) {
        return GlobalResponse(
            status: "fail", message: ErrorMessage.getMessage(e.response!.statusCode!));
      } else {
        return GlobalResponse(status: "fail", message: ErrorMessage.getMessage(0));
      }
    }
  }
}

class ApiListTransaction {
  String? status;
  String? message;
  List<Transaksi>? data;

  ApiListTransaction({this.status, this.message, this.data});

  ApiListTransaction.fromJson(Map<String, dynamic> json)
      : status = json["status"],
        message = json["message"],
        data = json.containsKey("data")
            ? List<Transaksi>.from(json["data"].map((x) => Transaksi.fromJson(x))).toList()
            : null;

  ApiListTransaction.fromStringJson(String stringJson) : this.fromJson(json.decode(stringJson));

  Map<String, dynamic> toJson() => {"status": status, "message": message};

  String toStringJson() => jsonEncode(this.toJson());

  bool isSucces() => status!.toUpperCase() == "SUCCESS";

  static Future<ApiListTransaction> futureApiListTransaction(String token) async {
    var dio = Dio();
    String url = api_url + "users/list_transaction_day";
    dio.options.headers[HttpHeaders.authorizationHeader] = 'Bearer ' + token;
    try {
      Response response = await dio.get(url);
      print("Transaksi Today ${response.data}");
      return ApiListTransaction.fromStringJson(response.toString());
    } on DioError catch (e) {
      if (e.response != null) {
        return ApiListTransaction(
            status: "fail", message: ErrorMessage.getMessage(e.response!.statusCode!));
      } else {
        return ApiListTransaction(status: "fail", message: ErrorMessage.getMessage(0));
      }
    }
  }

  static Future<ApiListTransaction> futureApiHistoryListTransaction(String token) async {
    var dio = Dio();
    String url = api_url + "users/list_transaction";
    dio.options.headers[HttpHeaders.authorizationHeader] = 'Bearer ' + token;
    try {
      Response response = await dio.get(url);
      print(response.data);
      return ApiListTransaction.fromStringJson(response.toString());
    } on DioError catch (e) {
      if (e.response != null) {
        return ApiListTransaction(
            status: "fail", message: ErrorMessage.getMessage(e.response!.statusCode!));
      } else {
        return ApiListTransaction(status: "fail", message: ErrorMessage.getMessage(0));
      }
    }
  }
}
