import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:to_do/app/core/model/task_models/task_query_param.dart';
import 'package:to_do/app/data/local/db/sqflite/sqf_lite_db_impl.dart';
import 'package:to_do/app/data/model/task_models/task_response_model.dart';

import '../../core/model/task_models/create_task_data_param.dart';
import '../local/db/sqflite/table_info.dart';
import '../repository/tasks/tasks.dart';
import '/app/core/base/base_remote_source.dart';
import '/app/network/dio_provider.dart';

class TaskRemoteDataSourceImpl extends BaseRemoteSource implements Tasks {

  final SqfLitDbImpl databaseHelper;
  TaskRemoteDataSourceImpl({required this.databaseHelper});

  @override
  Future<TaskResponseModel> getTaskList(TaskQueryParam queryParam, {bool fetchingFromLocal = false}) async {
    var endpoint = "${DioProvider.baseUrl}/";

    //fetch data from local database
    if (fetchingFromLocal) {
      try {
         final database = databaseHelper.databaseName;
         var taskResponse = await databaseHelper.getTaskData(queryParam: queryParam.toJson(), tableName: TableInfo.taskList);;
         if (taskResponse.isNotEmpty) {
           Map<String, dynamic> data = taskResponse is String
               ? jsonDecode(taskResponse)
               : taskResponse;

           // Directly return the parsed response
           return TaskResponseModel.fromJson(data);
        } else {
          throw Exception('Task not found locally.');
        }
      } catch (e) {
        rethrow;
      }
    }else{//fetch data from api
      var dioCall = dioClient.get(endpoint, queryParameters: queryParam.toJson());
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

    //store data in local database
    if(storeDataInLocal){
      try {
        final database =  databaseHelper.databaseName;
        await databaseHelper.createDatabaseAndInsertDataInTable(databaseName: database, tableName: TableInfo.taskList, createTableInformation: TableInfo.taskListTableQuery, map: data.toJson());
        return true;
      } catch (e) {
        rethrow;
      }
    }else{//store data in server database
      var dioCall = dioClient.post(endpoint, data: data.toJson());
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
