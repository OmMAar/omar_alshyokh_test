import 'package:json_annotation/json_annotation.dart';
import 'package:omar_alshyokh_test/models/category/category_item_model.dart';


part 'category_data_model.g.dart';

@JsonSerializable()
class CategoryDataModel {
 final  List<CategoryItemModel>? data;



 CategoryDataModel(
      {
        this.data,
      });

  factory CategoryDataModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryDataModelToJson(this);
}
