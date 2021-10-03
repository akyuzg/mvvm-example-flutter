// ignore: file_names
abstract class INavigationService {
  Future<void> openPage({String? path, Object? data});
  Future<void> navigateToPage({String? path, Object? data});
  Future<void> navigateToPageClear({String? path, Object? data});
}
