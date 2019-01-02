// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map json) {
  return User(
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map),
      pubs: (json['pubs'] as List)
          ?.map((e) => e == null
              ? null
              : const DocumentReferenceJsonConverter()
                  .fromJson(e as DocumentReference))
          ?.toList());
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'profile': instance.profile?.toJson(),
      'pubs': instance.pubs
          ?.map((e) => e == null
              ? null
              : const DocumentReferenceJsonConverter().toJson(e))
          ?.toList()
    };
