import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:mvvm_example_flutter/core/constants/enums/tab_enum.dart';
import 'package:mvvm_example_flutter/core/constants/navigation/bottom_navigation_constants.dart';
import 'package:mvvm_example_flutter/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("A integration test example", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle(const Duration(seconds: 5));

    //Open Store Tab
    await tester.tap(find.byKey(Key(tabName[TabItem.store]!)));
    await tester.pumpAndSettle();
    expect(find.text("test page"), findsOneWidget);
  });
}
