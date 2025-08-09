import 'package:hive/hive.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal.dart';

part 'calendar_meal.g.dart';

@HiveType(typeId: 2) 
class CalendarMeal extends HiveObject {
  @HiveField(0)
  final Meal meal;

  @HiveField(1)
  final DateTime scheduledDate;

  @HiveField(2)
  final String id; // لتجنب التكرار

  CalendarMeal({
    required this.meal,
    required this.scheduledDate,
    required this.id,
  });

  // Helper method to get formatted date string
  String get formattedDate {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${months[scheduledDate.month - 1]} ${scheduledDate.day}';
  }

  // Helper method to get day name
  String get dayName {
    final days = [
      'Monday', 'Tuesday', 'Wednesday', 'Thursday',
      'Friday', 'Saturday', 'Sunday'
    ];
    return days[scheduledDate.weekday - 1];
  }

  // Helper method to check if date is today
  bool get isToday {
    final now = DateTime.now();
    return scheduledDate.year == now.year &&
           scheduledDate.month == now.month &&
           scheduledDate.day == now.day;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is CalendarMeal && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}