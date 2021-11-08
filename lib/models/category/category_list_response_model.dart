import 'package:json_annotation/json_annotation.dart';
import 'package:omar_alshyokh_test/models/category/category_data_model.dart';


part 'category_list_response_model.g.dart';

@JsonSerializable()
class CategoryListResponseModel {
 final String? status;
 final CategoryDataModel? data;



 CategoryListResponseModel(
      {
        this.data,
        this.status,
      });

  factory CategoryListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryListResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryListResponseModelToJson(this);
}
