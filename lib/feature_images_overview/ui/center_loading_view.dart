import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class CenterLoadingView extends StatelessWidget {
  const CenterLoadingView({
    this.mainColor = Colors.deepPurple,
    this.secondaryColor = Colors.pinkAccent,
    this.size = 70,
    super.key,
  });

  final Color mainColor;
  final Color secondaryColor;
  final double size;

  @override
  Widget build(BuildContext context) => Center(
        child: LoadingAnimationWidget.flickr(
          leftDotColor: mainColor,
          rightDotColor: secondaryColor,
          size: size,
        ),
      );
}
