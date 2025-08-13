// ---------------- WATER CHART ----------------
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WaterIntakeChart extends StatelessWidget {
  final bool small;
  final List<WaterData> waterData;
  const WaterIntakeChart({
    super.key,
    this.small = false,
    required this.waterData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [Colors.blueAccent, Colors.lightBlue.shade200],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: EdgeInsets.all(small ? 8 : 16),
      child: Column(
        children: [
          Text(
            "Water Intake",
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
              primaryXAxis: CategoryAxis(),
              series: <CartesianSeries>[
                ColumnSeries<WaterData, String>(
                  dataSource: waterData,
                  xValueMapper: (WaterData data, _) => data.time,
                  yValueMapper: (WaterData data, _) => data.amount,
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class WaterData {
  final String time;
  final int amount;
  WaterData(this.time, this.amount);
}
