import 'dart:async';

import 'package:get/get.dart';
import 'package:to_do/app/core/base/page_state.dart';
import 'package:to_do/flavors/build_config.dart';
import 'package:to_do/l10n/app_localizations.dart';
import 'package:logger/logger.dart';

import '../../network/exceptions/api_exception.dart';
import '../../network/exceptions/app_exception.dart';
import '../../network/exceptions/json_format_exception.dart';
import '../../network/exceptions/network_exception.dart';
import '../../network/exceptions/not_found_exception.dart';
import '../../network/exceptions/service_unavailable_exception.dart';
import '../../network/exceptions/unauthorize_exception.dart';

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


  // ignore: long-parameter-list
  dynamic callDataService<T>(
      Future<T> future, {
        Function(Exception exception)? onError,
        Function(T response)? onSuccess,
        Function? onStart,
        Function? onComplete,
      }) async {
    Exception? _exception;

    onStart == null ? showLoading() : onStart();

    try {
      final T response = await future;

      if (onSuccess != null) onSuccess(response);

      onComplete == null ? hideLoading() : onComplete();

      return response;
    } on ServiceUnavailableException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on UnauthorizedException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on TimeoutException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message ?? 'Timeout exception');
    } on NetworkException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on JsonFormatException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on NotFoundException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } on ApiException catch (exception) {
      _exception = exception;
    } on AppException catch (exception) {
      _exception = exception;
      showErrorMessage(exception.message);
    } catch (error) {
      _exception = AppException(message: "$error");
      logger.e("Controller>>>>>> error $error");
    }

    if (onError != null) onError(_exception);

    onComplete == null ? hideLoading() : onComplete();
  }


  @override
  void onClose() {
    _messageController.close();
    _refreshController.close();
    _pageStateController.close();
    super.onClose();
  }

}