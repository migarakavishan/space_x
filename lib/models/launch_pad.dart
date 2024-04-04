class LaunchPadModel {
  int id;
  String name;
  String status;
  String location;
  String details;

  LaunchPadModel(
      {required this.id,
      required this.name,
      required this.status,
      required this.location,
      required this.details});

  factory LaunchPadModel.fromJson(Map<String, dynamic> json) {
    return LaunchPadModel(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        location: json['location']['region'],
        details: json['details']);
  }
}
