import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
class DioHelper
{
  static Dio dio;

  static init()
  {
    dio= Dio(
      BaseOptions(baseUrl:'https://newsapi.org/' ,receiveDataWhenStatusError: true,
     
    
      )
    );
  }

 static Future<Response> getdat({@required String url,@required Map<String,dynamic> query})async{
    return await dio.get(url,queryParameters: query);
  }
  //https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=b9efc6459a404d86abaa35b9b23ac0cf
  //b9efc6459a404d86abaa35b9b23ac0cf 
}
