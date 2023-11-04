// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumDTO _$AlbumDTOFromJson(Map<String, dynamic> json) => AlbumDTO(
      id: json['id'] as String,
      title: json['title'] as String?,
      datetime: json['datetime'] as int?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImageDTO.fromJson(e as Map<String, dynamic>))
          .toList(),
      views: json['views'] as int?,
      ups: json['ups'] as int?,
      downs: json['downs'] as int?,
      points: json['points'] as int?,
      score: json['score'] as int?,
    );
