import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_example_flutter/features/_product/advisor/view/advisor_item_view.dart';
import 'package:mvvm_example_flutter/features/home/advisor/model/advisor_model.dart';

void main() {
  late AdvisorModel advisorModel;

  const String advisorName = "Halim";
  const modelData = {
    "name": advisorName,
    "imgUrl":
        "https://api.sembolfal.com/cdn-cgi/image/width=200,quality=85,format=auto/img/users/664237.jpg"
  };

  setUp(() {
    advisorModel = AdvisorModel.fromJson(modelData);
  });

  testWidgets('AdvisorItem Widget Test', (WidgetTester tester) async {
    final advisorItemView = AdvisorItemView(advisor: advisorModel);

    await tester.pumpWidget(MaterialApp(home: advisorItemView));

    expect(find.text(advisorName), findsOneWidget);
  });
}
