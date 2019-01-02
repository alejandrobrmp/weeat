import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:we_eat/models/profile.dart';
import 'package:we_eat/models/pub.dart';
import 'package:we_eat/utils/document_reference_json_converter.dart';

part 'user.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class User {
  Profile profile;

  @DocumentReferenceJsonConverter()
  List<DocumentReference> pubs;

  User({this.profile, this.pubs});

  factory User.fromJson(Map json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

}