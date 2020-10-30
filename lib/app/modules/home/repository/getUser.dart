import 'package:dio/dio.dart';
import 'package:git_search/app/modules/home/models/userModel.dart';

//TODO: melhorar nome da classe: GithubRepositor
class GetUser {
  Response _response;
  final Dio _dio;

  GetUser(this._dio);

  pegarUser(String user) async {
    try {
      _response = await _dio.get('https://api.github.com/users/$user');
      return UserModel.fromJson(_response.data);
    } on DioError catch (e) {
      switch (e.response.statusCode) {
        case 404:
          return null;
          break;
        case 200:
          return null;
          break;
      }
    }
  }
}
