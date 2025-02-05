
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snag_application_1/models/category.dart';
import 'package:snag_application_1/models/priority_enum.dart';
import 'package:snag_application_1/models/project.dart';
import 'package:snag_application_1/models/status.dart';
import 'package:snag_application_1/ui/widgets/project_card_widget.dart';
import 'package:uuid/uuid.dart';
import 'package:hive/hive.dart';
import 'package:snag_application_1/l10n/app_localizations.dart';

part 'snag.g.dart';

@HiveType(typeId: 0)
class Snag extends HiveObject {

  // mandatory fields
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String dateCreated;

  @HiveField(2)
  Status status;

  @HiveField(3)
  Priority priority;

  @HiveField(4)
  String name;

  // optional fields

  @HiveField(5)
  String? description;

  @HiveField(6)
  List<XFile>? images;

  @HiveField(7)
  String? dateCompleted;

  @HiveField(8)
  String? finalRemarks;

  @HiveField(9)
  String? completedImagePath;

  @HiveField(10)
  String? assignedTo;

  @HiveField(11)
  String? categoryId; // epic

  @HiveField(12)
  String? projectId;


  Snag({
    Priority? priority,
    String? name,
    String? id,
    String? dateCreated,
    Status? status,
    this.description,
    this.images,
    this.dateCompleted,
    this.finalRemarks,
    this.completedImagePath,
    this.assignedTo,
    this.categoryId,
  })
  : dateCreated = dateCreated ?? DateTime.now().toUtc().toIso8601String(),
    id = id ?? const Uuid().v4(),
    priority = priority ?? Priority.low,
    name = name ?? 'Snag',
    status = status ?? Status.todo;

  void setLocalizedName(BuildContext context) {
    name = AppLocalizations.of(context).translate(name);
  }


  @override
  Future<void> save() async {
    await super.save();
    _updateProjectLastModified();
  }

  @override
  Future<void> delete() async {
    super.delete();
    _updateProjectLastModified();
  }

  void _updateProjectLastModified() {
    if (projectId != null) {
      var projectBox = Hive.box<Project>('projects');
      Project? project = projectBox.get(projectId);
      project?.updateLastModified();

    }
  }

}