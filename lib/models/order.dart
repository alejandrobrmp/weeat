import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:we_eat/models/product.dart';
import 'package:we_eat/models/user.dart';
import 'package:we_eat/utils/document_reference_json_converter.dart';

part 'order.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class Order {
  @DocumentReferenceJsonConverter()
  DocumentReference applicant;
  List<Product> products;

  Order({this.applicant, this.products});

  factory Order.fromJson(Map json) => _$OrderFromJson(json);
  Map<String, dynamic> toJson() => _$OrderToJson(this);

}
