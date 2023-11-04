import 'package:flutter/material.dart';
import 'package:imgur/app.dart';

import 'infra/di/injection.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setupDI();
  runApp(const ImgurApp());
}
