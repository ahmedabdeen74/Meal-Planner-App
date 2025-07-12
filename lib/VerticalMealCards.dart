

/*
import 'package:flutter/material.dart';
import 'package:meal_planner/core/utility/assets.dart';

class StackedSwipeCards extends StatefulWidget {
  @override
  _StackedSwipeCardsState createState() => _StackedSwipeCardsState();
}

class _StackedSwipeCardsState extends State<StackedSwipeCards> {
  final PageController _controller = PageController();
  final List<Map<String, String>> cards = [

      {
        "image":AssetsData.home2,
        "category": "Spicy Arrabiata Penne",
        "country": "Italian"
      },
      {
        "image": AssetsData.home1,
        "category": "Chicken Biryani",
        "country": "Indian"
      },
      {
        "image": AssetsData.mealDetails1,
        "category": "Beef Tacos",
        "country": "Mexican"
      },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 500,
          width: 350,
          child: Stack(
            alignment: Alignment.center,
            children: List.generate(cards.length, (index) {
              return Positioned(
                top: index * 10, // يخلي الكروت باينه ورا بعض
                child: Draggable(
                  axis: Axis.horizontal,
                  onDragEnd: (details) {
                    if (details.offset.dx < -100) {
                      setState(() {
                        final removedCard = cards.removeAt(0);
                        cards.add(removedCard);
                      });
                    }
                  },
                  childWhenDragging: Container(),
                  feedback: buildCard(cards[index]),
                  child: buildCard(cards[index]),
                ),
              );
            }).reversed.toList(), // نعرض من آخر كارت لأول كارت
          ),
        ),
      ),
    );
  }

  Widget buildCard(Map<String, String> data) {
    return Container(
      width: 320,
      height: 480,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black26)],
        image: DecorationImage(
          image: AssetImage(data['image']!),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(data['category']!,
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              Text(data['country']!,
                  style: TextStyle(color: Colors.white70, fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
*/
