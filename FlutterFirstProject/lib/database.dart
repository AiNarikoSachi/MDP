import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'dart:io';

import 'marvel.dart';

part 'database.g.dart';

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}

class MarvelModels extends Table {
  IntColumn get id => integer()();
  TextColumn get name => text()();
  TextColumn get image => text()();
  TextColumn get marvelText => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [MarvelModels])
class MarvelDatabase extends _$MarvelDatabase {
  MarvelDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<List<Marvel>> get marvels async {
    var response = await select(marvelModels).get();

    return response
        .map((e) => Marvel(
              id: e.id,
              name: e.name,
              text: e.marvelText,
              image: e.image,
            ))
        .toList();
  }

  void addMarvels(List<Marvel> marvels) {
    for (var m in marvels) {
      into(marvelModels).insert(
          MarvelModel(
              id: m.id, name: m.name, image: m.image, marvelText: m.text),
          mode: InsertMode.insertOrReplace);
    }
  }
}
