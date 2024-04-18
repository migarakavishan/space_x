class LandingPadModel {
  String id;
  String name;
  String status;
  String location;

  LandingPadModel({required this.id, required this.name, required this.status, required this.location});

  factory LandingPadModel.fromJson(Map<String, dynamic> json) {
    return LandingPadModel(
      id: json['id'],
      name: json['full_name'],
      status: json['status'],
      location: json['location']['region'],
    );
  }
}
