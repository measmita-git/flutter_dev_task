import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_task/data/ft_chart_Data';
import 'package:flutter_dev_task/data/ft_data_model';
import 'package:flutter_svg/svg.dart';

class PatientChart extends StatelessWidget {
  PatientChart({super.key});

  List<DataModel> datas = [
    DataModel(
        ticker: "NABIL",
        name: "Nabil Bank",
        ltp: 2000.75,
        change: 34,
        percentage: 1.29),
    DataModel(
        ticker: "NABIL",
        name: "Nabil Bank Nepal Bangladesh Bank Limited",
        ltp: 2000.75,
        change: 34.5,
        percentage: -1.29),
    DataModel(
        ticker: "NABIL",
        name: "Nabil Bank",
        ltp: 2000.75,
        change: -34.5,
        percentage: 1.29),
    DataModel(
        ticker: "NABIL",
        name: "Nabil Bank",
        ltp: 2000.75,
        change: 34,
        percentage: 1.29),
    DataModel(
        ticker: "NABIL",
        name: "Nabil Bank",
        ltp: 2000.75,
        change: 34,
        percentage: 1.29),
    DataModel(
        ticker: "Nabil",
        name: "Nabil Bank Machhapuchre Nepal Bangladesh Bank Ltd",
        ltp: 2000.75,
        change: 34,
        percentage: 1.29),
    DataModel(
        ticker: "NABIL",
        name: "Nabil Bank",
        ltp: 2000.75,
        change: 34,
        percentage: 1.29),

    DataModel(
        ticker: "NABIL",
        name: "Nabil Bank",
        ltp: 2000.75,
        change: 34,
        percentage: 1.29),

  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 116,
      width: 200,
      child: Row(

        children: [
          Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset('assets/patient.svg'),
                  SizedBox(width: 10,),
                  Text('Patients'),

                ],
              ),
              SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.4,
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 14, bottom: 12, right: 27, left: 27),
                  child: LineChart(
                    LineChartData(
                      borderData: FlBorderData(show: false),
                      titlesData: FlTitlesData(show: false),
                      gridData: FlGridData(show: false),
                      lineTouchData: LineTouchData(
                          enabled: true,
                          touchTooltipData:
                          LineTouchTooltipData(getTooltipItems: null)),
                      lineBarsData: [
                        LineChartBarData(
                            spots: chartData.map((data) {
                              double x = chartData.indexOf(data).toDouble();
                              double y = double.parse('${data['value']}');
                              return FlSpot(x, y);
                            }).toList(),
                            isCurved: true,
                            dotData: FlDotData(show: false),
                            color: Colors.green,
                            belowBarData: BarAreaData(
                              show: false,

                          ),
                        ),

                      ],
                    ),
                  ),

                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  '+2% this week',

                  style: TextStyle(
                    fontSize: 8,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}


// ListView.builder(
// shrinkWrap: true,
// itemBuilder: (BuildContext context, int index) {
// return item(
// datas[index].ticker,
// datas[index].name,
// datas[index].ltp,
// datas[index].change,
// datas[index].percentage,
// context);
// },
// ),