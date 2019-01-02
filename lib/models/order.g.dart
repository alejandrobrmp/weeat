// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map json) {
  return Order(
      applicant: json['applicant'] == null
          ? null
          : const DocumentReferenceJsonConverter()
              .fromJson(json['applicant'] as DocumentReference),
      products: (json['products'] as List)
          ?.map((e) => e == null ? null : Product.fromJson(e as Map))
          ?.toList());
}

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'applicant': instance.applicant == null
          ? null
          : const DocumentReferenceJsonConverter().toJson(instance.applicant),
      'products': instance.products?.map((e) => e?.toJson())?.toList()
    };
