import 'package:json_annotation/json_annotation.dart';
import 'package:we_eat/models/order.dart';

part 'group.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class Group {
  String hour;
  List<Order> orders;

  Group({this.hour, this.orders});

  factory Group.fromJson(Map json) => _$GroupFromJson(json);
  Map<String, dynamic> toJson() => _$GroupToJson(this);

}
