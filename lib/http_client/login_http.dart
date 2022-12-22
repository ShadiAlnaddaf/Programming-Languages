import 'package:consulting/main.dart';
import 'package:consulting/models/login_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';



void postLogin(String email , String password) async {
  Dio? dio = Dio();
    var response = await dio.post("http://192.168.43.174:80/api/login",
        data: LoginModel(email: email, password: password)
            .toJson()).then((value) => value.data).catchError((err) => "err");
if(response!="err"){
  sharedPreferences?.setString('token', 'aa');
}
    print(response);

  }
// class DioHelper{
//   Dio? dio;
//   Future<LoginModel?> postData()async{
//     return null;
//   }
// }

// class Endpoint{
//   String baseUrl = "http://127.0.0.1/api/";
// }