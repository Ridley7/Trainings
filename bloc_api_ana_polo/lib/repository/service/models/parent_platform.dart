
import 'package:bloc_api_ana_polo/repository/service/models/esrb_rating.dart';
import 'package:json_annotation/json_annotation.dart';

part 'parent_platform.g.dart';

@JsonSerializable()
class ParentPlatform{

  final EsrbRating? platform;

  ParentPlatform({
    this.platform
  });

  factory ParentPlatform.fromJson(Map<String, dynamic> json) => _$ParentPlatformFromJson(json);
}