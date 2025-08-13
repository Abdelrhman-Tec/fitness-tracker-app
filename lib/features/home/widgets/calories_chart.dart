// ---------------- CALORIES CHART ----------------
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CaloriesChart extends StatelessWidget {
  final bool small;
  final List<CaloriesData> caloriesData;
  const CaloriesChart({
    super.key,
    this.small = false,
    required this.caloriesData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [Colors.orangeAccent, Colors.deepOrange.shade300],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: EdgeInsets.all(small ? 8 : 16),
      child: Column(
        children: [
          Text(
            "Calories",
            style: TextStyle(
              fontSize: small ? 14 : 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: small ? 140 : 220,
            child: SfCircularChart(
              backgroundColor: Colors.transparent,
              legend: Legend(
                isVisible: true,
                position: LegendPosition.bottom,
                textStyle: const TextStyle(color: Colors.white),
              ),
              series: <CircularSeries>[
                DoughnutSeries<CaloriesData, String>(
                  dataSource: caloriesData,
                  xValueMapper: (CaloriesData data, _) => data.label,
                  yValueMapper: (CaloriesData data, _) => data.value,
                  dataLabelSettings: const DataLabelSettings(
                    isVisible: true,
                    textStyle: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CaloriesData {
  final String label;
  final double value;
  CaloriesData(this.label, this.value);
}
