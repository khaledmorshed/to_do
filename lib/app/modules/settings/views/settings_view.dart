import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../../core/base/base_view.dart';
import '../../../core/base/theme/app_theme.dart';
import '../../../core/base/theme/theme.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../../data/local/preference/preference_manager.dart';
import '../../../data/local/preference/preference_manager_impl.dart';
import '/app/modules/settings/controllers/settings_controller.dart';

class SettingsView extends BaseView<SettingsController> {
  @override
  PreferredSizeWidget? appBar(BuildContext context) {
    return CustomAppBar(
      appBarTitleText: appLocalization.bottomNavSettings,
      isBackButtonEnabled: false,
    );
  }
  final PreferenceManager _preference = PreferenceManagerImpl();

  @override
  Widget body(BuildContext context) {
    return Column(
      children: [

        ListTile(
          title: Text("Light Theme"),
          leading: Radio(
            value: AppTheme.light,
            groupValue: _getCurrentTheme(),
            onChanged: (value) => _changeTheme(value!),
          ),
        ),
        ListTile(
          title: Text("Dark Theme"),
          leading: Radio(
            value: AppTheme.dark,
            groupValue: _getCurrentTheme(),
            onChanged: (value) => _changeTheme(value!),
          ),
        ),
        ListTile(
          title: Text("System Default"),
          leading: Radio(
            value: AppTheme.system,
            groupValue: _getCurrentTheme(),
            onChanged: (value) => _changeTheme(value!),
          ),
        ),

        // ItemSettings(
        //   title: appLocalization.settingsTheme,
        //   prefixImage: 'ic_theme.png',
        //   suffixImage: 'arrow_forward.svg',
        //   onTap: _onThemeItemClicked,
        // ),
        // _getHorizontalDivider(),
        // ItemSettings(
        //   title: appLocalization.settingsLanguage,
        //   prefixImage: 'ic_language.svg',
        //   suffixImage: 'arrow_forward.svg',
        //   onTap: _onLanguageItemClicked,
        // ),
        // _getHorizontalDivider(),
        // ItemSettings(
        //   title: appLocalization.settingsFontSize,
        //   prefixImage: 'ic_font_size.svg',
        //   suffixImage: 'arrow_forward.svg',
        //   onTap: _onFontSizeItemClicked,
        // ),
        // _getHorizontalDivider(),
      ],
    );
  }

  Widget _getHorizontalDivider() {
    return const Divider(height: 1);
  }

  // void _onThemeItemClicked() {
  //   showToast('Theme: Development in progress');
  // }
  //
  // void _onLanguageItemClicked() {
  //   showToast('Language: Development in progress');
  // }
  //
  // void _onFontSizeItemClicked() {
  //   showToast('Font Size: Development in progress');
  // }


  AppTheme _getCurrentTheme() {

    String savedTheme = _preference.getString(
      PreferenceManager.theme,
      defaultValue: AppTheme.system.name,
    );
    return AppTheme.values.firstWhere((e) => e.name == savedTheme, orElse: () => AppTheme.system);
  }

  void _changeTheme(AppTheme theme) {
    _preference.setString(PreferenceManager.theme, theme.name);

    if (theme == AppTheme.dark) {
      Get.changeTheme(AppThemeData.darkThem);
    } else if (theme == AppTheme.light) {
      Get.changeTheme(AppThemeData.lightTheme);
    } else {
      Get.changeTheme(Get.isPlatformDarkMode ? AppThemeData.darkThem : AppThemeData.lightTheme);
    }
  }

}
