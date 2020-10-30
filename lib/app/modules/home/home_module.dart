import 'package:dio/dio.dart';
import 'package:git_search/app/modules/home/repository/getUser.dart';
import 'package:git_search/app/modules/perfil/perfil_controller.dart';
import 'package:git_search/app/modules/perfil/perfil_page.dart';

import 'home_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'home_page.dart';

class HomeModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $HomeController,
        $PerfilController,
        Bind((i) => GetUser(i.get())),
        Bind((i) => Dio()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, child: (_, args) => HomePage()),
        ModularRouter('/user', child: (_, args) => PerfilPage(user: args.data)),
      ];

  static Inject get to => Inject<HomeModule>.of();
}
