import 'package:flutter/material.dart';
import 'package:mvvm_example_flutter/core/base/base_view.dart';
import 'package:mvvm_example_flutter/features/authenticate/splash/viewmodel/splash_view_model.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
      return BaseView<SplashViewModel>(
    viewModel: SplashViewModel(),
    onModelReady: (model) {
    model.setContext(context);
    model.init();
  },
  onPageBuilder: (BuildContext context, SplashViewModel value) =>
    buildScaffoldBody(context, value),
  );
}

  Widget buildScaffoldBody(BuildContext context, SplashViewModel viewModel) {
    return const Scaffold(
    body: SafeArea(
      child: Center(child: Text('Splash page'))
    ));
  }
}