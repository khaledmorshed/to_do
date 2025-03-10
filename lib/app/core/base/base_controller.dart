import 'package:get/get.dart';
import 'package:to_do/app/core/base/page_state.dart';
import 'package:to_do/flavors/build_config.dart';
import 'package:to_do/l10n/app_localizations.dart';
import 'package:logger/logger.dart';

abstract class BaseController extends GetxController{
  final Logger logger = BuildConfig.instance.envConfig.logger;
  AppLocalizations get appLocalization => AppLocalizations.of(Get.context!)!;
  final logoutController = false.obs;

  //reload the page
  final _refreshController = false.obs;
  refreshPage(bool refresh)=> _refreshController(refresh);

  //control page state
  final _pageStateController = PageState.defaultState.obs;
  PageState get pageState => _pageStateController.value;
  updatePageState(PageState state)=>_pageStateController(state);
  resetPageState()=>_pageStateController(PageState.defaultState);

  //loading
  showLoading()=> updatePageState(PageState.loading);
  hideLoading()=> resetPageState();

  //message
  final _messageController = "".obs;
  String get message => _messageController.value;
  showMessage(String msg)=> _messageController(msg);

  //error message
  final _errorMessageController = "".obs;
  String get errorMessage => _messageController.value;
  showErrorMessage(String msg){
    _errorMessageController(msg);
  }

  //success message
  final _successMessageController = ''.obs;
  String get successMessage => _messageController.value;
  showSuccessMessage(String msg) => _successMessageController(msg);


  @override
  void onClose() {
    _messageController.close();
    _refreshController.close();
    _pageStateController.close();
    super.onClose();
  }

}