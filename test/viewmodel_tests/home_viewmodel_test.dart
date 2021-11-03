import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_example_flutter/features/home/viewmodel/home_viewmodel.dart';

void main() {
  group('HomeViewModel Test -', () {
    test('when homeview created isLoading must equals true', () {
      var homeViewModel = HomeViewModel();
      homeViewModel.init();
      expect(homeViewModel.isLoading, true);
    });
  });
}
