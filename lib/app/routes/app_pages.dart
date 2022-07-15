import 'package:get/get.dart';
import 'package:tefzon/app/modules/get_started/views/favourite_team.dart';
import 'package:tefzon/app/modules/get_started/views/terms.dart';
import 'package:tefzon/app/modules/home/views/home_page.dart';
import 'package:tefzon/app/modules/leagues/views/create_league.dart';
import 'package:tefzon/app/modules/leagues/views/join_league.dart';
import 'package:tefzon/app/modules/splash/views/splash_view.dart';

import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/get_started/views/login_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
    ),
    GetPage(
        name: _Paths.DASHBOARD, page: () => DashboardView(), middlewares: []),
    GetPage(name: _Paths.HOME, page: () => HomepageView(), middlewares: []),
    GetPage(
        name: _Paths.CREATELEAGUE, page: () => CreateLeague(), middlewares: []),
    GetPage(
        name: _Paths.JOINLEAGUE,
        page: () => const JoinLeague(
              index: 0,
            ),
        middlewares: []),
    GetPage(
        name: _Paths.FAVOURITE,
        page: () => const SelectFavourite(),
        middlewares: []),
    GetPage(
        name: _Paths.TERMS,
        page: () => const AgreementView(),
        middlewares: []),
  ];
}
