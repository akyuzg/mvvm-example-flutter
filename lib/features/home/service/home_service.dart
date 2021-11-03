import 'package:mvvm_example_flutter/core/constants/network/network_contants.dart';
import 'package:mvvm_example_flutter/core/init/network/network_manager.dart';
import 'package:mvvm_example_flutter/features/home/model/response/advisors_response.dart';
import 'package:mvvm_example_flutter/features/home/service/ihome_service.dart';

class HomeService extends IHomeService {
  HomeService(NetworkManager manager) : super(manager);

  Future<AdvisorsResponse> fetchAdvisors() async {
    AdvisorsResponse data = await networkManager.get(
      path: NetworkConstants.getAdvisors,
      model: AdvisorsResponse(),
    );
    return data;
  }
}
