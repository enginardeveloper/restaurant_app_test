import 'dart:convert';

import '../../../entities/app_data/app_data_entity.dart';
import '../../../utils/mapper/model_to_entity_mapper.dart';


class AppDataModel implements ModelToEntityMapper<AppDataEntity> {
  int id;
  String buildNumber;
  String appVersion;

  @override
  AppDataEntity toEntity() {
    // TODO: implement toEntity

    return AppDataEntity(
      id: id,
      buildNumber: buildNumber,
      appVersion: appVersion,

    );
  }

//<editor-fold desc="Data Methods">
  AppDataModel({
    required this.id,
    required this.buildNumber,
    required this.appVersion,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppDataModel &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          buildNumber == other.buildNumber &&
          appVersion == other.appVersion);

  @override
  int get hashCode =>
      id.hashCode ^
      buildNumber.hashCode ^
      appVersion.hashCode;

  @override
  String toString() {
    return 'AppDataModel{' +
        ' id: $id,' +
        ' buildNumber: $buildNumber,' +
        ' appVersion: $appVersion,' +
        '}';
  }

  AppDataModel copyWith({
    int? id,
    String? buildNumber,
    String? appVersion,
  }) {
    return AppDataModel(
      id: id ?? this.id,
      buildNumber: buildNumber ?? this.buildNumber,
      appVersion: appVersion ?? this.appVersion,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'buildNumber': this.buildNumber,
      'appVersion': this.appVersion,
    };
  }

  factory AppDataModel.fromJson(Map<String, dynamic> map) {
    return AppDataModel(
      id: map['id'] as int,
      buildNumber: map['buildNumber'] as String,
      appVersion: map['appVersion'] as String,
    );
  }
//</editor-fold>
}
