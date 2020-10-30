import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller
  final user = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Image.asset('assets/github-mark.png'),
            ),
            TextFormField(
              controller: user,
            ),
            RaisedButton(
              onPressed: () async {
                 var nome = await controller.getUser(user.text);
                 if (nome == null) return aleartWidget();
                 else{
                Modular.to.pushNamed('/user', arguments: nome);

                 }
                
              },
              child: Text('Pesquisar'),
            )
          ],
        ),
      ),
    );
  }

  aleartWidget() {
    return Flushbar(
      message: "Usuário não encontrado",
      icon: Icon(
        Icons.info_outline,
        size: 28.0,
        color: Colors.red[300],
      ),
      leftBarIndicatorColor: Colors.blue[300],
      duration: Duration(seconds: 3),
    )..show(context);
  }
}
