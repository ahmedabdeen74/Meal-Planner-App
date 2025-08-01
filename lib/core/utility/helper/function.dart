import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveMealToHistory(String mealName) async {
  final prefs = await SharedPreferences.getInstance();
  final key = 'recentSearch';

  // نجيب القائمة الحالية
  List<String> meals = prefs.getStringList(key) ?? [];

  // لو موجودة بالفعل نحذفها عشان نعيد ترتيبها (ونمنع التكرار)
  meals.removeWhere((item) => item.trim().toLowerCase() == mealName.trim().toLowerCase());

  // نضيفها في أول القائمة
  meals.insert(0, mealName.trim());

  // نحتفظ بآخر 10 عناصر فقط
  if (meals.length > 10) {
    meals = meals.sublist(0, 10);
  }

  // نخزنها
  await prefs.setStringList(key, meals);
}
