class RocketModel {
  String rocketName;

  RocketModel({
    required this.rocketName,
  });

  factory RocketModel.fromJson(Map<String, dynamic> json) {
    return  RocketModel(
      rocketName: json['rocket_name']
    );
  }
}
