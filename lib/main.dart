import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_example_flutter/core/constants/navigation/navigation_constants.dart';
import 'package:mvvm_example_flutter/core/init/navigation/navigation_route.dart';
import 'package:mvvm_example_flutter/core/init/navigation/navigation_service.dart';
import 'package:mvvm_example_flutter/core/init/notifier/provider_list.dart';
import 'package:mvvm_example_flutter/core/init/theme/light/theme_data.dart';
import 'package:provider/provider.dart';

void main() async {
  await _init();
  runApp(MultiProvider(
    providers: [...ApplicationProvider.instance.dependItems],
    child: const MyApp(),
  ));
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mvvm Example',
      theme: themeData,
      navigatorKey: NavigationService.instance.mainNavigator,
      onGenerateRoute: NavigationRoute.instance.generateRoute,
      initialRoute: NavigationContants.navDefault,
    );
  }
}
