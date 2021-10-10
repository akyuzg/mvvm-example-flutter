import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:mvvm_example_flutter/features/home/advisor/model/advisor_model.dart';

import '../test_functions.dart';

void main() {
  test('AdvisorModel Test with (random_user.json)', () {
    final advisorModel = AdvisorModel.fromJson(getMockData("random_user.json"));

    expect(advisorModel.name, "Halim");
    expect(advisorModel.imgUrl,
        "https://api.sembolfal.com/cdn-cgi/image/width=200,quality=85,format=auto/img/users/664237.jpg");
  });
}
