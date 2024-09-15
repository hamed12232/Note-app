import 'package:hive_flutter/adapters.dart';

part 'notes_model.g.dart';

@HiveType(typeId: 0)
class NoteModels extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String subtitle;

  @HiveField(2)
  String data;

  @HiveField(3)
  int color;

  NoteModels({
    required this.title,
    required this.subtitle,
    required this.data,
    required this.color,
  });
}