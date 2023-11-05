class ImageModel {
  ImageModel({
    this.id,
    this.link,
    this.title,
    this.views,
    this.isFavorite,
    this.ups,
    this.downs,
    this.points,
    this.score,
  });

  final String? id;
  final String? link;
  final String? title;
  final int? views;
  bool? isFavorite;
  final int? ups;
  final int? downs;
  final int? points;
  final int? score;
}
