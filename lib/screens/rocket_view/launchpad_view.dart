import 'package:flutter/material.dart';
import 'package:space_x/models/launch_pad.dart';

class LaunchPadView extends StatefulWidget {
  const LaunchPadView({super.key, required this.launchpads});

  final LaunchPadModel launchpads;

  @override
  State<LaunchPadView> createState() => _LaunchPadViewState();
}

class _LaunchPadViewState extends State<LaunchPadView> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Stack(
              children: [
                Positioned(
                    child: BackButton(
                  color: Colors.white,
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.black)),
                ))
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.launchpads.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    widget.launchpads.details,
                    textAlign: TextAlign.justify,
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Overview",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Column(
                    children: [
                      Container(
                        height: size.height * 0.25,
                        width: size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey.shade900),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  children: <TextSpan>[
                                    const TextSpan(text: "Site Name: "),
                                    TextSpan(
                                      text: widget.launchpads.longName,
                                      style: const TextStyle(
                                        color: Colors.yellow,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                  ),
                                  children: <TextSpan>[
                                    const TextSpan(text: "Region: "),
                                    TextSpan(
                                      text: widget.launchpads.location,
                                      style: const TextStyle(
                                        color: Colors.yellow,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                  ),
                                  children: <TextSpan>[
                                    const TextSpan(text: "Location: "),
                                    TextSpan(
                                      text: widget.launchpads.locationName,
                                      style: const TextStyle(
                                        color: Colors.yellow,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                  ),
                                  children: <TextSpan>[
                                    const TextSpan(text: "Attempted Launches: "),
                                    TextSpan(
                                      text: widget.launchpads.attemptlaunch.toString(),
                                      style: const TextStyle(
                                        color: Colors.yellow,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                  ),
                                  children: <TextSpan>[
                                    const TextSpan(text: "Successful Launches: "),
                                    TextSpan(
                                      text: widget.launchpads.successfullaunches.toString(),
                                      style: const TextStyle(
                                        color: Colors.yellow,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      )),
    );
  }
}
