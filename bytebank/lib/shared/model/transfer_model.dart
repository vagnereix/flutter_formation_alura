import 'dart:convert';

class Transfer {
  final String? value;
  final String? account;

  Transfer({
    this.value,
    this.account,
  });

  Transfer copyWith({
    String? value,
    String? account,
  }) {
    return Transfer(
      value: value ?? this.value,
      account: account ?? this.account,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'value': value,
      'account': account,
    };
  }

  factory Transfer.fromMap(Map<String, dynamic> map) {
    return Transfer(
      value: map['value'] != null ? map['value'] as String : null,
      account: map['account'] != null ? map['account'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Transfer.fromJson(String source) =>
      Transfer.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Transfer(value: $value, account: $account)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Transfer &&
        other.value == value &&
        other.account == account;
  }

  @override
  int get hashCode => value.hashCode ^ account.hashCode;
}
