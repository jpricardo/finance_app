import 'package:finance_app/models/activity_chart_data_model.dart';
import 'package:flutter/material.dart';
import 'package:material_charts/material_charts.dart';

class ActivityChart extends StatefulWidget {
  const ActivityChart({super.key});

  @override
  State<StatefulWidget> createState() => _ActivityChartState();
}

class _ActivityChartState extends State<ActivityChart> {
  List<ActivityChartDataModel>? incomes;
  List<ActivityChartDataModel>? expenses;
  ActivityRange? selectedRange = ActivityRange.lastYear;
  final TextEditingController dropdownController = TextEditingController();

  AreaChartData modelToData(ActivityChartDataModel model) {
    return AreaChartData(value: model.value, label: model.label);
  }

  void setRange(ActivityRange? range) {
    setState(() {
      selectedRange = range;
    });
  }

  @override
  Widget build(BuildContext context) {
    incomes = ActivityChartDataModel.getIncomes();
    expenses = ActivityChartDataModel.getExpenses();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        DropdownMenu<ActivityRange>(
          width: 175,
          initialSelection: ActivityRange.lastYear,
          controller: dropdownController,
          enableSearch: false,
          requestFocusOnTap: false,

          textStyle: TextStyle(
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
          inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(borderSide: BorderSide.none),
          ),

          onSelected: (value) => setRange(value),
          dropdownMenuEntries: ActivityRange.values.map((range) {
            return DropdownMenuEntry<ActivityRange>(
              value: range,
              label: range.label,
            );
          }).toList(),
        ),

        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              child: MaterialAreaChart(
                width: MediaQuery.of(context).size.width,
                height: 200,
                style: AreaChartStyle(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                ),

                series: [
                  AreaChartSeries(
                    name: 'Income',
                    color: Theme.of(context).colorScheme.tertiary,
                    dataPoints: incomes?.map(modelToData).toList() ?? [],
                  ),

                  AreaChartSeries(
                    name: 'Expense',
                    color: Theme.of(context).colorScheme.error,
                    dataPoints: expenses?.map(modelToData).toList() ?? [],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
