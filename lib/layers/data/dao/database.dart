import 'dart:async';

import 'package:dbz_app/layers/data/dao/character_dao.dart';
import 'package:dbz_app/layers/data/dao/planet_dao.dart';
import 'package:dbz_app/layers/domain/entities/character_entity.dart';
import 'package:dbz_app/layers/domain/entities/planet_entity.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [CharacterEntity, PlanetEntity])
abstract class AppDatabase extends FloorDatabase {
  CharacterDao get characterDao;
  PlanetDao get planetDao;
}
