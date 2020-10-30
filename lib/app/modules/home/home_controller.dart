import 'package:git_search/app/modules/home/models/userModel.dart';
import 'package:git_search/app/modules/home/repository/getUser.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  UserModel _result = UserModel();
  final GetUser _getUser;

  _HomeControllerBase(this._getUser);

  getUser(String user) async {
    _result = await _getUser.pegarUser(user);
    if (_result == null) {
      return null;
    } else {
      return _result;
    }
  }
}
