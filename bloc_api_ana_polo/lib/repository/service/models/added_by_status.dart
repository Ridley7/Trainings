
import 'package:json_annotation/json_annotation.dart';

part 'added_by_status.g.dart';

@JsonSerializable()
class AddedByStatus {

  final int? yet;
  final int? owned;
  final int? beaten;
  final int? toplay;
  final int? dropped;
  final int? playing;

  AddedByStatus({this.yet, this.owned, this.beaten, this.toplay, this.dropped, this.playing});

  factory AddedByStatus.fromJson(Map<String, dynamic> json) => _$AddedByStatusFromJson(json);

}