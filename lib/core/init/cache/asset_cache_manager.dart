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
      _cacheSvg(tabIcons[TabItem.home]!),
      _cacheSvg(tabIcons[TabItem.store]!),
      _cacheSvg(tabIcons[TabItem.campaign]!),
      _cacheSvg(tabIcons[TabItem.profile]!),
    ]);
  }

  Future<void> _cacheSvg(String icon) {
    return precachePicture(
      ExactAssetPicture(SvgPicture.svgStringDecoder, icon.toSVG),
      null,
    );
  }
}
