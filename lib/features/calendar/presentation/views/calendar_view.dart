import 'package:flutter/material.dart';
import 'package:meal_planner/features/calendar/presentation/widgets/calendar_view_body.dart';

class CalendarView extends StatelessWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: CalendarViewBody(),
      ),
    );
  }
}
