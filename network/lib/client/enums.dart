
import 'package:json_annotation/json_annotation.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum Section {
  hot,
  top,
  user,
}

@JsonEnum(fieldRename: FieldRename.snake)
enum Sort {
  viral,
  top,
  time,
  rising,
}

@JsonEnum(fieldRename: FieldRename.snake)
enum Window {
  day,
  week,
  month,
  year,
  all,
}