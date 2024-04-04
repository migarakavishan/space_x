import 'package:flutter/material.dart';

import '../../../models/launch_pad.dart';
import '../../../services/api_service.dart';

class LaunchPadList extends StatelessWidget {
  const LaunchPadList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiService().getAllLaunchPads(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          }
          if (snapshot.hasError) {
            return const Text("something went wrong");
          }
          List<LaunchPadModel> launchpads = snapshot.data!;
          return SizedBox(
            height: 115,
            child: ListView.builder(
              itemCount: launchpads.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: 250,
                      height: 110,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey.shade700, width: 0.7),
                          color: Colors.grey.shade900,
                          borderRadius: BorderRadius.circular(15)),
                      child: Stack(
                        children: [
                          Positioned(
                              bottom: 40,
                              left: 10,
                              child: Text(
                                launchpads[index].name,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              )),
                          Positioned(
                              bottom: 20,
                              left: 10,
                              child: Text(
                                launchpads[index].location,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              )),
                          Positioned(
                              bottom: 30,
                              right: 20,
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  launchpads[index].status,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 17),
                                ),
                              ))
                        ],
                      )),
                );
              },
            ),
          );
        });
  }
}
