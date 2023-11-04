import 'package:flutter/material.dart';
import 'package:imgur/app.dart';

import 'infra/di/injection.dart';

const baseUrl = 'https://api.imgur.com';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDI(baseUrl: baseUrl);
  runApp(const ImgurApp(baseUrl:baseUrl));
}
