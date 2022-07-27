// ignore_for_file: non_constant_identifier_names
import 'dart:convert';
import 'dart:math';

class Contact {
  final int id;
  final String name;
  final int accountNumber;

  Contact(
    this.id,
    this.name,
    this.accountNumber,
  );

  Contact copyWith({
    int? id,
    String? name,
    int? accountNumber,
  }) {
    return Contact(
      id ?? this.id,
      name ?? this.name,
      accountNumber ?? this.accountNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'accountNumber': accountNumber,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      map['id'] as int,
      map['name'] as String,
      map['accountNumber'] as int,
    );
  }

  factory Contact.fromMapWithoutId(Map<String, dynamic> map) {
    return Contact(
      Random().nextInt(100),
      map['name'] as String,
      map['accountNumber'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Contact.fromJson(String source) =>
      Contact.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Contact(id: $id, name: $name, accountNumber: $accountNumber)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Contact &&
        other.id == id &&
        other.name == name &&
        other.accountNumber == accountNumber;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ accountNumber.hashCode;
}
