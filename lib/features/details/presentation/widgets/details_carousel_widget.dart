import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ibuild_vendor/core/theme/app_colors.dart';
import 'package:ibuild_vendor/core/utils/app_utils/extension.dart';
import 'package:ibuild_vendor/features/home/data/models/home_carousel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DetailsCarouselWidget extends StatefulWidget {
  const DetailsCarouselWidget({super.key});

  @override
  State<DetailsCarouselWidget> createState() => _DetailsCarouselWidgetState();
}

class _DetailsCarouselWidgetState extends State<DetailsCarouselWidget> {
  int currentCarouselIndex = 0;
  @override
  Widget build(BuildContext context) {
    final double height = context.screenHeight * .3;
    return SizedBox(
      height: height,
      child: Stack(
        children: [
          CarouselSlider(
            options: CarouselOptions(
                height: height,
                viewportFraction: 1,
                autoPlay: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentCarouselIndex = index;
                  });
                }),
            items: carousels.map((machine) {
              return Builder(
                builder: (BuildContext context) {
                  return Stack(
                    children: [
                      Image.asset(
                        machine.assetPath,
                        fit: BoxFit.cover,
                        width: MediaQuery.of(context).size.width,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black.withOpacity(0.3),
                              Colors.black,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              );
            }).toList(),
          ),
          Positioned(
            bottom: 30,
            right: 50,
            child: SizedBox(
              width: 50,
              child: AnimatedSmoothIndicator(
                activeIndex: currentCarouselIndex,
                count: carousels.length,
                effect: ExpandingDotsEffect(
                    dotWidth: 7,
                    dotHeight: 7,
                    dotColor: Colors.white,
                    activeDotColor: AppColors.secondary),
              ),
            ),
          )
        ],
      ),
    );
  }
}
