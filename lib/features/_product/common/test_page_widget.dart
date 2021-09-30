import 'package:flutter/material.dart';

class TestPageWidget extends StatelessWidget {
  const TestPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return const Scaffold(
      body: SafeArea(
        child: Center(child: Text("test page")),
      ),
    );
  }
}
