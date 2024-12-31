
import 'package:flutter/widgets.dart';
import 'package:snag_application_1/models/status.dart';
import 'package:uuid/uuid.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:snag_application_1/l10n/app_localizations.dart';

part 'snag.g.dart';

@JsonSerializable()
class Snag{

  // mandatory fields
  final String id;
  final String dateCreated;
  final Status statusCategory;
  final int priority;
  String name;
  
  // optional fields
  String? description;
  String? mainImagePath;
  List<String>? additionalImagePaths;
  String? dateCompleted;
  String? finalRemarks;
  String? completedImagePath;


  Snag({
    Status? statusCategory,
    int? priority,
    String? name,
    String? id,
    String? dateCreated,
    this.description,
    this.mainImagePath,
    this.additionalImagePaths,
    this.dateCompleted,
    this.finalRemarks,
    this.completedImagePath,
  })
  : dateCreated = dateCreated ?? DateTime.now().toUtc().toIso8601String(),
    id = id ?? const Uuid().v4(),
    priority = priority ?? 0,
    name = name ?? 'Snag',
    statusCategory = statusCategory ?? Status(name: 'Open');

  factory Snag.fromJson(Map<String, dynamic> json) => _$SnagFromJson(json);
  Map<String, dynamic> toJson() => _$SnagToJson(this);

  void setLocalizedName(BuildContext context) {
    name = AppLocalizations.of(context).translate(name);
  }
}