import 'package:flutter/material.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:vector_math/vector_math_64.dart';

// TODO: This AR package can not run on Android
class ARpage extends StatefulWidget {
  ARpage({Key? key}) : super(key: key);

  @override
  State<ARpage> createState() => _ARpageState();
}

class _ARpageState extends State<ARpage> {
  late ARKitController arkitController;

  @override
  void dispose() {
    arkitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('ARKit in Flutter')),
        body: ARKitSceneView(onARKitViewCreated: onARKitViewCreated));
  }

  void onARKitViewCreated(ARKitController arkitController) {
    this.arkitController = arkitController;
    final node = ARKitNode(
        geometry: ARKitSphere(radius: 0.1), position: Vector3(0, 0, -0.5));
    this.arkitController.add(node);
  }
}
