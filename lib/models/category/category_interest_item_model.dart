import 'package:json_annotation/json_annotation.dart';


part 'category_interest_item_model.g.dart';

@JsonSerializable()
class CategoryInterestItemModel {

 final bool? flag;
 @JsonKey(name: "_id")
 final String? sId;
 final String? name;
 final String? category;
 final String? date;
 final String? slug;
 @JsonKey(name: "__v")
 final int? iV;
 final String? image;



 CategoryInterestItemModel(
      {
        this.flag,
        this.sId,
        this.name,
        this.category,
        this.date,
        this.slug,
        this.iV,
        this.image
      });

  factory CategoryInterestItemModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryInterestItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryInterestItemModelToJson(this);
}
