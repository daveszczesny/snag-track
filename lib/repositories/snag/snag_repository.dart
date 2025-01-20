import 'package:snag_application_1/models/snag.dart';

abstract class SnagRepository {
  Future<void> addSnag(Snag snag);
  List<Snag> getSnags();
  List<Snag>getSnagsByCategoryId(String categoryId);
  Future<void> updateSnag(Snag snag);
  Future<void> deleteSnag(Snag snag);
  Future<void> deleteAllSnags();
}