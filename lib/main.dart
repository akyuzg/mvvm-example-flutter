import 'package:flutter/material.dart';
import 'package:mvvm_example_flutter/core/init/notifier/provider_list.dart';
import 'package:mvvm_example_flutter/core/init/notifier/theme_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [...ApplicationProvider.instance.dependItems],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mvvm Example',
      theme: context.watch<ThemeNotifier>().currentTheme,
      home: const Center(
        child: Text("welcome app"),
      ),
    );
  }
}
