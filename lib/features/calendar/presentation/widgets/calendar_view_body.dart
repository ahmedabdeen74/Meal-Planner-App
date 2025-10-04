import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planner/core/utility/styles.dart';
import 'package:meal_planner/features/calendar/data/local/calendar/calendar_cubit.dart';
import 'package:meal_planner/features/calendar/data/local/calendar/calendar_state.dart';
import 'package:meal_planner/features/calendar/presentation/widgets/calendar_item.dart';

class CalendarViewBody extends StatelessWidget {
  const CalendarViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: BlocBuilder<CalendarCubit, CalendarState>(
        builder: (context, state) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Text("Upcoming Meals", style: Styles.textStyleBold24),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 32)),

              // عرض محتوى التقويم حسب الحالة
              if (state is CalendarLoading)
                const SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(32),
                      child: CircularProgressIndicator(),
                    ),
                  ),
                )
              else if (state is CalendarFailure)
                SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(32),
                      child: Column(
                        children: [
                          const Icon(
                            Icons.error_outline,
                            size: 64,
                            color: Colors.red,
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "Error loading meals",
                            style: Styles.textStyleRegular18,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            state.errorMessage,
                            style: Styles.textStyleLight13,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 16),
                          ElevatedButton(
                            onPressed: () {
                              context.read<CalendarCubit>().refreshCalendar();
                            },
                            child: const Text("Retry"),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              else if (state is CalendarLoaded ||
                  state is CalendarMealAdded ||
                  state is CalendarMealRemoved)
                _buildCalendarContent(context, state)
              else
                const SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(32),
                      child: Text(
                        "No meals scheduled yet",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildCalendarContent(BuildContext context, CalendarState state) {
    final calendarCubit = context.read<CalendarCubit>();
    final groupedMeals = calendarCubit.getMealsGroupedByDate();

    if (groupedMeals.isEmpty) {
      return SliverToBoxAdapter(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              children: [
                Icon(
                  Icons.calendar_today_outlined,
                  size: 64,
                  color: Colors.grey[400],
                ),
                const SizedBox(height: 16),
                Text(
                  "No meals scheduled",
                  style: Styles.textStyleRegular18.copyWith(
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "Add meals to your calendar from meal details",
                  style: Styles.textStyleLight13.copyWith(
                    color: Colors.grey[500],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      );
    }

    // ترتيب التواريخ (الأقرب أولاً)
    final sortedDates = groupedMeals.keys.toList()
      ..sort((a, b) => a.compareTo(b));

    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final date = sortedDates[index];
        final mealsForDate = groupedMeals[date]!;

        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: CalendarItem(
            date: date,
            mealsForDate: mealsForDate,
            onDeleteMeal: (calendarMeal) {
              calendarCubit.removeMealFromCalendar(calendarMeal);
            },
          ),
        );
      }, childCount: sortedDates.length),
    );
  }
}
