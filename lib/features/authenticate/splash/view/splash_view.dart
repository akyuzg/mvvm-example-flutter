import 'package:flutter/material.dart';
import 'package:mvvm_example_flutter/core/base/base_view.dart';
import 'package:mvvm_example_flutter/features/authenticate/splash/viewmodel/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      viewModel: SplashViewModel(),
      onModelReady: (vm) {
        vm.setContext(context);
        vm.init();
      },
      onPageBuilder: (BuildContext context, SplashViewModel value) =>
          buildScaffoldBody(context, value),
    );
  }

  Widget buildScaffoldBody(BuildContext context, SplashViewModel viewModel) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
            child: Center(
                child: Text('SEMBOL',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 36,
                        fontWeight: FontWeight.bold)))));
  }
}
