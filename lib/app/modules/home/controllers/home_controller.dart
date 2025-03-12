import 'package:get/get.dart';
import 'package:to_do/app/core/model/task_models/task_query_param.dart';
import 'package:to_do/app/data/model/task_models/task_response_model.dart';

import '../../../data/repository/tasks/tasks.dart';
import '/app/core/base/base_controller.dart';
import '/app/core/base/paging_controller.dart';
import '/app/modules/home/model/task_ui_model.dart';

class HomeController extends BaseController {
  final Tasks _tasks =
      Get.find(tag: (Tasks).toString());

  final RxList<TaskUIModel> _taskListController = RxList.empty();

  DateTime dateTime = DateTime.now();
  var selectedButton = 0.obs;

  List<TaskUIModel> get taskList =>
      _taskListController.toList();

  final pagingController = PagingController<TaskUIModel>();

  void getTaskList({bool withoutPagination = false}) {
    if (!pagingController.canLoadNextPage() && !withoutPagination) return;
    if(withoutPagination) pagingController.pageNumber = 1;

    pagingController.isLoadingPage = true;
    var queryParam = TaskQueryParam(
      searchKeyWord: '',
      pageNumber: pagingController.pageNumber,
      perPage: 6
    );

    var taskResponse = _tasks.getTaskList(queryParam, fetchingFromLocal: true);

    callDataService(
      taskResponse,
      onSuccess: _handleTaskListResponseSuccess,
    );

    pagingController.isLoadingPage = false;
  }

  onRefreshPage() {
    pagingController.initRefresh();
    getTaskList();
  }

  onLoadNextPage() {
    logger.i("On load next");
    getTaskList();
  }

  void _handleTaskListResponseSuccess(TaskResponseModel response) {
   // print("reponse..${response}");
    List<TaskUIModel>? taskList = response.taskList
        ?.map((e) => TaskUIModel(
              taskName: e.taskName ?? "",
              taskDescription: e.taskDescription ?? "" ,
              startDate: e.startDate ?? "" ,
              endDate: e.endDate ?? "" ,
              status: e.status ?? "" ,

            ))
        .toList();

    if (_isLastPage(taskList!.length, response.totalTasks!)) {
      pagingController.appendLastPage(taskList);
    } else {
      pagingController.appendPage(taskList);
    }

    //temporary pagination
    //pagingController.appendPage(taskList!);

    var newList = [...pagingController.itemList];

    _taskListController(newList);
  }

  bool _isLastPage(int newListItemCount, int totalCount) {
    return (taskList.length + newListItemCount) >= totalCount;
  }
  @override
  void onReady() {
    super.onReady();
   // getTaskList();  // Fetch tasks whenever HomeController is active
  }



}
