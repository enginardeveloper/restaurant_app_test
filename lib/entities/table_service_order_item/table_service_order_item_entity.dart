class TableServiceOrderItemEntity {
  final int? id;
  final int tableServiceId;
  final int mealId;
  final String mealName;
  final int mealCount;
  final double priceSum;

//<editor-fold desc="Data Methods">
  const TableServiceOrderItemEntity({
    this.id,
    required this.tableServiceId,
    required this.mealId,
    required this.mealName,
    required this.mealCount,
    required this.priceSum,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TableServiceOrderItemEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          tableServiceId == other.tableServiceId &&
          mealId == other.mealId &&
          mealName == other.mealName &&
          mealCount == other.mealCount &&
          priceSum == other.priceSum);

  @override
  int get hashCode =>
      id.hashCode ^
      tableServiceId.hashCode ^
      mealId.hashCode ^
      mealCount.hashCode ^
      priceSum.hashCode;

  @override
  String toString() {
    return 'TableServiceOrderItemEntity{' +
        ' id: $id,' +
        ' tableServiceId: $tableServiceId,' +
        ' mealId: $mealId,' +
        ' mealName: $mealName,' +
        ' mealCount: $mealCount,' +
        ' priceSum: $priceSum,' +
        '}';
  }

  TableServiceOrderItemEntity copyWith({
    int? id,
    int? tableServiceId,
    int? mealId,
    String? mealName,
    int? mealCount,
    double? priceSum,
  }) {
    return TableServiceOrderItemEntity(
      id: id ?? this.id,
      tableServiceId: tableServiceId ?? this.tableServiceId,
      mealId: mealId ?? this.mealId,
      mealName: mealName ?? this.mealName,
      mealCount: mealCount ?? this.mealCount,
      priceSum: priceSum ?? this.priceSum,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'tableServiceId': this.tableServiceId,
      'mealId': this.mealId,
      'mealName': this.mealName,
      'mealCount': this.mealCount,
      'priceSum': this.priceSum,
    };
  }

  factory TableServiceOrderItemEntity.fromMap(Map<String, dynamic> map) {
    return TableServiceOrderItemEntity(
      id: map['id'] as int,
      tableServiceId: map['tableServiceId'] as int,
      mealId: map['mealId'] as int,
      mealName: map['mealName'] as String,
      mealCount: map['mealCount'] as int,
      priceSum: map['priceSum'] as double,
    );
  }

//</editor-fold>
}