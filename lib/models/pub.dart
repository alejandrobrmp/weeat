import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:we_eat/const/firestore_collections.dart';
import 'package:we_eat/models/user.dart';
import 'package:we_eat/utils/document_reference_json_converter.dart';

part 'pub.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class Pub {

  @JsonKey(ignore: true)
  DocumentReference doc;

  @JsonKey()
  String name;

  @JsonKey()
  @DocumentReferenceJsonConverter()
  DocumentReference organizer;

  @JsonKey()
  @DocumentReferenceJsonConverter()
  List<DocumentReference> participants;

  Pub({this.name, this.organizer, this.participants});

  factory Pub.fromJson(Map json) => _$PubFromJson(json);
  Map<String, dynamic> toJson() => _$PubToJson(this);

  static Future<Pub> create({String name, User organizer, List<User> participants}) async {
    Pub model = Pub(
      name: name,
      organizer: organizer.doc,
      participants: participants == null ? null : participants.map((User u) => u.doc)
    );
    DocumentReference documentReference = Firestore.instance.collection(FirestoreCollections.PUBS).document();
    model.doc = documentReference;
    await documentReference.setData(model.toJson());
    return model;
  }

}
