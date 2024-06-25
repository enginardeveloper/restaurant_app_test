import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/app_scale/app_scale.dart';
import '../../../../core/constants/app_dimensions/app_dimensions.dart';
import '../../../../entities/table_service/table_service_entity.dart';
import '../../../../router/app_router.dart';
import '../../../../widgets/box_shadow.dart';

class TableServiceBox extends StatelessWidget {
  final TableServiceEntity tableServiceEntity;

  const TableServiceBox({
    required this.tableServiceEntity,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppScale scale = AppScale(context);

    return GestureDetector(
      onTap: () => 
          context.go('${AppRouter.tableServicePath}/${AppRouter.tableServiceOrderItemPath}',
        extra: tableServiceEntity,
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [shadow()],
          borderRadius: BorderRadius.circular(AppDimensions.borderRadius * 2),
          color: Colors.white,
        ),
        margin: EdgeInsets.only(
            top: scale.pagePadding / 2,
            left: scale.pagePadding / 2,
            bottom: scale.pagePadding / 2,
            right: scale.pagePadding / 2),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Text(tableServiceEntity.name),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        bottomLeft:
                            Radius.circular(AppDimensions.borderRadius * 2),
                        bottomRight:
                            Radius.circular(AppDimensions.borderRadius * 2),
                      ),
                      color: tableServiceEntity.status == 0
                          ? Colors.green
                          : Colors.red,
                    ),
                    child: Text(
                      tableServiceEntity.status == 0 ? 'Empty' : 'Full',
                      style:  const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        //  ),
      ),
    );
  }
}
