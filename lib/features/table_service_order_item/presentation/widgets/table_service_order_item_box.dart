import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:restaurant_app/utils/price_utils.dart';
import '../../../../core/app_scale/app_scale.dart';
import '../../../../core/constants/app_dimensions/app_dimensions.dart';
import '../../../../entities/table_service_order_item/table_service_order_item_entity.dart';
import '../../../../router/app_router.dart';
import '../../../../widgets/box_shadow.dart';

class TableServiceOrderItemBox extends StatelessWidget {
  final TableServiceOrderItemEntity tableServiceOrderItemEntity;

  const TableServiceOrderItemBox({
    required this.tableServiceOrderItemEntity,
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    AppScale scale = AppScale(context);

    return Container(
        decoration: BoxDecoration(
          boxShadow: [shadow()],
          borderRadius: BorderRadius.circular(AppDimensions.borderRadius * 2),
          color: Colors.white,
        ),
        padding: EdgeInsets.only(
            top: scale.pagePadding / 2,
            left: scale.pagePadding / 2,
            bottom: scale.pagePadding / 2,
            right: scale.pagePadding / 2) ,
        margin: EdgeInsets.only(
            top: scale.pagePadding / 2,
            left: scale.pagePadding / 2,
            bottom: scale.pagePadding / 2,
            right: scale.pagePadding / 2),
        child:
            Row(
              children: [


                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      tableServiceOrderItemEntity.mealName,
                    ),
                  ),
                ),
                Text(PriceUtils.numberToPriceFormat(tableServiceOrderItemEntity.priceSum),),
              ],
            ),


    );
  }
}
