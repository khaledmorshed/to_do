import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:to_do/app/core/utils/screen_padding.dart';
import 'package:to_do/app/core/utils/size_box.dart';
import 'package:to_do/app/core/values/text_styles.dart';
import 'package:to_do/app/core/widgets/custom_elevated_button.dart';
import 'package:to_do/app/core/widgets/custom_text_form_field.dart';
import 'package:to_do/app/modules/create_task/controllers/create_task_controller.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../core/widgets/paging_view.dart';
import '/app/core/base/base_view.dart';
import '/app/core/values/app_values.dart';
import '/app/modules/home/controllers/home_controller.dart';

class CreateTaskView extends BaseView<CreateTaskController> {

  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return null;
  }

  @override
  Widget body(BuildContext context) {
    return Padding(
      padding: screenPadding(topPadding: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Create new Task", style: myTxt18(),),
            szH32(),
            Text("Task name", style: myTxt14(),),
            szH8(),
            CustomTextFormField(
              boarderRadius: 20,
              controller: controller.taskNameController,
              hintText: "Enter Your Task Name",
            ),
            szH10(),
            Text("Task Description", style: myTxt18(),),
            szH8(),
            CustomTextFormField(
              controller: controller.taskDescriptionController,
              boarderRadius: 20,
              multiline: 5,
              maxLength: 45,
              isShowCounterText: true,
              inputFormatters: [
                LengthLimitingTextInputFormatter(45),
              ],
            ),
            szH32(),
            CustomElevatedButton(
              themeIndex: 0,
              boarderRadius: 80,
              buttonWidth: double.infinity,
              buttonHeight: 52,
              textWidget: "Create New Task",
              onPressed: (){
                controller.createTask();
              },
            ),
          ],
        ),
      ),
    );
  }
}
