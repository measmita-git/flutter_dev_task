import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GenderBarGraph extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/gender.svg'),
                  SizedBox(width: 6,),
                  Text('Gender',style: TextStyle(fontSize: 12,fontWeight: FontWeight.w400,color: Color(0xff000000)),),

                ],
              ),
              AspectRatio(
                aspectRatio: 2,
                child: LineChart(
                  LineChartData(
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(5, 0),
                            FlSpot(10, 30),
                            FlSpot(15, 80),
                            FlSpot(20, 60),
                            FlSpot(25, 160),
                            FlSpot(30, 200),
                          ],
                          isCurved: true,
                          belowBarData: BarAreaData(
                            show: false,
                            gradient: LinearGradient(
                              colors: [Color(0xff8B4CFC), Color(0xffFFFFFF)],
                            ),
                          ),
                          dotData: FlDotData(
                            show: false,
                          ),
                        ),
                      ],
                      borderData: FlBorderData(
                        show: false,

                      ),
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(
                          leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)), // Hide left axis titles

                        bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
                        rightTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                        topTitles: AxisTitles(
                            sideTitles: SideTitles(showTitles: false)),
                      )),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

