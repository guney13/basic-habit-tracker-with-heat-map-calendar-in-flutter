

import 'package:habit_tracker/models/habit.dart';

bool isHabitCompletedToday(List<DateTime> completedDays) {
  final today = DateTime.now();
  return completedDays.any( 
    (elem) => 
      elem.year == today.year &&
      elem.month == today.month &&
      elem.day == today.day
  );
}

// prepare heatmap dataset
Map<DateTime, int> prepHeatDataset(List<Habit> habits) {
  Map<DateTime, int> dataset = {};
  
  for (var habit in habits) {
    for (var date in habit.completedDays) {
      // normalization to avoid time mismatch
      final normalizedDate = DateTime(date.year, date.month, date.day);

      if (dataset.containsKey(normalizedDate)) {
        dataset[normalizedDate] = dataset[normalizedDate]! + 1;
      } else {
        dataset[normalizedDate] = 1;
      }
    }
  }

  return dataset;
}