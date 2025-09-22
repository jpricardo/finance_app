enum ActivityType { income, expense }

class ActivityModel {
  double value;
  ActivityType type;
  DateTime date;

  ActivityModel({required this.value, required this.type, required this.date});

  static get recentActivity {
    List<ActivityModel> activities = [];

    final now = DateTime.now();

    // Mock data
    // TODO - get data from an API or storage
    activities.add(
      ActivityModel(value: 15, type: ActivityType.expense, date: now),
    );
    activities.add(
      ActivityModel(value: 120, type: ActivityType.expense, date: now),
    );
    activities.add(
      ActivityModel(value: 50, type: ActivityType.income, date: now),
    );
    activities.add(
      ActivityModel(value: 20, type: ActivityType.expense, date: now),
    );
    activities.add(
      ActivityModel(value: 5000, type: ActivityType.income, date: now),
    );

    return activities;
  }
}
