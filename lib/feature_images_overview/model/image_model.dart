class ImageModel {
  ImageModel({
    this.id,
    this.link,
    this.title,
    this.views,
    this.favorite,
    this.ups,
    this.downs,
    this.points,
    this.score,
  });

  final String? id;
  final String? link;
  final String? title;
  final int? views;
  final bool? favorite;
  final int? ups;
  final int? downs;
  final int? points;
  final int? score;
}
