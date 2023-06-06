import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'individual_bar.dart';

class MyBarGraph extends StatelessWidget {
  final List monthlyEnergyGenerated;
  const MyBarGraph({super.key, required this.monthlyEnergyGenerated});

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      monthlyEnergyGenerated[0],
      
      monthlyEnergyGenerated[1],
      monthlyEnergyGenerated[2],
      monthlyEnergyGenerated[3],
      monthlyEnergyGenerated[4],
      monthlyEnergyGenerated[5],
      monthlyEnergyGenerated[6],
      monthlyEnergyGenerated[7],
      monthlyEnergyGenerated[8],
      monthlyEnergyGenerated[9],
      monthlyEnergyGenerated[10],
      monthlyEnergyGenerated[11],
    );

    myBarData.initializeBarData();
    return BarChart(
      BarChartData(
        minY: 0,
        maxY: 8,
        gridData: FlGridData(show: false),
        barGroups: myBarData.barData
            .map((data) => BarChartGroupData(x: data.x, barsSpace: 8, barRods: [
                  BarChartRodData(
                      toY: data.y,
                      color: const Color.fromARGB(255, 255, 114, 7),
                      width: 15,
                      borderRadius: BorderRadius.circular(5)),
                ]))
            .toList(),
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true)),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: getBottomText,
            ),
          ),
        ),
      ),
    );
  }
}

Widget getBottomText(double value, TitleMeta meta) {
  const TextStyle style = TextStyle(
    color: Colors.black,
    fontSize: 14,
  );

  late Widget text;
  switch (value.toInt()) {
    case 1:
      text = const Text('Jan', style: style);
      break;
    case 2:
      text = const Text('Feb', style: style);
      break;
    case 3:
      text = const Text('Mar', style: style);
      break;
    case 4:
      text = const Text('Apr', style: style);
      break;
    case 5:
      text = const Text('May', style: style);
      break;
    case 6:
      text = const Text('Jun', style: style);
      break;
    case 7:
      text = const Text('Jul', style: style);
      break;
    case 8:
      text = const Text('Aug', style: style);
      break;
    case 9:
      text = const Text('Sep', style: style);
      break;
    case 10:
      text = const Text('Oct', style: style);
      break;
    case 11:
      text = const Text('Nov', style: style);
      break;
    case 12:
      text = const Text('Dec', style: style);
      break;
  }

  return SideTitleWidget(axisSide: meta.axisSide, child: text);
}
