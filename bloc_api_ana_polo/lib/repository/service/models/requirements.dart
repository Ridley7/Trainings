
import 'package:json_annotation/json_annotation.dart';

part 'requirements.g.dart';

@JsonSerializable()
class Requirements{

  final String? minimum;
  final String? recommended;

  Requirements({
    this.minimum,
    this.recommended
  });

  factory Requirements.fromJson(Map<String, dynamic> json) => _$RequirementsFromJson(json);
}