import 'package:bloc_api_ana_polo/repository/service/models/filters_year.dart';
import 'package:json_annotation/json_annotation.dart';

part 'filters.g.dart';

@JsonSerializable()
class Filters{

  final List<FiltersYear>? years;

  const Filters({this.years});

  factory Filters.fromJson(Map<String, dynamic> json) => _$FiltersFromJson(json);

}