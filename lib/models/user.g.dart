// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map json) {
  return User(
      uid: json['uid'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      pubs: (json['pubs'] as List)
          ?.map((e) => e == null
              ? null
              : const DocumentReferenceJsonConverter()
                  .fromJson(e as DocumentReference))
          ?.toList());
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'email': instance.email,
      'pubs': instance.pubs
          ?.map((e) => e == null
              ? null
              : const DocumentReferenceJsonConverter().toJson(e))
          ?.toList()
    };
