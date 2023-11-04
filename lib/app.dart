import 'package:flutter/material.dart';

import 'infra/page_factory.dart';
import 'strings.dart';

class ImgurApp extends StatelessWidget {
  const ImgurApp({
    this.baseUrl,
    super.key,
  });

  final String? baseUrl;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appTitle,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: PageFactory.getImagesOverview(),
    );
  }
}
