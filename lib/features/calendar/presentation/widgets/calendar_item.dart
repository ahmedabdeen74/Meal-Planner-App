import 'package:flutter/material.dart';
import 'package:meal_planner/core/utility/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:meal_planner/features/calendar/data/models/calendar_meal.dart';

class CalendarItem extends StatelessWidget {
  final DateTime date;
  final List<CalendarMeal> mealsForDate;
  final Function(CalendarMeal)? onDeleteMeal;

  const CalendarItem({
    super.key,
    required this.date,
    required this.mealsForDate,
    this.onDeleteMeal,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // عرض التاريخ واليوم
        _buildDateHeader(),
        const SizedBox(height: 16),
        // عرض جميع الوجبات لهذا التاريخ
        ...mealsForDate.map((calendarMeal) => _buildMealCard(context, calendarMeal)),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _buildDateHeader() {
    final isToday = _isToday(date);
    
    return Row(
      children: [
        Text(
          _getFormattedDate(date),
          style: isToday 
              ? Styles.textStyleSemibold21.copyWith(color: Colors.orange)
              : Styles.textStyleSemibold21,
        ),
        const SizedBox(width: 8),
        Text(
          _getDayName(date),
          style: isToday
              ? Styles.textStyleLight21.copyWith(color: Colors.orange)
              : Styles.textStyleLight21,
        ),
        if (isToday) ...[
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.orange,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              "Today",
              style: TextStyle(
                color: Colors.white,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
        const Expanded(
          child: Divider(
            thickness: 0.5,
            color: Colors.grey,
            indent: 8,
            endIndent: 0,
          ),
        ),
      ],
    );
  }

  Widget _buildMealCard(BuildContext context, CalendarMeal calendarMeal) {
    final meal = calendarMeal.meal;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          // صورة الوجبة
          ClipOval(
            child: meal.strMealThumb != null && meal.strMealThumb!.isNotEmpty
                ? CachedNetworkImage(
                    imageUrl: meal.strMealThumb!,
                    height: 75,
                    width: 75,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      height: 75,
                      width: 75,
                      color: Colors.grey[200],
                      child: const Center(
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    ),
                    errorWidget: (context, url, error) => Container(
                      height: 75,
                      width: 75,
                      color: Colors.grey[200],
                      child: const Icon(Icons.restaurant, color: Colors.grey),
                    ),
                  )
                : Container(
                    height: 75,
                    width: 75,
                    color: Colors.grey[200],
                    child: const Icon(Icons.restaurant, color: Colors.grey),
                  ),
          ),
          const SizedBox(width: 32),
          // معلومات الوجبة
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  meal.strCategory ?? "Main Course",
                  style: Styles.textStyleMedium10.copyWith(
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  meal.strMeal ?? "Unknown Meal",
                  style: Styles.textStyleRegular18,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  "${_getIngredientsCount(meal)} Ingredients",
                  style: Styles.textStyleLight13,
                ),
              ],
            ),
          ),
          // زر الحذف
          if (onDeleteMeal != null)
            IconButton(
              onPressed: () => _showDeleteConfirmation(context, calendarMeal),
              icon: const Icon(
                Icons.delete_outline,
                color: Colors.red,
                size: 24,
              ),
            ),
        ],
      ),
    );
  }

  void _showDeleteConfirmation(BuildContext context, CalendarMeal calendarMeal) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Remove Meal"),
        content: Text("Are you sure you want to remove \"${calendarMeal.meal.strMeal}\" from your calendar?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              onDeleteMeal?.call(calendarMeal);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text("Remove"),
          ),
        ],
      ),
    );
  }

  String _getFormattedDate(DateTime date) {
    final months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return '${months[date.month - 1]} ${date.day}';
  }

  String _getDayName(DateTime date) {
    final days = [
      'Monday', 'Tuesday', 'Wednesday', 'Thursday',
      'Friday', 'Saturday', 'Sunday'
    ];
    return days[date.weekday - 1];
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return date.year == now.year &&
           date.month == now.month &&
           date.day == now.day;
  }

  int _getIngredientsCount(meal) {
    int count = 0;
    // عد المكونات غير الفارغة
    for (int i = 1; i <= 20; i++) {
      final ingredient = meal.toJson()['strIngredient$i'];
      if (ingredient != null && ingredient.toString().trim().isNotEmpty) {
        count++;
      }
    }
    return count;
  }
}