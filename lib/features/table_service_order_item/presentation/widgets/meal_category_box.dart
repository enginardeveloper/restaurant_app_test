import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/features/table_service_order_item/presentation/bloc/table_service_order_item/table_service_order_item_bloc.dart';
import '../../../../core/app_scale/app_scale.dart';
import '../../../../core/constants/app_dimensions/app_dimensions.dart';
import '../../../../entities/meal_category/meal_category_entity.dart';
import '../../../../widgets/box_shadow.dart';

class MealCategoryBox extends StatelessWidget {
  final MealCategoryEntity mealCategoryEntity;

  const MealCategoryBox({
    required this.mealCategoryEntity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppScale scale = AppScale(context);

    return 
      
      GestureDetector(
      onTap: () => context.read<TableServiceOrderItemBloc>().add(TableServiceOrderItemEventMenuChanged(mealCategoryId: mealCategoryEntity.id, isMainMenu: false),),
      //     context.go('${AppRouter.mealCategoryPath}/${AppRouter.mealCategoryOrderItemPath}',
      //   extra: mealCategoryEntity,
      // ),
      child: SizedBox(height: 20,
      child:

      Container(
        decoration: BoxDecoration(
          boxShadow: [shadow()],
          borderRadius: BorderRadius.circular(AppDimensions.borderRadius ),
          color: Colors.white,
        ),
        margin: EdgeInsets.only(
            top: scale.pagePadding / 2,
            left: scale.pagePadding / 2,
            bottom: scale.pagePadding / 2,
            right: scale.pagePadding / 2),

              child: Center(
                child: Text(mealCategoryEntity.name, overflow: TextOverflow.ellipsis,),
              ),

          ),
      ),
    );
  }
}
