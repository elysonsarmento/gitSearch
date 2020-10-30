import 'package:dio/dio.dart';
import 'package:git_search/app/modules/perfil/models/repos_model.dart';

class GetRepository {
  final Dio _dio;

  GetRepository(this._dio);

  Future<List<RepoModel>> repositoryList(user) async {
    final response =
        await _dio.get('https://api.github.com/users/$user/repos');
    return (response.data as List)
        .map((data) => RepoModel.fromJson(data))
        .toList();
  }
}
