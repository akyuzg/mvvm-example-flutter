import 'package:dio/dio.dart';
import 'package:mvvm_example_flutter/core/constants/network/network_contants.dart';
import 'package:mvvm_example_flutter/core/init/network/network_manager.dart';
import 'package:mvvm_example_flutter/features/home/advisor/model/advisor_model.dart';
import 'package:mvvm_example_flutter/features/home/model/response/advisors_response.dart';
import 'package:mvvm_example_flutter/features/home/service/ihome_service.dart';

class HomeService extends IHomeService {
  HomeService(NetworkManager manager) : super(manager);

  Future<List<AdvisorModel>?> fetchAdvisors() async {
    Response raw = (await networkManager.dio.get(NetworkConstants.getAdvisors));
    AdvisorsResponse response = AdvisorsResponse.fromJson(raw.data);
    return response.advisors;
  }
}
