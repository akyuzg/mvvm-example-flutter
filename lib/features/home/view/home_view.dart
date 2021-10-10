import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Observer(builder: (_) {
            return viewModel.isLoading
                ? buildLoading()
                : viewModel.errorMesage != null
                    ? buildRetry(viewModel)
                    : (viewModel.advisors == null || viewModel.advisors!.isEmpty
                        ? const Center(child: Text('Advisors not Found'))
                        : buildAdvisorsList(viewModel, context));
          }),
        ),
      ),
    );
  }

  SizedBox buildRetry(HomeViewModel viewModel) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(viewModel.errorMesage ?? "error"),
          TextButton(
            style: TextButton.styleFrom(
              primary: Colors.blue,
              onSurface: Colors.red,
            ),
            onPressed: () {
              viewModel.getListAll();
            },
            child: const Text('Retry'),
          )
        ],
      ),
    );
  }

  buildAdvisorsList(HomeViewModel viewModel, BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => Column(
        children: [
          AdvisorItemView(advisor: viewModel.advisors![index]),
          const SizedBox(height: 8),
        ],
      ),
      itemCount: viewModel.advisors!.length,
    );
  }

  Center buildLoading() => const Center(child: CircularProgressIndicator());
}
