import 'package:flutter/material.dart';
import 'package:meal_planner/core/utility/assets.dart';
import 'package:meal_planner/core/utility/styles.dart';

class VideoInstraction extends StatelessWidget {
  const VideoInstraction({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * .25,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: Offset(10, 10),
                    color: Colors.grey.withOpacity(0.4),
                    blurRadius: 40,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadiusGeometry.circular(16),
                child: Image.asset(AssetsData.home1, fit: BoxFit.cover),
              ),
            ),
            Positioned(
              bottom: 50,
              right: 150,
              left: 150,
              top: 50,
              child: Row(children: [GestureDetector(
                onTap: () {
                },
                child: Image.asset(AssetsData.video))]),
            ),
          ],
        ),
        SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text("Instructions", style: Styles.textStyleSemibold21),
        ),
        SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            """Preheat oven to 350° F. Spray a 9x13-inch baking pan with non-stick spray.
        Combine soy sauce, ½ cup water, brown sugar, ginger and garlic in a small saucepan and cover. Bring to a boil over medium heat. Remove lid and cook for one minute once boiling.
        
        Meanwhile, stir together the corn starch and 2 tablespoons of water in a separate dish until smooth. Once sauce is boiling, add mixture to the saucepan and stir to combine. Cook until the sauce starts to thicken then remove from heat.
        
        Place the chicken breasts in the prepared pan. Pour one cup of the sauce over top of chicken. Place chicken in oven and bake 35 minutes or until cooked through. Remove from oven and shred chicken in the dish using two forks.
        
        *Meanwhile, steam or cook the vegetables according to package directions.
        
        Add the cooked vegetables and rice to the casserole dish with the chicken. Add most of the remaining sauce, reserving a bit to drizzle over the top when serving. Gently toss everything together in the casserole dish until combined. Return to oven and cook 15 minutes. Remove from oven and let stand 5 minutes before serving. Drizzle each serving with remaining sauce. Enjoy!""",
            style: Styles.textStyleregular15,
          ),
        ),
      ],
    );
  }
}
