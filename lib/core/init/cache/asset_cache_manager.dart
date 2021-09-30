import 'package:dio/dio.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvvm_example_flutter/core/constants/enums/tab_enum.dart';
import 'package:mvvm_example_flutter/core/constants/navigation/bottom_navigation_constants.dart';
import 'package:mvvm_example_flutter/core/extensions/string_extension.dart';

class AssetCacheManager {
  static final AssetCacheManager _instance = AssetCacheManager._init();
  static AssetCacheManager get instance => _instance;

  late final Dio dio;

  AssetCacheManager._init();

  void loadAssets() async {
    await Future.wait([
      _cacheSvg(tabName[TabItem.home]!),
      _cacheSvg(tabName[TabItem.store]!),
      _cacheSvg(tabName[TabItem.campaign]!),
      _cacheSvg(tabName[TabItem.profile]!),
    ]);
  }

  Future<void> _cacheSvg(String icon) {
    return precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, icon.toSVG),
      null,
    );
  }
}
