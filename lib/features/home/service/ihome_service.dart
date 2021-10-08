import 'package:mvvm_example_flutter/core/init/network/network_manager.dart';
import 'package:mvvm_example_flutter/features/home/service/home_service.dart';

abstract class IHomeService {
  NetworkManager networkManager = NetworkManager.getInstance();

  IHomeService(this.networkManager);
}
