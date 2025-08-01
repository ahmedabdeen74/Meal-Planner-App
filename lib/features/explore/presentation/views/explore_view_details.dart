import 'package:flutter/material.dart';
import 'package:meal_planner/features/explore/presentation/views/widgets/explore_view_details_body.dart';

class ExploreViewDetails extends StatelessWidget {
  const ExploreViewDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: ExploreViewDetailsBody()));
  }
}
