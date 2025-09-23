enum ActivityRange {
  lastYear('Last year', 1),
  lastSemester('Last semester', 2),
  allTime('All time', 3);

  const ActivityRange(this.label, this.value);
  final String label;
  final int value;
}

class ActivityChartDataModel {
  String label;
  double value;

  ActivityChartDataModel({required this.label, required this.value});

  static getIncomes() {
    final List<ActivityChartDataModel> items = [];

    // Mock data
    // TODO - get data from an API or storage
    items.add(ActivityChartDataModel(value: 3000, label: 'Jan'));
    items.add(ActivityChartDataModel(value: 3250, label: 'Fev'));
    items.add(ActivityChartDataModel(value: 2950, label: 'Mar'));
    items.add(ActivityChartDataModel(value: 4000, label: 'Apr'));
    items.add(ActivityChartDataModel(value: 3500, label: 'May'));
    items.add(ActivityChartDataModel(value: 3800, label: 'Jun'));
    items.add(ActivityChartDataModel(value: 3500, label: 'Jul'));
    items.add(ActivityChartDataModel(value: 3500, label: 'Aug'));
    items.add(ActivityChartDataModel(value: 3000, label: 'Sep'));
    items.add(ActivityChartDataModel(value: 4200, label: 'Out'));
    items.add(ActivityChartDataModel(value: 3500, label: 'Nov'));
    items.add(ActivityChartDataModel(value: 3500, label: 'Dec'));

    return items;
  }

  static getExpenses() {
    final List<ActivityChartDataModel> items = [];

    // Mock data
    // TODO - get data from an API or storage
    items.add(ActivityChartDataModel(value: 2500, label: 'Jan'));
    items.add(ActivityChartDataModel(value: 300, label: 'Fev'));
    items.add(ActivityChartDataModel(value: 2800, label: 'Mar'));
    items.add(ActivityChartDataModel(value: 4000, label: 'Apr'));
    items.add(ActivityChartDataModel(value: 3000, label: 'May'));
    items.add(ActivityChartDataModel(value: 3000, label: 'Jun'));
    items.add(ActivityChartDataModel(value: 3000, label: 'Jul'));
    items.add(ActivityChartDataModel(value: 3200, label: 'Aug'));
    items.add(ActivityChartDataModel(value: 1500, label: 'Sep'));
    items.add(ActivityChartDataModel(value: 3500, label: 'Out'));
    items.add(ActivityChartDataModel(value: 3000, label: 'Nov'));
    items.add(ActivityChartDataModel(value: 2800, label: 'Dec'));

    return items;
  }
}
