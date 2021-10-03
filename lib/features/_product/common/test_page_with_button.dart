import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mvvm_example_flutter/core/constants/navigation/navigation_constants.dart';
import 'package:mvvm_example_flutter/core/init/navigation/navigation_service.dart';

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
          onPressed: () {
            NavigationService.instance
                .navigateToPage(path: NavigationContants.navNotFound);
          },
          child: const Text('page with a button'),
        )),
      ),
    );
  }
}
