import 'package:finance_app/components/custom_card.dart';
import 'package:finance_app/models/activity_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:material_charts/material_charts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surface,
        title: Row(
          spacing: 8,
          children: [
            Icon(Icons.person),
            Text('Hello, USER!', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.directional(
          top: 12,
          end: 24,
          bottom: 12,
          start: 24,
        ),

        child: Column(
          spacing: 16,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,

          children: <Widget>[
            Column(
              spacing: 16,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: <Widget>[
                _totalBalance(context),

                Row(
                  spacing: 8,

                  // runSpacing: 16,
                  children: [_totalIncome(context), _totalExpense(context)],
                ),
              ],
            ),

            _chart(context),

            RecentActivity(),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Add',
        child: const Icon(Icons.add),
      ),
    );
  }

  MaterialAreaChart _chart(BuildContext context) {
    return MaterialAreaChart(
      width: MediaQuery.of(context).size.width,
      height: 200,
      style: AreaChartStyle(
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),

      series: [
        AreaChartSeries(
          name: 'Income',
          color: Theme.of(context).colorScheme.tertiary,
          dataPoints: [
            AreaChartData(value: 3000, label: 'Jan'),
            AreaChartData(value: 3250, label: 'Fev'),
            AreaChartData(value: 2950, label: 'Mar'),
            AreaChartData(value: 4000, label: 'Apr'),
            AreaChartData(value: 3500, label: 'May'),
            AreaChartData(value: 3800, label: 'Jun'),
            AreaChartData(value: 3500, label: 'Jul'),
            AreaChartData(value: 3500, label: 'Aug'),
            AreaChartData(value: 3000, label: 'Sep'),
            AreaChartData(value: 4200, label: 'Out'),
            AreaChartData(value: 3500, label: 'Nov'),
            AreaChartData(value: 3500, label: 'Dec'),
          ],
        ),

        AreaChartSeries(
          name: 'Expense',
          color: Theme.of(context).colorScheme.error,
          dataPoints: [
            AreaChartData(value: 2500, label: 'Jan'),
            AreaChartData(value: 300, label: 'Fev'),
            AreaChartData(value: 2800, label: 'Mar'),
            AreaChartData(value: 4000, label: 'Apr'),
            AreaChartData(value: 3000, label: 'May'),
            AreaChartData(value: 3000, label: 'Jun'),
            AreaChartData(value: 3000, label: 'Jul'),
            AreaChartData(value: 3200, label: 'Aug'),
            AreaChartData(value: 1500, label: 'Sep'),
            AreaChartData(value: 3500, label: 'Out'),
            AreaChartData(value: 3000, label: 'Nov'),
            AreaChartData(value: 2800, label: 'Dec'),
          ],
        ),
      ],
    );
  }

  Widget _totalExpense(BuildContext context) {
    return Expanded(
      child: CustomCard(
        title: 'EXPENSES',
        icon: Icon(
          Icons.arrow_downward,
          color: Theme.of(context).colorScheme.error,
        ),

        children: [
          const Text(
            '\$13,370.96',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _totalIncome(BuildContext context) {
    return Expanded(
      child: CustomCard(
        title: 'INCOME',
        icon: Icon(
          Icons.arrow_upward,
          color: Theme.of(context).colorScheme.tertiary,
        ),

        children: [
          const Text(
            '\$13,370.96',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget _totalBalance(BuildContext context) {
    return CustomCard(
      title: 'TOTAL BALANCE',
      color: Theme.of(context).colorScheme.surface,

      children: [
        const Text(
          '\$13,370.96',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class RecentActivity extends StatelessWidget {
  RecentActivity({super.key});

  final List<ActivityModel> items = ActivityModel.recentActivity;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: 'Recent Activity',
      children: [
        Column(
          children: [
            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) => SizedBox(height: 4),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];

                return Padding(
                  padding: EdgeInsetsGeometry.directional(top: 8, bottom: 8),
                  child: Row(
                    spacing: 8,

                    children: [
                      item.type == ActivityType.income
                          ? Icon(
                              Icons.arrow_upward,
                              color: Theme.of(context).colorScheme.tertiary,
                              size: 20,
                            )
                          : Icon(
                              Icons.arrow_downward,
                              color: Theme.of(context).colorScheme.error,
                              size: 20,
                            ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 0,

                        children: [
                          Text(
                            '\$${item.value.toString()}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            DateFormat('MM/yyyy').format(item.date),
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(
                                context,
                              ).colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
