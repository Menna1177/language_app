import 'package:dio/dio.dart';

class QuizDioHelper{
  static Dio ?quizdio;

  static init()
  {
    quizdio=Dio(
        BaseOptions(
            baseUrl: 'https://quizapi.io/api/v1/'
        )
    );
  }
  static Future<Response> getquiz(String endpoint,
      Map<String,dynamic> query)
  async{
    query.addAll(
        {
          'apiKey': 'pHpvGOag0iSFtp3mcawz2Gxx5jwQXKE9PjayDtEH',
        }
    );
    return await quizdio!.get(endpoint,queryParameters: query);
  }
}