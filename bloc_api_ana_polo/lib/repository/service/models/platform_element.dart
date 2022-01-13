import 'package:bloc_api_ana_polo/repository/service/models/platform_platform.dart';
import 'package:bloc_api_ana_polo/repository/service/models/requirements.dart';
import 'package:json_annotation/json_annotation.dart';

part 'platform_element.g.dart';

@JsonSerializable()
class PlatformElement{

  final PlatformPlatform? platform;
  final DateTime? releasedAt;
  final Requirements? requirementsEn;
  final Requirements? requirementsRu;

  PlatformElement({
    this.platform,
    this.releasedAt,
    this.requirementsEn,
    this.requirementsRu
  });

  factory PlatformElement.fromJson(Map<String, dynamic> json) => _$PlatformElementFromJson(json);



}