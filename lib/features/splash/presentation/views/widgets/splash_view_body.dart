import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_planner/constants.dart';
import 'package:meal_planner/core/utility/app_router.dart';
import 'package:meal_planner/core/utility/assets.dart';
import 'package:meal_planner/core/utility/styles.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
   Future.delayed(Duration(seconds: 5), () {
      // use replace not go or push to prevent user to back to splash again.
      if (mounted) {
        GoRouter.of(context).replace(AppRouter.kHomeView);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Stack(
      children: [
        Positioned.fill(
          child: Image.asset(AssetsData.splash, fit: BoxFit.cover),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                AssetsData.burger,
                height: height * 0.6,
                width: width * 0.6,
              ),
            ),
            SizedBox(height: 8),
            Text("Plateful", style: Styles.textStyle61),
            FittedBox(
              child: Text(
                "M E A L    P L A N N E R",
                style: Styles.textStyleMedium14.copyWith(
                  color: kSecondaryColor,
                ),
              ),
            ),
            SizedBox(height: 32),
            FittedBox(
              child: Text(
                "Your meal planning,",
                style: Styles.textStyleRegular18.copyWith(
                  color: Color(0xE5FFFFFF),
                ),
              ),
            ),
            FittedBox(
              child: Text(
                "served on a full plate.",
                style: Styles.textStyleRegular18.copyWith(
                  color: Color(0xE5FFFFFF),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
