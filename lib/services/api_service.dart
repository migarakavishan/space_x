import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:space_x/models/rocket_model.dart';

class ApiService {
  final rockets = 'https://api.spacexdata.com/v3/rockets';

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
}
