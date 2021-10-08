import 'package:flutter/material.dart';
import 'package:mvvm_example_flutter/core/base/base_view.dart';
import 'package:mvvm_example_flutter/features/_product/advisor/view/advisor_item_view.dart';
import 'package:mvvm_example_flutter/features/home/viewmodel/home_viewmodel.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      viewModel: HomeViewModel(),
      onModelReady: (vm) {
        vm.setContext(context);
        vm.init();
      },
      onPageBuilder: (BuildContext context, HomeViewModel value) =>
          buildScaffoldBody(context, value),
    );
  }

  Widget buildScaffoldBody(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F1F4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: const [
              AdvisorItemView(),
              SizedBox(height: 8),
              AdvisorItemView(),
              SizedBox(height: 8),
              AdvisorItemView(),
            ],
          ),
        ),
      ),
    );
  }
}
