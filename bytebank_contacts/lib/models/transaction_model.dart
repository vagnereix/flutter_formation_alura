import 'dart:convert';

import 'contact_model.dart';

class Transaction {
  final double value;
  final Contact contact;

  Transaction({
    required this.value,
    required this.contact,
  });

  Transaction copyWith({
    double? value,
    Contact? contact,
  }) {
    return Transaction(
      value: value ?? this.value,
      contact: contact ?? this.contact,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'value': value,
      'contact': contact.toMap(),
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction(
      value: map['value'] as double,
      contact: Contact.fromMapWithoutId(map['contact'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory Transaction.fromJson(String source) =>
      Transaction.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Transaction(value: $value, contact: $contact)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Transaction &&
        other.value == value &&
        other.contact == contact;
  }

  @override
  int get hashCode => value.hashCode ^ contact.hashCode;
}
