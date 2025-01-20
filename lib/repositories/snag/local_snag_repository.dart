import 'package:hive/hive.dart';
import 'package:snag_application_1/models/snag.dart';
import 'package:snag_application_1/repositories/snag/snag_repository.dart';

class LocalSnagRepository implements SnagRepository{
  final Box<Snag> _snagBox = Hive.box<Snag>('snags');

  @override
  Future<void> addSnag(Snag snag) async {
    await _snagBox.add(snag);
  }

  @override
  List<Snag> getSnags() {
    return _snagBox.values.toList();
  }

  @override
  List<Snag>getSnagsByCategoryId(String categoryId) {
    return _snagBox.values.where((snag) => snag.categoryId == categoryId).toList();
  }

  @override
  Future<void> updateSnag(Snag snag) async {
    await _snagBox.putAt(_snagBox.keyAt(snag.key!), snag);
  }

  @override
  Future<void> deleteSnag(Snag snag) async {
    await _snagBox.deleteAt(_snagBox.keyAt(snag.key!));
  }

  @override
  Future<void> deleteAllSnags() async {
    await _snagBox.clear();
  }

  Future<void> closeBox() async {
    await _snagBox.close();
  }
}

final SnagRepository snagRepository = LocalSnagRepository();