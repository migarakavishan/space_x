class MissionModel {
  String id;
  String name;
  String status;
  String location;

  MissionModel(
      {required this.id,
      required this.name,
      required this.status,
      required this.location});

  factory LaunchPadModel.fromJson(Map<String, dynamic> json) {
    return LaunchPadModel(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        location: json['location']['region'],
        locationName: json['location']['name'],
        longName: json['site_name_long'],
        successfullaunches: json['successful_launches'],
        attemptlaunch: json['attempted_launches'],
        details: json['details']);
  }
}
