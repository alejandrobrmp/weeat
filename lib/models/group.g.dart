// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Group _$GroupFromJson(Map json) {
  return Group(
      hour: json['hour'] as String,
      orders: (json['orders'] as List)
          ?.map((e) => e == null ? null : Order.fromJson(e as Map))
          ?.toList());
}

Map<String, dynamic> _$GroupToJson(Group instance) => <String, dynamic>{
      'hour': instance.hour,
      'orders': instance.orders?.map((e) => e?.toJson())?.toList()
    };
