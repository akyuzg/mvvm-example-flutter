import 'package:flutter/material.dart';

class NotFoundNavigationWidget extends StatelessWidget {
  const NotFoundNavigationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return const Scaffold(
      body: SafeArea(
        child: Center(child: Text("page not found")),
      ),
    );
  }
}
