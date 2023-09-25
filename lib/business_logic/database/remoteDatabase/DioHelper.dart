
import 'package:dio/dio.dart';
import 'package:jobsque/core/enums.dart';

import '../local_database/cache_helper.dart';

class DioHelper{
  static late Dio dio;

  static init(){
    dio=Dio(
      BaseOptions(
        baseUrl: 'https://project2.amit-learning.com/api',            //https://newsapi.org/
        receiveDataWhenStatusError: true,
        // headers: {
        //   "Content-Type":"application/json"
        // },
      ),
    );
  }

  static Future<Response> getData ({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async
  {
    token=CashHelper.getString(key: MySharedKeys.token);
    dio.options.headers= {
      "Content-Type":"application/json",
      "Accept":"application/json",
      'Authorization': "Bearer ${token ?? ""}",
    };

    return await dio.get(url,
      queryParameters: query,
    );
  }




  static Future<Response> PostData ({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,

  }) async
  {
    token=CashHelper.getString(key: MySharedKeys.token);

    dio.options.headers= {
      "Content-Type":"application/json",
      "Accept":"application/json",
      'Authorization':"Bearer ${token ?? ""}",
    };

    return await dio.post(url,
        data: data,
        queryParameters: query
    );

  }

  static Future<Response> PutData ({
    required String url,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data,
    String? token,

  }) async
  {


    dio.options.headers= {
      "Content-Type":"application/json",
      'Authorization': "Bearer ${token ?? CashHelper.getString(key: MySharedKeys.token)}",
    };

    return await dio.put(url,
        data: data,
        queryParameters: query
    );

  }

}