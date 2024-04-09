import 'package:flutter/material.dart';
import 'package:space_x/models/rocket_model.dart';

class RocketView extends StatefulWidget {
  const RocketView({super.key, required this.rocket});

  final RocketModel rocket;

  @override
  State<RocketView> createState() => _RocketViewState();
}

class _RocketViewState extends State<RocketView> {
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
            Container(
              width: size.width,
              height: size.height * 0.25,
              decoration: BoxDecoration(
                  color: Colors.grey.shade900,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        widget.rocket.flickrImage,
                      ))),
              child: Stack(
                children: [
                  Positioned(
                      child: BackButton(
                    color: Colors.white,
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Colors.black.withOpacity(0.5))),
                  ))
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.rocket.rocketName,
                  style: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(
                  widget.rocket.description,
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 16),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Overview',
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
                                ),
                                children: <TextSpan>[
                                  const TextSpan(text: "First Flight : "),
                                  TextSpan(
                                    text: widget.rocket.firstflight,
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
                                  const TextSpan(text: "Country : "),
                                  TextSpan(
                                    text: widget.rocket.country,
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
                                  const TextSpan(text: "Company : "),
                                  TextSpan(
                                    text: widget.rocket.company,
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
                                  const TextSpan(text: "Height(meters) : "),
                                  TextSpan(
                                    text: widget.rocket.height.toString(),
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
                                  const TextSpan(text: "Weight(kilograms) : "),
                                  TextSpan(
                                    text: widget.rocket.weight.toString(),
                                    style: const TextStyle(
                                      color: Colors.yellow,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      )),
    );
  }
}
