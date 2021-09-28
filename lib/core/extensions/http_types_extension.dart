import 'package:mvvm_example_flutter/core/constants/enums/http_types_enum.dart';

extension HttpTypeExtension on HttpTypes? {
  String get rawValue {
    switch (this) {
      case HttpTypes.GET:
        return 'GET';
      case HttpTypes.POST:
        return 'POST';
      default:
        throw 'ERROR TYPE';
    }
  }
}
