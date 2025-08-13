// ---------------- SLEEP CHART ----------------
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class SleepChart extends StatelessWidget {
  final bool small;
  final List<SleepData> sleepData;
  const SleepChart({super.key, this.small = false, required this.sleepData});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [Colors.purpleAccent, Colors.deepPurple.shade300],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: EdgeInsets.all(small ? 8 : 16),
      child: Column(
        children: [
          Text(
            "Sleep",
            style: TextStyle(
              fontSize: small ? 14 : 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: small ? 120 : 200,
            child: SfCartesianChart(
              backgroundColor: Colors.transparent,
              primaryXAxis: NumericAxis(isVisible: false),
              series: <CartesianSeries>[
                SplineSeries<SleepData, double>(
                  dataSource: sleepData,
                  xValueMapper: (SleepData data, _) => data.day,
                  yValueMapper: (SleepData data, _) => data.hours,
                  color: Colors.white,
                  width: 3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SleepData {
  final double day;
  final double hours;
  SleepData(this.day, this.hours);
}
