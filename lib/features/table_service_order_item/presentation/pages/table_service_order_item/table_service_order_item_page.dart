import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/features/table_service_order_item/presentation/widgets/meal_category_box.dart';

import '../../../../../core/app_scale/app_scale.dart';
import '../../../../../entities/table_service/table_service_entity.dart';
import '../../../../../injector/injector.dart';
import '../../../../../router/app_router.dart';
import '../../../../table_service/presentation/bloc/table_service/table_service_bloc.dart';
import '../../bloc/table_service_order_item/table_service_order_item_bloc.dart';
import '../../widgets/meal_box.dart';
import '../../widgets/table_service_order_item_box.dart';

class TableServiceOrderItemPage extends StatelessWidget {
  const TableServiceOrderItemPage(
      {required this.tableServiceEntity, super.key});

  final TableServiceEntity tableServiceEntity;

  @override
  Widget build(BuildContext context) {
    AppScale scale = AppScale(context);

    return BlocProvider(
      create: (_) => Injector.instance<TableServiceOrderItemBloc>()
        ..add(
          TableServiceOrderItemEventFetched(
              tableServiceEntity: tableServiceEntity),
        ),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: _buildAppBar(context),
          body: _buildBody(context),
        );
      }),
    );
  }

  _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        tableServiceEntity.name,
      ),
      actions: [
        TextButton(onPressed: () {

          context.go(AppRouter.tableServicePath);
        },
          child: const Text('save', style: TextStyle(color: Colors.black, fontSize: 20),),),
      ],
    );
  }

  _buildBody(BuildContext context) {
    AppScale scale = AppScale(context);

    return BlocBuilder<TableServiceOrderItemBloc, TableServiceOrderItemState>(
        builder: (_, state) {
      if (state.tableServiceOrderItemStatus ==
          TableServiceOrderItemStatus.loading) {
        return const Center(
          child: CircularProgressIndicator(
            color: Colors.blue,
          ),
        );
      }
      if (state.tableServiceOrderItemStatus ==
          TableServiceOrderItemStatus.failure) {
        return const Center(
          child: Text('Failed to load'),
        );
      }
      if (state.tableServiceOrderItemStatus ==
          TableServiceOrderItemStatus.success) {
        return Column(
          children: [
            Expanded(
              flex: 1,
              child: ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.only(
                  top: scale.pagePadding,
                  bottom: (Platform.isIOS
                      ? scale.pagePadding
                      : scale.pagePadding * 2),
                ),
                physics: const ClampingScrollPhysics(),
                itemCount: state.tableServiceOrderItemEntityList.length,
                itemBuilder: (context, index) {
                  return TableServiceOrderItemBox(
                    tableServiceOrderItemEntity:
                        state.tableServiceOrderItemEntityList[index],
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: _buildBottomMenu(context),
            ),
          ],
        );
      }
      return Container();
    });
  }

  _buildBottomMenu(BuildContext context) {
    AppScale scale = AppScale(context);

    return BlocBuilder<TableServiceOrderItemBloc, TableServiceOrderItemState>(
      buildWhen: (previous, current) => (previous.isMainMenu != current.isMainMenu),
      builder: (_, state) {
        if (state.isMainMenu) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Menu'),
              leading: Container(),
            ),
            body: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2,
              ),
              shrinkWrap: true,
              padding: EdgeInsets.only(
                top: scale.pagePadding,
                bottom: (Platform.isIOS
                    ? scale.pagePadding
                    : scale.pagePadding * 2),
              ),
              physics: const ClampingScrollPhysics(),
              itemCount: state.mealCategoryEntityList.length,
              itemBuilder: (context, index) {
                return MealCategoryBox(
                  mealCategoryEntity: state.mealCategoryEntityList[index],
                );
              },
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                icon: const Icon(Icons.arrow_back_ios_new),
                onPressed: () => context.read<TableServiceOrderItemBloc>().add(const TableServiceOrderItemEventMenuChanged(isMainMenu: true, mealCategoryId: 0),),
              ),
            ),
            body: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2,
              ),
              shrinkWrap: true,
              padding: EdgeInsets.only(
                top: scale.pagePadding,
                bottom: (Platform.isIOS
                    ? scale.pagePadding
                    : scale.pagePadding * 2),
              ),
              physics: const ClampingScrollPhysics(),
              itemCount: state.mealEntityList.length,
              itemBuilder: (context, index) {
                return MealBox(
                  mealEntity: state.mealEntityList[index],
                );
              },
            ),
          );
        }
      },
    );
  }
}
