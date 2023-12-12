import 'package:flutter/material.dart';
import 'dart:math';
import 'package:charts_flutter/flutter.dart' as charts;

class CandleChart extends StatefulWidget {
  CandleChart() : super();

  @override
  CandleChartState createState() => CandleChartState();
}

class CandleChartState extends State<CandleChart> {
  late List<charts.Series<Sales, String>> seriesList;

  static List<charts.Series<Sales, String>> _createRandomData() {
    final random = Random();

    final dayOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thur', 'Fri'];

    List<Sales> generateSalesData(String year) {
      return dayOfWeek.map((day) {
        return Sales(year, random.nextInt(180), day);
      }).toList();
    }

    final desktopSalesData = generateSalesData('Desktop');
    final tabletSalesData = generateSalesData('Tablet');

    return [
      charts.Series<Sales, String>(
        id: 'Desktop',
        domainFn: (Sales sales, _) => sales.dayOfWeek,
        measureFn: (Sales sales, _) => sales.sales,
        data: desktopSalesData,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color(0xffC2A3FC)),
      ),
      charts.Series<Sales, String>(
        id: 'Tablet',
        domainFn: (Sales sales, _) => sales.dayOfWeek,
        measureFn: (Sales sales, _) => sales.sales,
        data: tabletSalesData,
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Color(0xff8B4CFC)),
      ),
    ];
  }

  barChart() {
    return charts.BarChart(
      seriesList,
      animate: true,
      vertical: true,
      barGroupingType: charts.BarGroupingType.grouped,
      defaultRenderer: charts.BarRendererConfig(
        groupingType: charts.BarGroupingType.grouped,
        strokeWidthPx: 1.0,
      ),
      domainAxis: charts.OrdinalAxisSpec(
        renderSpec: charts.SmallTickRendererSpec(
          labelRotation: 0,
        ),
      ),
      primaryMeasureAxis: charts.NumericAxisSpec(
        showAxisLine: false,
        tickProviderSpec: charts.BasicNumericTickProviderSpec(
          desiredTickCount: 5,
        ),
      ),
      barRendererDecorator: charts.BarLabelDecorator<String>(
        labelPosition: charts.BarLabelPosition.inside,
        insideLabelStyleSpec: charts.TextStyleSpec(
          color: charts.ColorUtil.fromDartColor(Colors.white),
        ),
        outsideLabelStyleSpec: charts.TextStyleSpec(
          color: charts.ColorUtil.fromDartColor(Colors.black),
        ),
        // outsideLabelSymbolRenderer: charts.CircleSymbolRenderer(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    seriesList = _createRandomData();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                'Number of Patients',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Color(0xff000000),
                ),
              ),
            ),
            SizedBox(width: 46,),
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                color: Color(0xffC2A3FC),
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 7,),
            Text(
              'New Patients',
              style: TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w400,
                color: Color(0xff868686),
              ),
            ),
            SizedBox(width: 6),
            Container(
              height: 8,
              width: 8,
              decoration: BoxDecoration(
                color: Color(0xff8B4CFC),
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 7),
            Text('Old Patient',style: TextStyle(fontSize: 8,fontWeight: FontWeight.w400,color: Color(0xff868686)),),
          ],
        ),
        SizedBox(height: 30,),
        SizedBox(width:241,height:110,child: barChart(),),

      ],
    );
  }
}


class Sales {
  final String year;
  final String dayOfWeek;
  final int sales;

  Sales(this.year, this.sales, this.dayOfWeek);
}
