import 'package:uuid/uuid.dart';
import 'package:json_annotation/json_annotation.dart';


part 'status.g.dart';

@JsonSerializable()
class Status {

  final String name;
  final String id;
  String? description;

  Status({
    required this.name,
    this.description, String? id
  })
  : id = id ?? const Uuid().v4();

  // create a status category object from a map
  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);
  Map<String, dynamic> toJson() => _$StatusToJson(this);

}