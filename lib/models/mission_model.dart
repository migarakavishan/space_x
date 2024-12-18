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
        
  }
}
