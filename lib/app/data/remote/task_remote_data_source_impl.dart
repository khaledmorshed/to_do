import 'package:dio/dio.dart';
import 'package:to_do/app/core/model/task_models/task_query_param.dart';
import 'package:to_do/app/data/model/task_models/task_response_model.dart';
import 'package:to_do/app/data/repository/task_repository/task_repository.dart';

import '/app/core/base/base_remote_source.dart';
import '/app/network/dio_provider.dart';

class GithubRemoteDataSourceImpl extends BaseRemoteSource implements TaskRepository {
  @override
  Future<TaskResponseModel> getTaskList(TaskQueryParam queryParam) {
    var endpoint = "${DioProvider.baseUrl}/";
    var dioCall = dioClient.get(endpoint, queryParameters: queryParam.toJson());

    try {
      return callApiWithErrorParser(dioCall)
          .then((response) => _parseGithubProjectSearchResponse(response));
    } catch (e) {
      rethrow;
    }
  }

  TaskResponseModel _parseGithubProjectSearchResponse(
      Response<dynamic> response) {
    return TaskResponseModel.fromJson(response.data);
  }


}
