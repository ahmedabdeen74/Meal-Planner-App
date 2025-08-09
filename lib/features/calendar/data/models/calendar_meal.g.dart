// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_meal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CalendarMealAdapter extends TypeAdapter<CalendarMeal> {
  @override
  final int typeId = 2;

  @override
  CalendarMeal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CalendarMeal(
      meal: fields[0] as Meal,
      scheduledDate: fields[1] as DateTime,
      id: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CalendarMeal obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.meal)
      ..writeByte(1)
      ..write(obj.scheduledDate)
      ..writeByte(2)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CalendarMealAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
