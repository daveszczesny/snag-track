

import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';
import 'package:snag_application_1/l10n/app_localizations.dart';
import 'package:snag_application_1/models/snag.dart';
import 'package:snag_application_1/models/status.dart';
import 'package:uuid/uuid.dart';

part 'project.g.dart';

@HiveType(typeId: 2)
class Project extends HiveObject {
  
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String dateCreated;

  @HiveField(2)
  Status statusCategory;

  @HiveField(3)
  String name;

  @HiveField(4)
  List<Snag> snags = [];

  @HiveField(5)
  String? logoImage;

  @HiveField(6)
  String? signature; // should this be its own object? or an image

  @HiveField(7)
  String? projectRef;

  @HiveField(8)
  String? client;

  @HiveField(9)
  String? contractor;

  @HiveField(10)
  String? location;

  @HiveField(11)
  String? description;

  @HiveField(12)
  String? dateCompleted;

  @HiveField(13)
  String? finalRemarks;

  @HiveField(14)
  int get totalSnags => snags.length;

  @HiveField(15)
  int get totalResolvedSnags => snags.where((snag) => snag.status == Status.resolved).length;

  Project({
    String? name,
    String? id,
    String? dateCreated,
    Status? statusCategory,
    List<Snag>? snags,
    this.logoImage,
    this.signature,
    this.projectRef,
    this.client,
    this.contractor,
    this.location,
    this.description,
    this.dateCompleted,
    this.finalRemarks,
  })
  : dateCreated = dateCreated ?? DateTime.now().toUtc().toIso8601String(),
    id = id ?? const Uuid().v4(),
    name = name ?? 'Project',
    statusCategory = statusCategory ?? Status.todo;

  void setLocalizedName(BuildContext context) {
    name = AppLocalizations.of(context).translate(name);
  }
}