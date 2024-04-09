class RocketModel {
  int rocketID;
  String rocketName;
  String flickrImage;
  String company;
  bool status;
  String description;

  RocketModel(
      {required this.rocketName,
      required this.rocketID,
      required this.flickrImage,
      required this.description,
      required this.company,
      required this.status});

  factory RocketModel.fromJson(Map<String, dynamic> json) {
    return RocketModel(
      rocketName: json['rocket_name'],
      rocketID: json['id'],
      flickrImage:
          json['flickr_images'] != null && json['flickr_images'].isNotEmpty
              ? json['flickr_images'][0]
              : null,
      company: json['company'],
      status: json['active'],
      description: json['description'],
    );
  }
}
