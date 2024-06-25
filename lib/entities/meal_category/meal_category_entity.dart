class MealCategoryEntity {
  final int id;
  final String name;

//<editor-fold desc="Data Methods">
  const MealCategoryEntity({
    required this.id,
    required this.name,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MealCategoryEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name);

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  @override
  String toString() {
    return 'MealCategoryEntity{' + ' id: $id,' + ' name: $name,' + '}';
  }

  MealCategoryEntity copyWith({
    int? id,
    String? name,
  }) {
    return MealCategoryEntity(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
    };
  }

  factory MealCategoryEntity.fromMap(Map<String, dynamic> map) {
    return MealCategoryEntity(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

//</editor-fold>
}