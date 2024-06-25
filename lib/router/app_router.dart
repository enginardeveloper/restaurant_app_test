import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../entities/table_service/table_service_entity.dart';
import '../features/app/presentation/bloc/app_bloc.dart';
import '../features/app_director/presentation/pages/app_director_page.dart';
import '../features/table_service/presentation/pages/table_service/table_service_page.dart';
import '../features/table_service_order_item/presentation/pages/table_service_order_item/table_service_order_item_page.dart';
import '../injector/injector.dart';
import '../widgets/error_page.dart';

class AppRouter {
  AppRouter._();

  static const String appDirector = 'appDirector';
  static const String appDirectorPath = '/';

  static const String tableServiceNamed = 'tableService';
  static const String tableServicePath = '/tableService';

  static const String tableServiceOrderItemNamed = 'tableServiceOrderItem';
  static const String tableServiceOrderItemPath = 'tableServiceOrderItem';

  static const String orderListNamed = 'orderList';
  static const String orderListPath = 'orderList';


  static GoRouter get router => _router;

  static final _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        name: appDirector,
        path: appDirectorPath,
        builder: (context, state) {
          return const AppDirector();
        },
      ),
      GoRoute(
        name: tableServiceNamed,
        path: tableServicePath,
        pageBuilder: (context, state) => buildPageWithDefaultTransition<void>(
          context: context,
          state: state,
          child:  TableServicePage(key: UniqueKey(),),
        ),
        routes: [
          GoRoute(
            name: tableServiceOrderItemNamed,
            path: tableServiceOrderItemPath,
            pageBuilder: (context, state) =>
                buildPageWithDefaultTransition<void>(
                  context: context,
                  state: state,
                  child: TableServiceOrderItemPage(tableServiceEntity: state.extra as TableServiceEntity),
                ),
          ),
        ],
      ),
    ],
    refreshListenable: GoRouterRefreshBloc(Injector.instance<AppBloc>()),
    redirect: (BuildContext context, GoRouterState state) {
      // final bool isLoggedIn =
      //     context.read<AppBloc>().state.authenticationStatus ==
      //         AuthenticationStatus.authenticated;
      //
      // final bool isLoggingIn = state.matchedLocation == AppRouter.loginPath;
      //
      // /// resetPasswordPath
      // if (!isLoggedIn &&
      //     state.matchedLocation ==
      //         '${AppRouter.loginPath}/${AppRouter.resetPasswordPath}') {
      //   return null;
      // }
      //
      // /// signUpPath
      // if (!isLoggedIn &&
      //     state.matchedLocation ==
      //         '${AppRouter.loginPath}/${AppRouter.signUpPath}') {
      //   return null;
      // }
      //
      // if (!isLoggedIn) {
      //   return isLoggingIn ? null : AppRouter.loginPath;
      // }
      return null;
    },
    errorBuilder: (context, state) => const ErrorPage(
      content: "Page not found 404",
    ),
  );
}

class GoRouterRefreshBloc<BLOC extends BlocBase<STATE>, STATE>
    extends ChangeNotifier {
  GoRouterRefreshBloc(BLOC bloc) {
    _blocStream = bloc.stream.listen(
      (STATE _) => notifyListeners(),
    );
  }

  late final StreamSubscription<STATE> _blocStream;

  @override
  void dispose() {
    _blocStream.cancel();
    super.dispose();
  }
}

CustomTransitionPage buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) =>
        FadeTransition(opacity: animation, child: child),
  );
}
