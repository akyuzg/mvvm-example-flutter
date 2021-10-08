import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_example_flutter/core/base/base_view.dart';
import 'package:mvvm_example_flutter/features/_product/advisor/viewmodel/advisor_item_viewmodel.dart';
import 'package:mvvm_example_flutter/features/home/advisor/model/advisor_model.dart';

class AdvisorItemView extends StatelessWidget {
  final AdvisorModel advisor;

  const AdvisorItemView({Key? key, required this.advisor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AdvisorItemViewModel>(
      viewModel: AdvisorItemViewModel(),
      onModelReady: (vm) {
        vm.setContext(context);
        vm.init();
      },
      onPageBuilder: (BuildContext context, AdvisorItemViewModel value) =>
          buildScaffoldBody(context, value),
    );
  }

  Widget buildScaffoldBody(
      BuildContext context, AdvisorItemViewModel viewModel) {
    var avatar = CircleAvatar(
      radius: 40.0,
      backgroundColor: const Color(0xFFF0F1F4),
      backgroundImage: CachedNetworkImageProvider(advisor.imgUrl ?? ""),
    );
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      child: Row(
        children: [
          avatar,
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  advisor.name!,
                  style: const TextStyle(
                      fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: const [
                    Text(
                      '440 Kredi',
                      style: TextStyle(
                          fontSize: 15, fontWeight: FontWeight.normal),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '4.7 Puan',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
