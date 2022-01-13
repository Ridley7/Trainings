import 'package:json_annotation/json_annotation.dart';

part 'esrb_rating.g.dart';

@JsonSerializable()
class EsrbRating{

  final int? id;
  final String? name;
  final String? slug;

  EsrbRating({
    this.id,
    this.name,
    this.slug
  });

  factory EsrbRating.fromJson(Map<String, dynamic> json) => _$EsrbRatingFromJson(json);

}