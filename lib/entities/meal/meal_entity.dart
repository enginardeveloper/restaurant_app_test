class MealEntity {
  final int id;
  final int mealCategoryId;
  final String name;
  final double price;

//<editor-fold desc="Data Methods">
  const MealEntity({
    required this.id,
    required this.mealCategoryId,
    required this.name,
    required this.price,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MealEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          mealCategoryId == other.mealCategoryId &&
          name == other.name &&
          price == other.price);

  @override
  int get hashCode =>
      id.hashCode ^ mealCategoryId.hashCode ^ name.hashCode ^ price.hashCode;

  @override
  String toString() {
    return 'MealEntity{' +
        ' id: $id,' +
        ' mealCategoryId: $mealCategoryId,' +
        ' name: $name,' +
        ' price: $price,' +
        '}';
  }

  MealEntity copyWith({
    int? id,
    int? mealCategoryId,
    String? name,
    double? price,
  }) {
    return MealEntity(
      id: id ?? this.id,
      mealCategoryId: mealCategoryId ?? this.mealCategoryId,
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'mealCategoryId': this.mealCategoryId,
      'name': this.name,
      'price': this.price,
    };
  }

  factory MealEntity.fromMap(Map<String, dynamic> map) {
    return MealEntity(
      id: map['id'] as int,
      mealCategoryId: map['mealCategoryId'] as int,
      name: map['name'] as String,
      price: map['price'] as double,
    );
  }

//</editor-fold>
}