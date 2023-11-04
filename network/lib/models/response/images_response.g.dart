// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'images_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImagesResponse _$ImagesResponseFromJson(Map<String, dynamic> json) =>
    ImagesResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AlbumDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
