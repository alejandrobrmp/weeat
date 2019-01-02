import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class Product {
  String name;
  double price;

  Product({this.name, this.price});

  factory Product.fromJson(Map json) => _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);

}
