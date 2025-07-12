import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:meal_planner/core/utility/assets.dart';
import 'package:meal_planner/core/utility/styles.dart';

class CustomCardSwiper extends StatefulWidget {
  const CustomCardSwiper({super.key});

  @override
  State<CustomCardSwiper> createState() => _CardSwiperExampleState();
}

class _CardSwiperExampleState extends State<CustomCardSwiper> {
  final List<Map<String, String>> meals = [
    {
      "image": AssetsData.home1,
      "title": "Italian",
      "category": "Spicy Arrabiata Penne",
    },
    {
      "image": AssetsData.home2,
      "title": "French",
      "category": "Spicy Arrabiata Penne",
    },
    {
      "image": AssetsData.home1,
      "title": "Egyptian",
      "category": "Spicy Arrabiata Penne",
    },
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final double cardWidth = MediaQuery.of(context).size.width * 0.8;
    final double cardHeight = MediaQuery.of(context).size.height * 0.48;

    return Center(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Swiper(
            itemCount: meals.length,
            layout: SwiperLayout.STACK,
            itemWidth: cardWidth,
            itemHeight: cardHeight,
            onIndexChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      meals[index]["image"]!,
                      fit: BoxFit.cover,
                      width: cardWidth,
                      height: cardHeight,
                    ),
                  ),
                  if (index == currentIndex)
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: const Color(0xff7C7C7C).withOpacity(0.5),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              meals[index]["category"]!,
                              style: Styles.textStyleSemibold13.copyWith(),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              meals[index]["title"]!,
                              style: Styles.textStyleLight12.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}