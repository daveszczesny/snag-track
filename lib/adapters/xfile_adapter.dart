import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

class XFileAdapter extends TypeAdapter<XFile> {
  @override
  final int typeId = 99;

  @override
  XFile read(BinaryReader reader) {
    final path = reader.readString();
    return XFile(path);
  }

  @override
  void write(BinaryWriter writer, XFile obj) {
    writer.writeString(obj.path);
  }
}