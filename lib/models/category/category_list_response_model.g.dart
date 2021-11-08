// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryListResponseModel _$CategoryListResponseModelFromJson(
    Map<String, dynamic> json) {
  return CategoryListResponseModel(
    data: json['data'] == null
        ? null
        : CategoryDataModel.fromJson(json['data'] as Map<String, dynamic>),
    status: json['status'] as String?,
  );
}

Map<String, dynamic> _$CategoryListResponseModelToJson(
        CategoryListResponseModel instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };
