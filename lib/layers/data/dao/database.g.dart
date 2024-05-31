// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  CharacterDao? _characterDaoInstance;

  PlanetDao? _planetDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `characters` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `id` INTEGER NOT NULL, `name` TEXT NOT NULL, `ki` TEXT NOT NULL, `race` TEXT NOT NULL, `gender` TEXT NOT NULL, `description` TEXT NOT NULL, `image` TEXT NOT NULL)');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `planets` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `id` INTEGER NOT NULL, `name` TEXT NOT NULL, `description` TEXT NOT NULL, `image` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  CharacterDao get characterDao {
    return _characterDaoInstance ??= _$CharacterDao(database, changeListener);
  }

  @override
  PlanetDao get planetDao {
    return _planetDaoInstance ??= _$PlanetDao(database, changeListener);
  }
}

class _$CharacterDao extends CharacterDao {
  _$CharacterDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _characterModelInsertionAdapter = InsertionAdapter(
            database,
            'characters',
            (CharacterModel item) => <String, Object?>{
                  'id': item.id,
                  'id': item.id,
                  'name': item.name,
                  'ki': item.ki,
                  'race': item.race,
                  'gender': item.gender,
                  'description': item.description,
                  'image': item.image
                }),
        _characterModelDeletionAdapter = DeletionAdapter(
            database,
            'characters',
            ['id'],
            (CharacterModel item) => <String, Object?>{
                  'id': item.id,
                  'id': item.id,
                  'name': item.name,
                  'ki': item.ki,
                  'race': item.race,
                  'gender': item.gender,
                  'description': item.description,
                  'image': item.image
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<CharacterModel> _characterModelInsertionAdapter;

  final DeletionAdapter<CharacterModel> _characterModelDeletionAdapter;

  @override
  Future<List<CharacterModel>> getAllCharacters() async {
    return _queryAdapter.queryList('SELECT * FROM CHARACTERENTITY',
        mapper: (Map<String, Object?> row) => CharacterModel(
            id: row['id'] as int,
            name: row['name'] as String,
            ki: row['ki'] as String,
            race: row['race'] as String,
            gender: row['gender'] as String,
            description: row['description'] as String,
            image: row['image'] as String));
  }

  @override
  Future<void> addCharacter(CharacterModel character) async {
    await _characterModelInsertionAdapter.insert(
        character, OnConflictStrategy.replace);
  }

  @override
  Future<void> removeCharacter(CharacterModel character) async {
    await _characterModelDeletionAdapter.delete(character);
  }
}

class _$PlanetDao extends PlanetDao {
  _$PlanetDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _planetModelInsertionAdapter = InsertionAdapter(
            database,
            'planets',
            (PlanetModel item) => <String, Object?>{
                  'id': item.id,
                  'id': item.id,
                  'name': item.name,
                  'description': item.description,
                  'image': item.image
                }),
        _planetModelDeletionAdapter = DeletionAdapter(
            database,
            'planets',
            ['id'],
            (PlanetModel item) => <String, Object?>{
                  'id': item.id,
                  'id': item.id,
                  'name': item.name,
                  'description': item.description,
                  'image': item.image
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<PlanetModel> _planetModelInsertionAdapter;

  final DeletionAdapter<PlanetModel> _planetModelDeletionAdapter;

  @override
  Future<List<PlanetModel>> getAllPlanets() async {
    return _queryAdapter.queryList('SELECT * FROM planets',
        mapper: (Map<String, Object?> row) => PlanetModel(
            id: row['id'] as int,
            name: row['name'] as String,
            description: row['description'] as String,
            image: row['image'] as String));
  }

  @override
  Future<void> addPlanets(PlanetModel planet) async {
    await _planetModelInsertionAdapter.insert(
        planet, OnConflictStrategy.replace);
  }

  @override
  Future<void> removePlanet(PlanetModel planet) async {
    await _planetModelDeletionAdapter.delete(planet);
  }
}
