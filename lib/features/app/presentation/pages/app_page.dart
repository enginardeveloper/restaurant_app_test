import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import '../../../../core/app_localization/app_localization.dart';
import '../../../../core/app_theme/app_theme.dart';
import '../../../../injector/injector.dart';
import '../../../../router/app_router.dart';
import '../../../../widgets/splash_page.dart';
import '../bloc/app_bloc.dart';

class AppPage extends StatefulWidget {
  const AppPage({Key? key}) : super(key: key);

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  late final AppBloc _appBloc;

  @override
  void initState() {
    _appBloc = Injector.instance<AppBloc>()..add(const AppEventLoaded());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppBloc>.value(
      value: _appBloc,
      child: BlocSelector<AppBloc, AppState, AppStatus>(
        bloc: _appBloc,
        selector: (state) => state.appStatus,
        builder: (context, appStatus) {
          if (appStatus == AppStatus.initial) {
            return const SplashPage();
          } else if (appStatus == AppStatus.loading) {
            return const SplashPage();
          } else if (appStatus == AppStatus.failure) {
            Future.delayed(const Duration(seconds: 5),
                () => _appBloc.add(const AppEventLoaded()));

            return const SplashPage();
          } else if (appStatus == AppStatus.success) {
            return const Material(
              color: Colors.white,
              child: _App(),
            );
          }
          return const SplashPage();
        },
      ),
    );
  }
}

class _App extends StatelessWidget {
  const _App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      supportedLocales: const [
        Locale('en'),
        Locale('tr'),
      ],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: const Locale('en'),
      theme: AppTheme.theme,
      routerConfig: AppRouter.router,
      title: 'RestaurantApp',
    );
  }
}
