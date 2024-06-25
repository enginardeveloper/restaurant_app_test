class AppDataEntity {
  final int id;
  final String buildNumber;
  final String appVersion;

//<editor-fold desc="Data Methods">
  const AppDataEntity({
    required this.id,
    required this.buildNumber,
    required this.appVersion,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppDataEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          buildNumber == other.buildNumber &&
          appVersion == other.appVersion
      );

  @override
  int get hashCode =>
      id.hashCode ^
      buildNumber.hashCode ^
      appVersion.hashCode;
  @override
  String toString() {
    return 'AppDataEntity{' +
        ' id: $id,' +
        ' buildNumber: $buildNumber,' +
        ' appVersion: $appVersion,' +
        '}';
  }

  AppDataEntity copyWith({
    int? id,
    String? buildNumber,
    String? appVersion,
  }) {
    return AppDataEntity(
      id: id ?? this.id,
      buildNumber: buildNumber ?? this.buildNumber,
      appVersion: appVersion ?? this.appVersion,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'buildNumber': this.buildNumber,
      'appVersion': this.appVersion,
    };
  }

  factory AppDataEntity.fromMap(Map<String, dynamic> map) {
    return AppDataEntity(
      id: map['id'] as int,
      buildNumber: map['buildNumber'] as String,
      appVersion: map['appVersion'] as String,
    );
  }

//</editor-fold>
}