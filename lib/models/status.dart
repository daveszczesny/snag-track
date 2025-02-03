import 'package:flutter/material.dart';
import 'package:snag_application_1/app_theme.dart';
import 'package:uuid/uuid.dart';
import 'package:hive/hive.dart';

part 'status.g.dart';

@HiveType(typeId: 1)
class Status {

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String id;

  @HiveField(2)
  String? description;

  @HiveField(3)
  Color? color;

  Status({
    required this.name,
    this.description, 
    this.color,
    String? id
  })
  : id = id ?? const Uuid().v4();

  static Status getStatus(String name, BuildContext context) {
    final statusColors = Theme.of(context).extension<StatusColors>()!;
    switch(name) {
      case 'Todo':
        return Status(
          name: 'Todo',
          description: 'New issue that has not been started yet.',
          color: statusColors.todo,
        );
      case 'In Progress':
        return Status(
          name: 'In Progress',
          description: 'Issue that is currently being worked on.',
          color: statusColors.inProgress,
        );
      case 'Resolved':
        return Status(
          name: 'Resolved',
          description: 'Issue that has been resolved.',
          color: statusColors.resolved,
        );
      case 'Blocked':
        return Status(
          name: 'Blocked',
          description: 'Issue that has not been resolved.',
          color: statusColors.blocked,
        );
      default:
          return Status(name: name, color: statusColors.todo);
    }
  }

  static final Status todo = Status(
    name: 'To Do',
    description: 'New issue that has not been started yet.'
  );

  static final Status inProgress = Status(
    name: 'In Progress',
    description: 'Issue that is currently being worked on.',
  );

  static final Status resolved = Status(
    name: 'Resolved',
    description: 'Issue that has been resolved.',
  );

  static final Status unresolved = Status(
    name: 'Unresolved',
    description: 'Issue that has not been resolved.',
  );

  static final Status completed = Status(
    name: 'Completed',
    description: 'Issue that has been completed.',
  );
}