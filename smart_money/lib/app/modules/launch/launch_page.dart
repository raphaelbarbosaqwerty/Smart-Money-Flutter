import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:steps/steps.dart';
import 'launch_controller.dart';

class LaunchPage extends StatefulWidget {
  final String title;
  const LaunchPage({Key key, this.title = "Launch"}) : super(key: key);

  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends ModularState<LaunchPage, LaunchController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
          alignment: Alignment.topCenter,
          child: Steps(
            direction: Axis.vertical,
            size: 20.0,
            path: {'color': Colors.lightBlue.shade200, 'width': 3.0},
            steps: [
              {
                'color': Colors.white,
                'background': Colors.lightBlue.shade200,
                'label': '1',
                'content': Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Laborum exercitation',
                      style: TextStyle(fontSize: 22.0),
                    ),
                    Text(
                      'Qui et consectetur esse duis excepteur magna consectetur.',
                      style: TextStyle(fontSize: 12.0),
                    ),
                  ],
                ),
              },
              {
                'color': Colors.white,
                'background': Colors.lightBlue.shade700,
                'label': '2',
                'content': Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'Laborum exercitation est veniam',
                      style: TextStyle(fontSize: 22.0),
                    ),
                    Text(
                      '''
Occaecat qui do mollit
Adipisicing reprehenderit deserunt mollit
Quis officia adipisicing aute
                      ''',
                      style: TextStyle(fontSize: 12.0),
                    )
                  ],
                )
              },
              {
                'color': Colors.white,
                'background': Colors.lightBlue.shade200,
                'label': '3',
              },
              {
                'color': Colors.white,
                'background': Colors.lightBlue.shade200,
                'label': '',
              }
            ],
          ),
      )
    );
  }
}
