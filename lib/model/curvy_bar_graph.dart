import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CurvyChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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
                        show: true,
                        gradient: LinearGradient(
                          colors: [Color(0xff8B4CFC), Color(0xffFFFFFF)],
                        ),
                      ),
                      dotData: FlDotData(
                        show: false,
                      ),
                      color: Color(0xffFFFFFF),
                    ),
                  ],
                  borderData: FlBorderData(
                    border: const Border(
                      bottom: BorderSide(),
                      left: BorderSide.none,
                    ),
                  ),
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(sideTitles: _bottomTitles),
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 0:
                              return Text('0',style: TextStyle(fontSize: 6,fontWeight: FontWeight.w400,color: Color(0xff494949)),);
                            case 50:
                              return Text('50',style: TextStyle(fontSize: 6,fontWeight: FontWeight.w400,color: Color(0xff494949)),);
                            case 100:
                              return Text('100',style: TextStyle(fontSize: 6,fontWeight: FontWeight.w400,color: Color(0xff494949)),);
                            case 150:
                              return Text('150',style: TextStyle(fontSize: 6,fontWeight: FontWeight.w400,color: Color(0xff494949)),);
                            case 200:
                              return Text('200',style: TextStyle(fontSize: 6,fontWeight: FontWeight.w400,color: Color(0xff494949)),);
                          }
                          return Text('');
                        },
                      ),
                    ),

                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

SideTitles get _bottomTitles => SideTitles(
      showTitles: true,
      getTitlesWidget: (value, meta) {
        String text = '';
        switch (value.toInt()) {
          case 5:
            text = 'Mon';
            break;
          case 10:
            text = 'Tue';
            break;
          case 15:
            text = 'Wed';
            break;
          case 20:
            text = 'Thur';
            break;
          case 25:
            text = 'Fri';
            break;
          case 30:
            text = 'Sun';
            break;
        }

        return Text(text,style: TextStyle(fontSize: 8,fontWeight: FontWeight.w400),);
      },
    );
