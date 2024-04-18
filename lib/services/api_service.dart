import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:space_x/models/landing_pad.dart';
import 'package:space_x/models/launch_pad.dart';
import 'package:space_x/models/rocket_model.dart';

class ApiService {
  final rockets = 'https://api.spacexdata.com/v3/rockets';
  final launchpads = 'https://api.spacexdata.com/v3/launchpads';

  final capsules = 'https://api.spacexdata.com/v3/capsules';

  final landingpads = 'https://api.spacexdata.com/v3/landpads';

  Future<List<RocketModel>> getAllRockets() async {
    final response = await http.get(Uri.parse(rockets));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<RocketModel> rockets = body
          .map((rocket) => RocketModel.fromJson(rocket as Map<String, dynamic>))
          .toList();

      return rockets;
    } else {
      Logger().e('error - ${response.statusCode}');
      return [];
    }
  }

  Future<List<LaunchPadModel>> getAllLaunchPads() async {
    final response = await http.get(Uri.parse(launchpads));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<LaunchPadModel> launchpads = body
          .map((launchpad) =>
              LaunchPadModel.fromJson(launchpad as Map<String, dynamic>))
          .toList();

      return launchpads;
    } else {
      Logger().e('error - ${response.statusCode}');
      return [];
    }
  }

  Future<List<LandingPadModel>> getAllLandingPads() async {
    final response = await http.get(Uri.parse(landingpads));
    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<LandingPadModel> landingpads = body
          .map((landingpad) =>
              LandingPadModel.fromJson(landingpad as Map<String, dynamic>))
          .toList();

      return landingpads;
    } else {
      Logger().e('error - ${response.statusCode}');
      return [];
    }
  }
}
