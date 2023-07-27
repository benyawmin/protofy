import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

// The slideshow banner on top
class SliderBanner extends StatelessWidget {
  const SliderBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        // Images of the slider banner
        Image.asset(fit: BoxFit.fitWidth, 'images/top_banner.png'),
        Image.asset(fit: BoxFit.fitWidth, 'images/top_banner1.png'),
        Image.asset(fit: BoxFit.fitWidth, 'images/top_banner2.png'),
      ],
      options: CarouselOptions(
        height: 18.h,
        // aspectRatio: 16 / 9,
        viewportFraction: 1,
        initialPage: 0,
        scrollPhysics: const NeverScrollableScrollPhysics(),
        reverse: false,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(seconds: 1),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
      ),
    );
  }
}
