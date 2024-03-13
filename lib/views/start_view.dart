import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class StartView extends StatelessWidget {
  const StartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/bg_full.jpg'), // Your image path here
              fit: BoxFit.cover, // Covers the entire container
            ),
          ),
        ),
        Positioned.fill(
          child: Center(
            child: SvgPicture.asset('assets/logo.svg'), // Overlay image asset
          ),
        ),
      ]),
    );
  }
}
