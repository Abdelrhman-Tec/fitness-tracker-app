import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderBanner extends StatelessWidget {
  final List<String> images;
  const SliderBanner({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: images.map((image) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Image.asset(image, fit: BoxFit.contain),
        );
      }).toList(),
      options: CarouselOptions(
        height: 180,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 3),
        enlargeCenterPage: true,
        viewportFraction: 1.1,
      ),
    );
  }
}
