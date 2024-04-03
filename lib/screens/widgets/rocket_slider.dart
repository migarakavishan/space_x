import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../models/rocket_model.dart';
import '../../services/api_service.dart';

class RocketSlider extends StatelessWidget {
  const RocketSlider({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiService().getAllRockets(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          List<RocketModel> rockets = snapshot.data!;
          return CarouselSlider(
            options: CarouselOptions(
                height: size.height * 0.25, autoPlay: true),
            items: rockets.map((rocket) {
              return Builder(
                builder: (BuildContext context) {
                  return Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Container(
                      width: size.width,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade900,
                          borderRadius: BorderRadius.circular(25),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image:
                                  NetworkImage(rocket.flickrImage),
                              opacity: 0.5)),
                      child: Stack(
                        children: [
                          Positioned(
                            bottom: 20,
                            left: 4,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8),
                              child: Text(
                                rocket.rocketName,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 4,
                              left: 4,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8),
                                child: Text(
                                  rocket.company,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              )),
                          Positioned(
                              bottom: 8,
                              right: 20,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius:
                                        BorderRadius.circular(10)),
                                child: Text(
                                  rocket.status
                                      ? "Active"
                                      : "Inactive",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 17),
                                ),
                              ))
                        ],
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          );
        });
  }
}