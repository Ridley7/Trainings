import 'package:bloc_api_ana_polo/repository/service/models/genre.dart';
import 'package:json_annotation/json_annotation.dart';

part 'store.g.dart';

@JsonSerializable()
class Store{

  final int? id;
  final Genre? store;

  Store({
    this.id,
    this.store
  });

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);

}