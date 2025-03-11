part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const MAIN = _Paths.MAIN;
  static const HOME = _Paths.HOME;
  static const CREATETASK = _Paths.CREATETASK;
  static const SETTINGS = _Paths.SETTINGS;
  static const SPLASHVIEW = _Paths.SPLASHVIEW;

}

abstract class _Paths {
  static const MAIN = '/main';
  static const HOME = '/home';
  static const CREATETASK = '/createTask';
  static const SETTINGS = '/settings';
  static const SPLASHVIEW = '/splashView';
}
