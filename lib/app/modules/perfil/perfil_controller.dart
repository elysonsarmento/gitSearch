import 'package:git_search/app/modules/perfil/models/repos_model.dart';
import 'package:git_search/app/modules/perfil/repositories/getRepository.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'perfil_controller.g.dart';

@Injectable()
class PerfilController = _PerfilControllerBase with _$PerfilController;

abstract class _PerfilControllerBase with Store {
  List<RepoModel> reposList;
  final GetRepository _getRepository;

  _PerfilControllerBase(this._getRepository);

   repositorios(user) async {
    reposList = await _getRepository.repositoryList(user);
    return reposList;
  }
}
