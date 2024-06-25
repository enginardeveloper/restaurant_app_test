import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/features/table_service_order_item/presentation/bloc/table_service_order_item/table_service_order_item_bloc.dart';
import '../../../../core/app_scale/app_scale.dart';
import '../../../../core/constants/app_dimensions/app_dimensions.dart';
import '../../../../entities/meal/meal_entity.dart';
import '../../../../entities/meal_category/meal_category_entity.dart';
import '../../../../entities/table_service/table_service_entity.dart';
import '../../../../router/app_router.dart';
import '../../../../widgets/box_shadow.dart';

class MealBox extends StatelessWidget {
  final MealEntity mealEntity;

  const MealBox({
    required this.mealEntity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppScale scale = AppScale(context);

    return GestureDetector(
      onTap: () => context.read<TableServiceOrderItemBloc>().add(TableServiceOrderItemEventMealAdded(mealEntity: mealEntity,),),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [shadow()],
          borderRadius: BorderRadius.circular(AppDimensions.borderRadius),
          color: Colors.white,
        ),
        padding: EdgeInsets.only(
            top: scale.pagePadding / 2,
            left: scale.pagePadding / 2,
            bottom: scale.pagePadding / 2,
            right: scale.pagePadding / 2),
        margin: EdgeInsets.only(
            top: scale.pagePadding / 2,
            left: scale.pagePadding / 2,
            bottom: scale.pagePadding / 2,
            right: scale.pagePadding / 2),
        child: Center(
          child: Text(
            mealEntity.name,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
