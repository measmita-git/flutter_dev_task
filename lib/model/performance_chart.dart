import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dev_task/data/ft_pie_chart_data';

class PerformanceChart extends StatelessWidget {
  const PerformanceChart({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 217,
      width: 200,
      child: Column(
          children: <Widget>[

            AspectRatio(
              aspectRatio: 1,
              child: PieChart(
                PieChartData(
                  centerSpaceRadius: 20,
                  sectionsSpace: 0,
                  startDegreeOffset: 40,
                  sections: getSections(),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildLegendItem("Good", Color(0xFF8B4CFC)),
                        _buildLegendItem("Okay", Color(0xFFC2A3FC)),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildLegendItem("Bad", Color(0xFFDFD2FE)),
                        _buildLegendItem("Perfect", Color(0xFFF4EEFF)),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
    );
  }
}

Widget _buildLegendItem(String label, Color color) {
  return Row(
    children: [
      CircleAvatar(
        radius: 6,
        backgroundColor: color,
      ),
      SizedBox(width: 8),
      Text(
        label,
        style: TextStyle(
            fontWeight: FontWeight.w400, fontSize: 8, color: Color(0xff868686)),
      ),
    ],
  );
}
