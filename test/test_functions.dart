import 'dart:convert';

import 'dart:io';

getMockData(String path) {
  return jsonDecode(File('test/test_resources/$path').readAsStringSync());
}
