import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable(anyMap: true, explicitToJson: true)
class Profile {
  String name;

  Profile({this.name});

  factory Profile.fromJson(Map json) => _$ProfileFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileToJson(this);

}