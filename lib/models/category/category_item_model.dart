import 'package:json_annotation/json_annotation.dart';
import 'package:omar_alshyokh_test/models/category/category_interest_item_model.dart';


part 'category_item_model.g.dart';

@JsonSerializable()
class CategoryItemModel {
 final  List<CategoryInterestItemModel>? interests;
 final bool? premium;
  @JsonKey(name: "_id")
 final String? sId;
 final String? name;
 final String? selection;
 final String? date;
 final String? slug;
  @JsonKey(name: "__v")
 final int? iV;
 final String? url;



 CategoryItemModel(
      {
        this.interests,
        this.premium,
        this.sId,
        this.name,
        this.selection,
        this.date,
        this.slug,
        this.iV,
        this.url
      });

  factory CategoryItemModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryItemModelToJson(this);
}
