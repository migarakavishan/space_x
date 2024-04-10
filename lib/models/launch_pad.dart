class LaunchPadModel {
  int id;
  String name;
  String status;
  String location;
  String details;
  String longName;
  String locationName;
  int attemptlaunch;
  int successfullaunches;

  LaunchPadModel(
      {required this.id,
      required this.name,
      required this.status,
      required this.location,
      required this.locationName,
      required this.attemptlaunch,
      required this.successfullaunches,
      required this.longName,
      required this.details});

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
