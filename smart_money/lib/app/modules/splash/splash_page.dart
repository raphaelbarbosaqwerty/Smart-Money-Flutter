import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'splash_controller.dart';

class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends ModularState<SplashPage, SplashController> {
  //use 'controller' variable to access controller

  ReactionDisposer disposer;

  @override
  void initState() {
    super.initState();
    disposer = autorun((_) async {
      var response = await controller.existsEntries();
      if(response.length == 0) {
        Modular.link.pushReplacementNamed('/welcome');
        return null;
      }

      Modular.to.pushReplacementNamed('/home');
    });
  }
  
  @override
  void dispose() {
    super.dispose();
    disposer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      )
    );
  }
}
