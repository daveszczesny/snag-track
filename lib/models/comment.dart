import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'comment.g.dart';

@HiveType(typeId: 3)
class Comment extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String dateCreated;

  @HiveField(2)
  final String content;

  Comment({
    String? id,
    String? dateCreated,
    required this.content,
  })
  : id = id ?? const Uuid().v4(),
    dateCreated = dateCreated ?? DateTime.now().toIso8601String().split('T').first;
}