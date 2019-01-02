import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:we_eat/models/group.dart';
import 'package:we_eat/models/product.dart';
import 'package:we_eat/models/user.dart';
import 'package:we_eat/utils/document_reference_json_converter.dart';

part 'pub.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class Pub {
  String name;

  @DocumentReferenceJsonConverter()
  DocumentReference organizer;

  @DocumentReferenceJsonConverter()
  List<DocumentReference> participants;

  List<Group> groups;
  List<Product> product;

  Pub({this.name, this.participants, this.groups, this.product});

  factory Pub.fromJson(Map json) => _$PubFromJson(json);
  Map<String, dynamic> toJson() => _$PubToJson(this);

}
