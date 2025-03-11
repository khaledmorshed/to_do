import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/paging_view.dart';
import '/app/core/base/base_view.dart';
import '/app/core/values/app_values.dart';
import '/app/modules/home/controllers/home_controller.dart';

class HomeView extends BaseView<HomeController> {
  HomeView() {
    controller.getTaskList();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: 'To-Do',
    );
  }

  @override
  Widget body(BuildContext context) {
    return Container();
    // return PagingView(
    //   onRefresh: () async {
    //     controller.onRefreshPage();
    //   },
    //   onLoadNextPage: () {
    //     controller.onLoadNextPage();
    //   },
    //   child: Padding(
    //     padding:  EdgeInsets.all(AppValues.padding),
    //     child: Obx(
    //       () => ListView.separated(
    //         shrinkWrap: true,
    //         itemCount: controller.taskList.length,
    //         primary: false,
    //         physics: const NeverScrollableScrollPhysics(),
    //         itemBuilder: (context, index) {
    //           var model = controller.taskList[index];
    //
    //           return Container();
    //         },
    //         separatorBuilder: (BuildContext context, int index) =>
    //              SizedBox(height: AppValues.padding_4),
    //       ),
    //     ),
    //   ),
    // );
  }
}
