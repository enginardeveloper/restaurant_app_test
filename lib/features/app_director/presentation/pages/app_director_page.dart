import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../injector/injector.dart';
import '../../../../router/app_router.dart';
import '../../../../widgets/splash_page.dart';
import '../../../intro/presentation/pages/intro_page.dart';
import '../bloc/app_director_bloc.dart';

class AppDirector extends StatelessWidget {
  const AppDirector({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => Injector.instance<AppDirectorBloc>()
        ..add(const AppDirectorEventFetched()),
      child: Builder(
        builder: (context) {
          return BlocConsumer<AppDirectorBloc, AppDirectorState>(
            buildWhen: (previous, current) =>
                previous.appDirectorStatus != current.appDirectorStatus,
            builder: (context, state) {
              if (state.appDirectorStatus == AppDirectorStatus.initial) {
                return const SplashPage();
              } else if (state.appDirectorStatus == AppDirectorStatus.loading) {
                return const SplashPage();
              } else if (state.appDirectorStatus == AppDirectorStatus.failure) {
                Future.delayed(
                    const Duration(seconds: 5),
                    () => context
                        .read<AppDirectorBloc>()
                        .add(const AppDirectorEventFetched()));
                return const SplashPage();
              } else if (state.appDirectorStatus == AppDirectorStatus.success) {
                final bool isFirstUse = state.isFirstUse;
                if (isFirstUse) {
                  return const IntroPage();
                } else {
                  return const SplashPage();
                }
              }
              return const SplashPage();
            },
            listenWhen: (previous, current) =>
                previous.appDirectorStatus != current.appDirectorStatus,
            listener: (context, state) {
              if (state.appDirectorStatus == AppDirectorStatus.success && !state.isFirstUse) {
                  context.go(AppRouter.tableServicePath);
              }
            },
          );
        },
      ),
    );
  }
}
