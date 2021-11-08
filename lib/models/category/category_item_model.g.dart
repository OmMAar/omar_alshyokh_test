// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryItemModel _$CategoryItemModelFromJson(Map<String, dynamic> json) {
  return CategoryItemModel(
    interests: (json['interests'] as List<dynamic>?)
        ?.map((e) =>
            CategoryInterestItemModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    premium: json['premium'] as bool?,
    sId: json['_id'] as String?,
    name: json['name'] as String?,
    selection: json['selection'] as String?,
    date: json['date'] as String?,
    slug: json['slug'] as String?,
    iV: json['__v'] as int?,
    url: json['url'] as String?,
  );
}

Map<String, dynamic> _$CategoryItemModelToJson(CategoryItemModel instance) =>
    <String, dynamic>{
      'interests': instance.interests,
      'premium': instance.premium,
      '_id': instance.sId,
      'name': instance.name,
      'selection': instance.selection,
      'date': instance.date,
      'slug': instance.slug,
      '__v': instance.iV,
      'url': instance.url,
    };
