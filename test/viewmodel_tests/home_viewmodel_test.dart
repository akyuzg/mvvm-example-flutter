import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_example_flutter/features/home/viewmodel/home_viewmodel.dart';

import '../test_functions.dart';

void main() {
  group('HomeViewModel Test -', () {
    test('when homeview created isLoading must equals true', () {
      var homeViewModel = HomeViewModel();
      homeViewModel.init();
      expect(homeViewModel.isLoading, true);
    });
  });
}
