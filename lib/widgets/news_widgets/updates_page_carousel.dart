import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  final height;

  const ImageCarousel({Key key, this.height}) : super(key: key);

  @override
  _ImageCarouselState createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        "assets/updates/news1.png",
        "assets/updates/news2.png",
        "assets/updates/news4.png",
        "assets/updates/news5.png",
        "assets/updates/news6.png",
        "assets/updates/news7.png"
      ]
          .map(
            (imgPath) => Container(
              decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: AssetImage(imgPath),
                ),
              ),
            ),
          )
          .toList(),
      options: CarouselOptions(
        initialPage: 0,
        autoPlay: true,
        pauseAutoPlayOnTouch: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        viewportFraction: 1.2,
        enableInfiniteScroll: true,
        height: widget.height,
      ),
    );
  }
}
