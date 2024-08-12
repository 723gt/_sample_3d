import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_scene/camera.dart';
import 'package:flutter_scene/node.dart';
import 'package:flutter_scene/scene.dart';
import 'package:my_3d_app/scene_painter.dart';
import 'package:vector_math/vector_math.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  double horizontal = 10.0;
  Scene scene = Scene();

  @override
  void initState() {
    Node.fromAsset('build/models/DamagedHelmet.model').then((model) {
      model.name = 'Helmet';
      scene.add(model);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final painter = ScenePainter(
      scene: scene,
      camera: PerspectiveCamera(
        position: Vector3(sin(horizontal) * 3, 2, cos(horizontal) * 3),
        target: Vector3(0, 0, 0),
      ),
    );

    return MaterialApp(
      title: 'My 3D app',
      home: GestureDetector(
        child: CustomPaint(painter: painter),
        onHorizontalDragUpdate: (DragUpdateDetails details) {
          setState(() {
            horizontal += details.delta.dx / 10;
          });
        },
      ),
    );
  }
}
