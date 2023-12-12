import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RadialBarChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SfCircularChart(
      series: <CircularSeries>[
        RadialBarSeries<ChartData, String>(
          dataSource: [
            ChartData('Ring 1', 200, 30, Color(0xFFC2A3FC), 'Depression'),
            ChartData('Ring 2', 240, 80, Colors.blue, 'Anxiety Disorder'),
            ChartData('Ring 3', 260, 100, Color(0xFFC2A3FC), 'Sleep Disorder'),
            ChartData('Ring 4', 280, 20, Colors.orange, 'Stress Management'),
            ChartData('Ring 5', 320, 140, Color(0xFFC2A3FC), 'Bipolar Disorder'),

          ],
          xValueMapper: (ChartData data, _) => data.category,
          yValueMapper: (ChartData data, _) => data.startValue,
          pointColorMapper: (ChartData data, _) => data.color,
          innerRadius: '60%',
          radius: '80%',
        ),
      ],
    );
  }
}

class ChartData {
  final String category;
  final double startValue;
  final double endValue;
  final Color color;
  final String disorderType;

  ChartData(this.category, this.startValue, this.endValue, this.color, this.disorderType);
}
