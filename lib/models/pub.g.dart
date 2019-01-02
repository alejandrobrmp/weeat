// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pub.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pub _$PubFromJson(Map json) {
  return Pub(
      name: json['name'] as String,
      participants: (json['participants'] as List)
          ?.map((e) => e == null
              ? null
              : const DocumentReferenceJsonConverter()
                  .fromJson(e as DocumentReference))
          ?.toList(),
      groups: (json['groups'] as List)
          ?.map((e) => e == null ? null : Group.fromJson(e as Map))
          ?.toList(),
      product: (json['product'] as List)
          ?.map((e) => e == null ? null : Product.fromJson(e as Map))
          ?.toList())
    ..organizer = json['organizer'] == null
        ? null
        : const DocumentReferenceJsonConverter()
            .fromJson(json['organizer'] as DocumentReference);
}

Map<String, dynamic> _$PubToJson(Pub instance) => <String, dynamic>{
      'name': instance.name,
      'organizer': instance.organizer == null
          ? null
          : const DocumentReferenceJsonConverter().toJson(instance.organizer),
      'participants': instance.participants
          ?.map((e) => e == null
              ? null
              : const DocumentReferenceJsonConverter().toJson(e))
          ?.toList(),
      'groups': instance.groups?.map((e) => e?.toJson())?.toList(),
      'product': instance.product?.map((e) => e?.toJson())?.toList()
    };
