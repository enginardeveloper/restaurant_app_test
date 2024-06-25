import 'dart:io';

import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/app_scale/app_scale.dart';
import '../../../../../core/app_theme/app_theme.dart';
import '../../../../../injector/injector.dart';
import '../../bloc/table_service/table_service_bloc.dart';
import '../../widgets/table_service_drawer_menu.dart';
import '../../widgets/table_service_box.dart';

class TableServicePage extends StatefulWidget {
  const TableServicePage({super.key});

  @override
  State<StatefulWidget> createState() => _TableServicePageState();
}

class _TableServicePageState extends State<TableServicePage>
    with SingleTickerProviderStateMixin {
  late AnimationController _drawerSlideController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _drawerSlideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    );
    super.initState();
  }

  @override
  void dispose() {
    _drawerSlideController.dispose();
    super.dispose();
  }

  bool _isDrawerOpen() {
    return _drawerSlideController.value == 1.0;
  }

  bool _isDrawerOpening() {
    return _drawerSlideController.status == AnimationStatus.forward;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TableServiceBloc>(
      create: (_) => Injector.instance<TableServiceBloc>()
        ..add(
          const TableServiceEventFetched(),
        ),
      child: Builder(
        builder: (context) {
          return _buildMain(context);
        },
      ),
    );
  }


  _buildMain(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      drawer: const Drawer(
        child: TableServiceDrawerMenu(),
      ),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        // here the desired height
        child: AppBar(
          actions: const <Widget>[SizedBox()],
          leading: AnimatedBuilder(
            animation: _drawerSlideController,
            builder: (context, child) {
              return GestureDetector(
                onTap: () => _scaffoldKey.currentState!.openDrawer(),
                child: _isDrawerOpen() || _isDrawerOpening()
                    ? const Icon(
                        Icons.arrow_back_ios_new,
                        color: AppTheme.iconColor,
                      )
                    : const Icon(
                        Icons.menu,
                        color: AppTheme.iconColor,
                      ),
              );
            },
          ),
          title: const Text('Table Service'),
        ),
      ),
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    AppScale scale = AppScale(context);

    return BlocBuilder<TableServiceBloc, TableServiceState>(builder: (_, state) {
      if (state.tableServiceStatus == TableServiceStatus.loading) {
        return const Center(
          child: CircularProgressIndicator(
            color: AppTheme.primaryColor,
          ),
        );
      }
      if (state.tableServiceStatus == TableServiceStatus.failure) {
        return const Center(
          child: Text('Failed Loading'),
        );
      }
      if (state.tableServiceStatus == TableServiceStatus.success) {
        return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:  3),

          shrinkWrap: true,
          padding: EdgeInsets.only(
            top: scale.pagePadding,
            bottom:   (Platform.isIOS
                ? scale.pagePadding
                : scale.pagePadding * 2),
          ),
          physics: const ClampingScrollPhysics(),
          itemCount: state.tableServiceEntityList.length,
          itemBuilder: (context, index) {
            return TableServiceBox(
              tableServiceEntity: state.tableServiceEntityList[index],
            );
          },
        );



      }
      return Container();
    });
  }
}
