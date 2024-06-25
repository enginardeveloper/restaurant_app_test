class TableServiceEntity {
  final int id;
  final String name;
  final int status;

//<editor-fold desc="Data Methods">
  const TableServiceEntity({
    required this.id,
    required this.name,
    required this.status,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is TableServiceEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          status == other.status);

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ status.hashCode;

  @override
  String toString() {
    return 'TableServiceEntity{' +
        ' id: $id,' +
        ' name: $name,' +
        ' status: $status,' +
        '}';
  }

  TableServiceEntity copyWith({
    int? id,
    String? name,
    int? status,
  }) {
    return TableServiceEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'name': this.name,
      'status': this.status,
    };
  }

  factory TableServiceEntity.fromMap(Map<String, dynamic> map) {
    return TableServiceEntity(
      id: map['id'] as int,
      name: map['name'] as String,
      status: map['status'] as int,
    );
  }

//</editor-fold>
}