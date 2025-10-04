/*
abstract class AppFormats {
  // Date format: 2025-09-24
  final dateFormat = DateFormat('yyyy-MM-dd');

  // Time format: 03:45 PM
  final timeFormat = DateFormat('hh:mm a');

  // Static date format for server communication: 24-09-2025
  static final serverDateFormat = DateFormat('dd-MM-yyyy');
}
using for localizaion also
final now = DateTime.now();

// Using AppFormats
String formattedDate = AppFormats().dateFormat.format(now);
print(formattedDate); // 2025-09-24

String time = AppFormats().timeFormat.format(now);
print(time); // 03:45 PM

// Static usage
String serverDate = AppFormats.serverDateFormat.format(now);
print(serverDate); // 24-09-2025
*/