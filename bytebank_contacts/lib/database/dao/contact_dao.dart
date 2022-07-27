import 'package:sqflite/sqflite.dart';

import '../../models/contact_model.dart';
import '../app_database.dart';

class ContactDao {
  static const String tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER)';

  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'accountNumber';

  Future<int> save(Contact contact) async {
    Database database = await createDatabase();

    return database.insert(
      _tableName,
      contact.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Contact>> findAll() async {
    Database database = await createDatabase();

    final List<Map<String, dynamic>> maps = await database.query(_tableName);

    final List<Contact> contacts = List.generate(
      maps.length,
      (i) {
        print('Contact map: ${maps[i]}');
        return Contact.fromMap(maps[i]);
      },
    );

    return contacts;
  }
}
