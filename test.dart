import 'dart:convert';

import 'package:collection/collection.dart';

enum Payment { pix, credit }

class Test {
  final List<String> members;
  final Map<String, dynamic> address;
  final Payment? paymentType; //enum
  final DateTime date;
  final Timestamp? time;
  final String? name;
  final bool? isPremium;
  final IconData icon;
  final Color? color;
  final int id;
  final double? radius;
  Test({
    this.members,
    this.address,
    this.paymentType,
    this.date,
    this.time,
    this.name,
    this.isPremium,
    this.icon,
    this.color,
    this.id,
    this.radius,
  });

  factory Test.fromJson(String source) => Test.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Test(members: $members, address: $address, paymentType: $paymentType, date: $date, time: $time, name: $name, isPremium: $isPremium, icon: $icon, color: $color, id: $id, radius: $radius)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final collectionEquals = const DeepCollectionEquality().equals;

    return other is Test &&
        collectionEquals(other.members, members) &&
        collectionEquals(other.address, address) &&
        other.paymentType == paymentType &&
        other.date == date &&
        other.time == time &&
        other.name == name &&
        other.isPremium == isPremium &&
        other.icon == icon &&
        other.color == color &&
        other.id == id &&
        other.radius == radius;
  }

  @override
  int get hashCode {
    return members.hashCode ^
        address.hashCode ^
        paymentType.hashCode ^
        date.hashCode ^
        time.hashCode ^
        name.hashCode ^
        isPremium.hashCode ^
        icon.hashCode ^
        color.hashCode ^
        id.hashCode ^
        radius.hashCode;
  }

  Test copyWith({
    List<String>? members,
    Map<String, dynamic>? address,
    Payment? paymentType,
    DateTime? date,
    Timestamp? time,
    String? name,
    bool? isPremium,
    IconData? icon,
    Color? color,
    int? id,
    double? radius,
  }) {
    return Test(
      members: members ?? this.members,
      address: address ?? this.address,
      paymentType: paymentType ?? this.paymentType,
      date: date ?? this.date,
      time: time ?? this.time,
      name: name ?? this.name,
      isPremium: isPremium ?? this.isPremium,
      icon: icon ?? this.icon,
      color: color ?? this.color,
      id: id ?? this.id,
      radius: radius ?? this.radius,
    );
  }

  factory Test.fromMap(Map<String, dynamic> map) {
    T isA<T>(k) => map[k] is T ? map[k] : throw ArgumentError.value(map[k], k);
    return Test(
      members: List<String>.from(
          isA<Iterable<String>?>('members') ?? const <String>[]),
      address: Map<String, dynamic>.from(
          isA<Map<String, dynamic>?>('address') ?? const {}),
      paymentType: map['paymentType'] != null
          ? Payment.values[isA<num>('paymentType').toInt()]
          : null,
      date:
          DateTime.fromMillisecondsSinceEpoch(isA<num?>('date')?.toInt() ?? 0),
      time: map['time'] != null ? isA<Timestamp>('time') : null,
      name: isA<String?>('name'),
      isPremium: isA<bool?>('isPremium'),
      icon: IconData(isA<num?>('icon')?.toInt() ?? 0,
          fontFamily: 'MaterialIcons'),
      color: map['color'] != null ? Color(isA<num>('color').toInt()) : null,
      id: isA<num?>('id')?.toInt() ?? 0,
      radius: isA<num?>('radius')?.toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'members': members,
      'address': address,
      'paymentType': paymentType?.index,
      'date': date.millisecondsSinceEpoch,
      'time': time,
      'name': name,
      'isPremium': isPremium,
      'icon': icon.codePoint,
      'color': color?.value,
      'id': id,
      'radius': radius,
    };
  }

  String toJson() => json.encode(toMap());
}
