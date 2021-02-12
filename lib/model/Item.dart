import 'package:json_annotation/json_annotation.dart';

part 'Item.g.dart';

@JsonSerializable(nullable: false)
class Item {
  @JsonKey(name: 'title', nullable: false)
  final String title;
  @JsonKey(name: 'created_at', nullable: false)
  final String createdAt;
  @JsonKey(name: 'body', nullable: false)
  final String body;
  @JsonKey(name: 'url', nullable: false)
  final String url;

  Item(this.title, this.createdAt, this.body, this.url);

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}
