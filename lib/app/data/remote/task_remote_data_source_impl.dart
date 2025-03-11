import 'package:dio/dio.dart';
import 'package:to_do/app/core/model/task_models/task_query_param.dart';
import 'package:to_do/app/data/local/db/sqflite/sqf_lite_db_impl.dart';
import 'package:to_do/app/data/model/task_models/task_response_model.dart';

import '../../core/model/task_models/create_task_data_param.dart';
import '../repository/tasks/tasks.dart';
import '/app/core/base/base_remote_source.dart';
import '/app/network/dio_provider.dart';

class TaskRemoteDataSourceImpl extends BaseRemoteSource implements Tasks {

  final SqfLitDbImpl databaseHelper;
  TaskRemoteDataSourceImpl({required this.databaseHelper});

  @override
  Future<TaskResponseModel> getTaskList(TaskQueryParam queryParam, {bool fetchingFromLocal = false}) async {
    var endpoint = "${DioProvider.baseUrl}/";
    var dioCall = dioClient.get(endpoint, queryParameters: queryParam.toJson());
    //fetch data from local database
    if (fetchingFromLocal) {
      try {
         final database = databaseHelper.databaseName;

         // String value = SqfLitDb.databaseName;
        // final List<Map<String, dynamic>> results = await database.query(
        //
        // );
         final List<Map<String, dynamic>> results = [];

         if (results.isNotEmpty) {
        //  return Item.fromJson(results.first);
          return callApiWithErrorParser(dioCall)
              .then((response) => _parseTaskResponse(response));
        } else {
          throw Exception('Task not found locally.');
        }
      } catch (e) {
        rethrow;
      }
    }else{//fetch data from api
      try {
        return callApiWithErrorParser(dioCall)
            .then((response) => _parseTaskResponse(response));
      } catch (e) {
        rethrow;
      }
    }
  }

  Future<dynamic> createTask(CreateTaskDataParam data, {bool storeDataInLocal = false})async{
    var endpoint = "${DioProvider.baseUrl}/";
    var dioCall = dioClient.post(endpoint, data: data.toJson());
    //store data in local database
    if(storeDataInLocal){
      try {
        final database =  databaseHelper.databaseName;
        return true;
      } catch (e) {
        rethrow;
      }
    }else{//store data in server database
      try {
        return callApiWithErrorParser(dioCall);
      } catch (e) {
        rethrow;
      }
    }
  }


  TaskResponseModel _parseTaskResponse(
      Response<dynamic> response) {
    return TaskResponseModel.fromJson(response.data);
  }


}
