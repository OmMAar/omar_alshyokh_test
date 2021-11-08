// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryDataModel _$CategoryDataModelFromJson(Map<String, dynamic> json) {
  return CategoryDataModel(
    data: (json['data'] as List<dynamic>?)
        ?.map((e) => CategoryItemModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$CategoryDataModelToJson(CategoryDataModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
