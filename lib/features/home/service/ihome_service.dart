import 'package:mvvm_example_flutter/core/init/network/network_manager.dart';

abstract class IHomeService {
  NetworkManager networkManager = NetworkManager.getInstance();

  IHomeService(this.networkManager);
}
