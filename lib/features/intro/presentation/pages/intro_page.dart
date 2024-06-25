import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/app_scale/app_scale.dart';
import '../../../../core/app_theme/app_theme.dart';
import '../../../../core/constants/assets/assets.dart';
import '../../../../widgets/icon_elevated_button.dart';
import '../../../app/presentation/bloc/app_bloc.dart';
import '../../../app_director/presentation/bloc/app_director_bloc.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppScale scale = AppScale(context);

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: scale.height,
            width: scale.width,
            color: AppTheme.backgroundColor,
          ),
          Column(
            children: [
              Expanded(
                child: Container(),
              ),
              const Bottom(),
            ],
          ),
        ],
      ),
    );
  }
}

class Bottom extends StatelessWidget {
  const Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    AppScale scale = AppScale(context);

    return Container(
      alignment: Alignment.bottomCenter,
      padding: EdgeInsets.only(
          top: 0,
          left: scale.pagePadding,
          right: scale.pagePadding,
          bottom: scale.pagePadding),
      child: IconElevatedButton(
        asset: Assets.arrowRightButton,
        iconSize: 15,
        color: Theme.of(context).primaryColor,
        onPressed: () {
          context.read<AppDirectorBloc>().add(const AppDirectorEventFirstUseDisabled());
        },
      ),
    );
  }
}
