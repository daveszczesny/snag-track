import 'package:snag_application_1/models/snag.dart';
import 'package:snag_application_1/models/status.dart';
import 'package:uuid/uuid.dart';
import 'package:hive/hive.dart';

part 'category.g.dart';

@HiveType(typeId: 4)
class Category extends HiveObject{

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String id;

  @HiveField(3)
  String? description;

  @HiveField(4)
  List<Snag> snags = [];


  Category({
    required this.name,
    this.description,
    String? id,
  })
  : id = id ?? const Uuid().v4();

  int get totalSnags => snags.length;
  int get totalResolvedSnags => snags.where((snag) => snag.status == Status.resolved).length;
  int get totalOpenSnags => snags.where((snag) => snag.status != Status.resolved).length;

  void addSnag(Snag snag) {
    snags.add(snag);
    save();
  }

  void removeSnag(Snag snag) {
    snags.remove(snag);
    save();
  }

}