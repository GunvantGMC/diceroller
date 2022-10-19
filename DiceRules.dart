import 'package:flutter/material.dart';

class RulesPage extends StatefulWidget {
  @override
  _RulesPageState createState() => _RulesPageState();
}

class _RulesPageState extends State<RulesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scratch and Win"),
      ),
      body: Center(
        child: Text("The rules for this game are pretty simple"),
	child: Text("• Roll Dice once at a time"),
	child: Text("• Only one or max 2 users are allowed to play at a time"),
	child: Text("• Don't waste your time focus on game"),
      ),
    );
  }
}
