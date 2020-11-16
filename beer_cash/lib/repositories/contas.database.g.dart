// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contas.database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String name;

  final List<Migration> _migrations = [];

  Callback _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name)
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
  _$AppDatabase([StreamController<String> listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ContasDAO _contasDAOInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
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
            'CREATE TABLE IF NOT EXISTS `Conta` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `data` TEXT, `valor` REAL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ContasDAO get contasDAO {
    return _contasDAOInstance ??= _$ContasDAO(database, changeListener);
  }
}

class _$ContasDAO extends ContasDAO {
  _$ContasDAO(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _contaInsertionAdapter = InsertionAdapter(
            database,
            'Conta',
            (Conta item) => <String, dynamic>{
                  'id': item.id,
                  'data': item.data,
                  'valor': item.valor
                }),
        _contaUpdateAdapter = UpdateAdapter(
            database,
            'Conta',
            ['id'],
            (Conta item) => <String, dynamic>{
                  'id': item.id,
                  'data': item.data,
                  'valor': item.valor
                }),
        _contaDeletionAdapter = DeletionAdapter(
            database,
            'Conta',
            ['id'],
            (Conta item) => <String, dynamic>{
                  'id': item.id,
                  'data': item.data,
                  'valor': item.valor
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Conta> _contaInsertionAdapter;

  final UpdateAdapter<Conta> _contaUpdateAdapter;

  final DeletionAdapter<Conta> _contaDeletionAdapter;

  @override
  Future<List<Conta>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM Conta ORDER BY data',
        mapper: (Map<String, dynamic> row) => Conta(
            id: row['id'] as int,
            data: row['data'] as String,
            valor: row['valor'] as double));
  }

  @override
  Future<Conta> getContaById(int id) async {
    return _queryAdapter.query('SELECT * FROM Conta WHERE id = ?',
        arguments: <dynamic>[id],
        mapper: (Map<String, dynamic> row) => Conta(
            id: row['id'] as int,
            data: row['data'] as String,
            valor: row['valor'] as double));
  }

  @override
  Future<int> insertConta(Conta c) {
    return _contaInsertionAdapter.insertAndReturnId(
        c, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateConta(Conta c) {
    return _contaUpdateAdapter.updateAndReturnChangedRows(
        c, OnConflictStrategy.abort);
  }

  @override
  Future<int> deleteConta(Conta c) {
    return _contaDeletionAdapter.deleteAndReturnChangedRows(c);
  }
}
