


import 'package:flutter/material.dart';
import 'package:habit_tracker/models/app_settings.dart';
import 'package:habit_tracker/models/habit.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class HabitDatabase extends ChangeNotifier {
  static late Isar isar;

  /*
    Setup
  */

  // initialize - database
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [HabitSchema, AppSettingsSchema],
      directory: dir.path
    );
  }
  
  // save first date of app startup (for heatmap)
  Future<void> saveFirstLaunchDate() async {
    final existingSettings = await isar.appSettings.where().findFirst();
    if (existingSettings == null) {
      final settings = 
        AppSettings()
          ..firstLaunchDate = DateTime.now();

      await isar.writeTxn(() => isar.appSettings.put(settings));
    }
  }

  // get first date of app startup (for heatmap)
  Future<DateTime?> getFirstLaunchDate() async {
    final settings = await isar.appSettings.where().findFirst();
    return settings?.firstLaunchDate;
  }


  /*
    CRUD operations
  */

  // list of habits
  final List<Habit> currentHabits = [];

  // create - add a new habit
  Future<void> addHabit(String habitName) async { 
    // create a new habit
    final newHabit = Habit()..name = habitName;

    // save to db
    await isar.writeTxn(() => isar.habits.put(newHabit));

    // re-read from db to currentNotes
    readHabits();
  }

  // read - read saved habits from db
  Future<void> readHabits() async {
    // fetch all habits from db to currentHabits
    List<Habit> fetchedHabits = await isar.habits.where().findAll();
    currentHabits.clear();
    currentHabits.addAll(fetchedHabits);
    notifyListeners(); 
  }

  // update - check habit on and off
  Future<void> updateHabitCompletion(int id, bool isCompleted) async {
    // find the specific habit
    final habit = await isar.habits.get(id);

    // update completion status
    if (habit != null) {
      await isar.writeTxn(() async {
        // if habit is completed -> add the current date to the completedDays List
        if (isCompleted && !habit.completedDays.contains(DateTime.now())) {
          final today = DateTime.now();

          habit.completedDays.add(
            DateTime(
              today.year,
              today.month,
              today.day,
            )
          );
        }
        // if habit is not completed -> remove the current date from the List
        else {
          final today = DateTime.now();
          habit.completedDays.removeWhere(
            (date) => 
              date.year == today.year &&
              date.month == today.month &&
              date.day == today.day,
          );
        }

        await isar.habits.put(habit);
      });
    }

    // re-read from db
    readHabits();
  }

  // update - edit habit name
  Future<void> updateHabitName(int id, String newName) async {
    // find the specific habit
    final habit = await isar.habits.get(id);
    if (habit == null) return;

    await isar.writeTxn(() async {
      habit.name = newName;
      // .put will replace if there is an object with the same id
      await isar.habits.put(habit);
    });
    
    // re-read from db
    readHabits();
  }

  // delete - delete habit
  Future<void> deleteHabit(int id) async {
    await isar.writeTxn(() async {
      await isar.habits.delete(id);
    });

    readHabits();
  }
}