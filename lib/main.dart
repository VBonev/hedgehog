import 'package:flutter/material.dart';
import 'package:imgur/app.dart';

const baseUrl = 'https://api.imgur.com';

void main() {
  runApp(const ImgurApp(baseUrl:baseUrl));
}
