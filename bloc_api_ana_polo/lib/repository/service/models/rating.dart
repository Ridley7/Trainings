
import 'package:json_annotation/json_annotation.dart';

part 'rating.g.dart';

@JsonSerializable()
class Rating{

  final int? id;
  final String? title;
  final int? count;
  final double? percent;

  Rating({this.id, this.title, this.count, this.percent});

  factory Rating.fromJson(Map<String, dynamic> json) => _$RatingFromJson(json);
 }