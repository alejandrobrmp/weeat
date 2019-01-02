// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map json) {
  return Product(
      name: json['name'] as String, price: (json['price'] as num)?.toDouble());
}

Map<String, dynamic> _$ProductToJson(Product instance) =>
    <String, dynamic>{'name': instance.name, 'price': instance.price};
