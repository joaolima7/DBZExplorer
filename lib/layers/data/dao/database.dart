import 'dart:async';

import 'package:dbz_app/layers/data/dao/character_dao.dart';
import 'package:dbz_app/layers/data/dao/models/character_model.dart';
import 'package:dbz_app/layers/data/dao/models/planet_model.dart';
import 'package:dbz_app/layers/data/dao/planet_dao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [CharacterModel, PlanetModel])
abstract class AppDatabase extends FloorDatabase {
  CharacterDao get characterDao;
  PlanetDao get planetDao;
}
