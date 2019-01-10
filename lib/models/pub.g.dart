// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pub.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Pub _$PubFromJson(Map json) {
  return Pub(
      name: json['name'] as String,
      organizer: json['organizer'] == null
          ? null
          : const DocumentReferenceJsonConverter()
              .fromJson(json['organizer'] as DocumentReference),
      participants: (json['participants'] as List)
          ?.map((e) => e == null
              ? null
              : const DocumentReferenceJsonConverter()
                  .fromJson(e as DocumentReference))
          ?.toList());
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
          ?.toList()
    };
