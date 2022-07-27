import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() async {
  // Buscando o caminho do banco
  final String dbPath = await getDatabasesPath();
  // Criando arquivo no caminho econtrado e retornando caminho do arquivo
  final String path = join(dbPath, 'bytebank.db');

  final Database database = await openDatabase(
    path,
    version: 1,
    // onDowngrade: onDatabaseDowngradeDelete,
    onCreate: (Database db, int version) {
      db.execute(
        'CREATE TABLE contacts('
        'id INTEGER PRIMARY KEY,'
        'name TEXT,'
        'accountNumber INTEGER)',
      );
    },
  );

  return database;
}
