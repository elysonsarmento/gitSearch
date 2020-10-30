import 'package:dio/dio.dart';
import 'package:git_search/app/modules/perfil/perfil_controller.dart';
import 'package:git_search/app/modules/perfil/repositories/getRepository.dart';

import 'app_controller.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter/material.dart';
import 'package:git_search/app/app_widget.dart';
import 'package:git_search/app/modules/home/home_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AppController,
        $PerfilController,
        Bind((i) => GetRepository(i.get())),
        Bind((i) => Dio()),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter(Modular.initialRoute, module: HomeModule()),
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
