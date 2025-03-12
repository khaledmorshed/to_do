import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:logger/logger.dart';
import 'package:to_do/app/core/base/theme/get_all_theme.dart';
import 'package:to_do/app/core/utils/screen_padding.dart';
import 'package:to_do/app/core/utils/size_box.dart';
import 'package:to_do/app/core/values/text_styles.dart';
import 'package:to_do/app/core/widgets/custom_container_widget.dart';
import 'package:to_do/app/core/widgets/custom_elevated_button.dart';
import 'package:to_do/app/core/widgets/custom_icon_widget.dart';
import 'package:to_do/app/core/widgets/custom_text_button.dart';
import '../../../core/utils/date_time_formater.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/paging_view.dart';
import '../model/task_ui_model.dart';
import '/app/core/base/base_view.dart';
import '/app/core/values/app_values.dart';
import '/app/modules/home/controllers/home_controller.dart';

class HomeView extends BaseView<HomeController> {
  HomeView() {
    controller.getTaskList();
  }

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }


  @override
  Widget body(BuildContext context) {
    return PagingView(
      onRefresh: () async {
        controller.onRefreshPage();
      },
      onLoadNextPage: () {
        controller.onLoadNextPage();
      },
      child: Padding(
        padding:  screenPadding(),
        child: Obx(
          () => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              szH8(),
              Text("Good morning Tom!", style: myTxt12(color: GetTheme().txtTheme().txtLabelColorMoreMedium),),
              szH8(),
              Text(DateTimeFormater.formatDate(controller.dateTime), style: myTxt16(color: GetTheme().txtTheme().txtColorBlack, fontWeight: FontWeight.w500),),
              szH20(),
              Text("Today Tasks", style: myTxt20(color: GetTheme().txtTheme().txtColorBlack, fontWeight: FontWeight.w500),),
              CustomContainerWidget(
                themeIndex: 9,
                isAllBoarderRadius: true,
                boarderRadius: 42,
                padding: 6,
                boarderWidth: 1,
                isAllBoarder: true,
                child: Row(
                  children: [
                    Expanded(
                      child: CustomElevatedButton(
                        themeIndex: controller.selectedButton.value == 0 ? 0 : 3,
                        boarderRadius: 80,
                        textWidget: "All Tasks",
                        textColor: controller.selectedButton.value == 0 ? GetTheme().txtTheme().txtColorWhite : null,
                        onPressed: ()async{
                          controller.selectedButton.value = 0;
                          controller.getTaskList(withoutPagination: true);
                        },
                      ),
                    ),
                    Expanded(
                      child: CustomElevatedButton(
                        themeIndex: controller.selectedButton.value == 1 ? 0 : 3,
                        boarderRadius: 80,
                        textWidget: "Completed",
                        textColor: controller.selectedButton.value == 1 ? GetTheme().txtTheme().txtColorWhite : null,
                        onPressed: ()async{
                          controller.selectedButton.value = 1;
                          controller.getTaskList(withoutPagination: true);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: controller.taskList.length,
                primary: false,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  TaskUIModel model = controller.taskList[index];
                  return Padding(
                    padding:  EdgeInsets.only(top: index == 0 ? 12 : 0, bottom: 12),
                    child: CustomContainerWidget(
                      themeIndex: 9,
                      isAllBoarderRadius: true,
                      boarderRadius: 12,
                      padding: 12,
                      boarderWidth: 1,
                      isAllBoarder: true,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(model.taskName, style: myTxt16(color: GetTheme().txtTheme().txtColorBlack, fontWeight: FontWeight.w500),),
                          szH6(),
                          Text(model.taskDescription, style: myTxt16(color: GetTheme().txtTheme().txtColorBlack, fontWeight: FontWeight.w500),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  CustomIconWidget(
                                    themeIndex: 1,
                                    child: "images/png/timer.png",
                                  ),
                                  szW8(),
                                  Text(DateTimeFormater.formatDate(DateTime.parse(model.endDate))),
                                ],
                              ),
                              CustomTextButton(
                                themeIndex: 2,
                                textWidget: model.status,
                                boarderRadius: 40,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
