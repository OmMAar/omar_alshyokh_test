// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_interest_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryInterestItemModel _$CategoryInterestItemModelFromJson(
    Map<String, dynamic> json) {
  return CategoryInterestItemModel(
    flag: json['flag'] as bool?,
    sId: json['_id'] as String?,
    name: json['name'] as String?,
    category: json['category'] as String?,
    date: json['date'] as String?,
    slug: json['slug'] as String?,
    iV: json['__v'] as int?,
    image: json['image'] as String?,
  );
}

Map<String, dynamic> _$CategoryInterestItemModelToJson(
        CategoryInterestItemModel instance) =>
    <String, dynamic>{
      'flag': instance.flag,
      '_id': instance.sId,
      'name': instance.name,
      'category': instance.category,
      'date': instance.date,
      'slug': instance.slug,
      '__v': instance.iV,
      'image': instance.image,
    };
