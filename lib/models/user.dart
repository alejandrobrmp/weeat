import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:we_eat/const/firestore_collections.dart';
import 'package:we_eat/models/pub.dart';
import 'package:we_eat/utils/document_reference_json_converter.dart';

part 'user.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class User {

  @JsonKey(ignore: true)
  DocumentReference doc;

  @JsonKey()
  String uid;

  @JsonKey()
  String name;

  @JsonKey()
  String email;

  @JsonKey()
  @DocumentReferenceJsonConverter()
  List<DocumentReference> pubs;

  User({this.uid, this.name, this.email, this.pubs});

  factory User.fromJson(Map json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  static Future<User> create({String uid, String name, String email}) async {
    User model = User(
      uid: uid,
      name: name,
      email: email
    );
    DocumentReference documentReference = Firestore.instance.collection(FirestoreCollections.USERS).document(uid);
    model.doc = documentReference;
    await documentReference.setData(model.toJson());
    return model;
  }

  static Future<User> read(DocumentReference ref) async {
    DocumentSnapshot snapshot = await ref.get();
    User model = User.fromJson(snapshot.data);
    model.doc = ref;
    return model;
  }

  Future<User> update() async {
    await this.doc.updateData(this.toJson());
    User updatedUser = await User.read(this.doc);
    if (updatedUser != this) {
      throw new Exception('Error updating user not equal.');
    }
    return updatedUser;
  }

  Future<User> addPub(Pub pub, {String name, List<User> participants}) async {
    if (pub == null) {
      pub = await Pub.create(
        name: name,
        organizer: this,
        participants: participants
      );
    }
    this.pubs = this.pubs == null ? List<DocumentReference>() : pubs;
    this.pubs.add(pub.doc);
    return await update();
  }

  Future<User> removePub(Pub pub) async {
    this.pubs.remove(pub);
    this.pubs.add(pub.doc);
    return await update();
  }

}
