import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  int diceNum = 4;
  double height = 100, width = 100;
  AnimationController? rotationController;
  bool isRotating = false;
  @override
  void initState() {
    rotationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);

    rotationController!.addStatusListener((AnimationStatus status) {
      print("SS ${status.index}");
      if (status.index == 3) {
        getNewNum();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(rotationController!),
              child: Image.asset(
                "assets/images/$diceNum.png",
              ),
            ),
            const SizedBox(height: 100),
            FloatingActionButton.extended(
              onPressed: () async {
                rotationController!.forward(from: 0.0);
              },
              label: const Text("Shuffle"),
              icon: const Icon(Icons.shuffle),
            )
          ],
        ),
      ),
    );
  }

  void getNewNum() {
    int rndNum = Random().nextInt(6) + 1;
    if (rndNum == diceNum) {
      getNewNum();
      return;
    }
    setState(() {
      diceNum = rndNum;
      height = 100;
      width = 100;
      print("Rnd Num : $rndNum");
    });
  }
}
