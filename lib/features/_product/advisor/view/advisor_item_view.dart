import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_example_flutter/core/base/base_view.dart';
import 'package:mvvm_example_flutter/features/_product/advisor/viewmodel/advisor_item_viewmodel.dart';

class AdvisorItemView extends StatelessWidget {
  const AdvisorItemView({Key? key}) : super(key: key);

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
          const CircleAvatar(
            radius: 40.0,
            backgroundColor: Color(0x33C4C4C4),
            backgroundImage: CachedNetworkImageProvider(
                "https://api.sembolfal.com/cdn-cgi/image/width=120,quality=85,format=auto/img/users/535486.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Manastırlı',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
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
