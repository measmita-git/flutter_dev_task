import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dev_task/model/candle_chart.dart';
import 'package:flutter_dev_task/model/curvy_bar_graph.dart';
import 'package:flutter_dev_task/model/radial_chart.dart';
import 'package:flutter_dev_task/model/patient_chart.dart';
import 'package:flutter_dev_task/model/gender_bar_graph.dart';
import 'package:flutter_dev_task/model/performance_chart.dart';
import 'package:flutter_svg/svg.dart';

import 'Expanded_bottom/expanded_nav_bar.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, left: 21, right: 18, bottom: 20),
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Existing content goes here
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 50,
                                height: 50,
                                child: const CircleAvatar(
                                  backgroundImage: AssetImage('assets/asmita.jpg'),
                                ),
                              ),
                              const SizedBox(
                                width: 68,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 18.0),
                                child: Row(
                                  children: [
                                    SvgPicture.asset('assets/forward.svg'),
                                    SizedBox(width: 23,),
                                    Text(
                                      '02 Nov 2023',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff000000)),
                                    ),
                                    SizedBox(width: 23,),
                                    SvgPicture.asset('assets/backward.svg'),
                                  ],
                                ),
                              ),
                              Spacer(),

                              SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: SvgPicture.asset('assets/notification.svg')),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 17,
                        ),
                        const SizedBox(
                          width: 181,
                          height: 44,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Hi Dr Leonardo!',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xff000000),
                                ),
                              ),
                              Text(
                                'You have 4 appointments today.',
                                style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff868686)),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 22,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(Icons.search),
                              hintText: 'Search...'),
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                          width: 385,
                          height: 132,
                          child: Row(
                            children: [
                              Expanded(
                                child: SingleChildScrollView(
                                  child: Card(
                                    child: PatientChart(),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: SingleChildScrollView(
                                    child: Card(
                                      child:GenderBarGraph(),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Card(
                              child: SizedBox(
                                  width: 333, height: 217, child: CandleChart()),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 384,
                          height: 233,
                          child: Row(
                            children: [
                              Expanded(
                                child: Card(

                                  child: PerformanceChart(),
                                ),
                              ),
                              Expanded(
                                child: Card(
                                  child: RadialBarChart(),
                                ),
                              ),
                            ],
                          ),
                        ),

                        Column(
                          children: [
                            Card(
                              child: SizedBox(
                                  width: 333, height: 217, child: CurvyChart()),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),


              SizedBox(height:50,child: ExpandableNavbar()),
            ],
          ),
        ),
      ),
    );
  }
}
