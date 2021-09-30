import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TestPageWithButtonWidget extends StatelessWidget {
  const TestPageWithButtonWidget({Key? key, this.onPush}) : super(key: key);

    final ValueChanged<int>? onPush;

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Scaffold(
      body: SafeArea(
        child: Center(
            child: TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          ),
          onPressed: () => onPush?.call(11),
          child: Text('page with a button'),
        )),
      ),
    );
  }
}
