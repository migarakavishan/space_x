class RocketModel {
  String rocketID;
  String rocketName;
  String flickrImage;

  RocketModel(
      {required this.rocketName, required this.rocketID, required this.flickrImage});

  factory RocketModel.fromJson(Map<String, dynamic> json) {
    return RocketModel(
      rocketName: json['rocket_name'],
      rocketID: json['rocket_id'],
      flickrImage:
          json['flickr_images'] != null && json['flickr_images'].isNotEmpty
              ? json['flickr_images'][0]
              : null,
    );
  }
}
