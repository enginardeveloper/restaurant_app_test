import 'package:equatable/equatable.dart';

class GetAppDataParams extends Equatable {
  final int appDataId;

  const GetAppDataParams({
    required this.appDataId,
  });

  @override
  List<Object> get props => [appDataId];
}