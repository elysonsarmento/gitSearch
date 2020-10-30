import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:git_search/app/modules/home/models/userModel.dart';
import 'package:git_search/app/modules/perfil/models/repos_model.dart';
import 'perfil_controller.dart';

class PerfilPage extends StatefulWidget {
  final UserModel user;
  final String title;
  const PerfilPage({Key key, this.title = "Perfil", this.user})
      : super(key: key);

  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends ModularState<PerfilPage, PerfilController> {
  @override
  Widget build(BuildContext context) {
    controller.repositorios(widget.user.login);
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
            flexibleSpace: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      maxRadius: 50,
                      child: Image.network(widget.user.avatarUrl),
                    ),
                    Text('${widget.user.name}'),
                    Column(
                      children: <Widget>[
                        info(widget.user.followers, Icon(Icons.people)),
                        info(widget.user.company, Icon(Icons.business)),
                        info(widget.user.location, Icon(Icons.map)),
                      ],
                    )
                  ],
                ),
              ),
            ),
            expandedHeight: 200.0,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(8)))),
        SliverList(
            delegate: SliverChildBuilderDelegate(
          (context, index) {
            RepoModel list = controller.reposList[index];
            return ListTile(
              title: Text("${list.name}"),
              subtitle: Row(
                children: <Widget>[Icon(Icons.star), Text('${list.stargazersCount}')],
              ),
            );
          },
          childCount: controller.reposList.length,
        ))
      ],
    ));
  }
}

info(dado, Icon icon) {
  return Row(
    children: <Widget>[
      Column(
        children: <Widget>[icon],
      ),
      Text(dado == null ? '' : '$dado')
    ],
  );
}
