import 'dart:math';

import '../components/components.dart';
import '../utils/utils.dart';
import 'package:charts_painter/chart.dart';
import 'package:flutter/material.dart';

class Measure {
  final DateTime date;
  final int value;

  Measure({this.date, this.value});
}

class MyTrendsPage extends StatelessWidget {
  static String pageName = 'my-trends-page';

  var measures = [
    Measure(date: DateTime.now(), value: Random().nextInt(169)),
    Measure(
        date: DateTime.now().subtract(Duration(days: 1)),
        value: Random().nextInt(169)),
    Measure(
        date: DateTime.now().subtract(Duration(days: 1, minutes: 24)),
        value: Random().nextInt(169)),
    Measure(
        date: DateTime.now().subtract(Duration(days: 1, hours: 3)),
        value: Random().nextInt(169)),
    Measure(
        date: DateTime.now().subtract(Duration(days: 1, hours: 6)),
        value: Random().nextInt(169)),
    Measure(
        date: DateTime.now().subtract(Duration(days: 1, hours: 9)),
        value: Random().nextInt(169)),
    Measure(
        date: DateTime.now().subtract(Duration(days: 1, hours: 12)),
        value: Random().nextInt(169)),
    Measure(
        date: DateTime.now().subtract(Duration(days: 1, hours: 15)),
        value: Random().nextInt(169)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.grey[50],
      //   elevation: 0,
      //   title: Text(
      //     'My Trends',
      //     style: TextStyle(color: Colors.grey),
      //   ),
      //   centerTitle: true,
      //   leading: IconButton(
      //     icon: Icon(
      //       Icons.arrow_back,
      //       color: AppColors.blue,
      //     ),
      //     onPressed: () => Navigator.pop(context),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: AppColors.blue,
                    ),
                    onPressed: () => Navigator.pop(context),
                  ),
                  Text(
                    'My Trends',
                    style: TextStyle(color: Colors.grey),
                  )
                ],
              ),
              Container(
                color: Colors.amberAccent,
                height: MediaQuery.of(context).size.height * .25,
              ),
              SizedBox(
                height: 20,
              ),
              // Container(
              //   height: 1000,
              //   child: ListView.builder(
              //     itemCount: measures.length + 1,
              //     physics: NeverScrollableScrollPhysics(),
              //     itemBuilder: (context, index) {
              //       if (index == 0) {
              //         return ListTile(
              //           contentPadding:
              //               EdgeInsets.symmetric(vertical: 6, horizontal: 30),
              //           title: Row(
              //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //             children: [Text('Date'), Text('Time')],
              //           ),
              //           leading: Text('Nr'),
              //           trailing: Text('Syst'),
              //         );
              //       }
              //       Measure measure = measures[index - 1];
              //       return MeasureCard(
              //         date: measure.date,
              //         value: measure.value,
              //         index: index,
              //       );
              //     },
              //   ),
              // ),
              Container(
                height: 900,
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 6, horizontal: 30),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [Text('Date'), Text('Time')],
                      ),
                      leading: Text('Nr'),
                      trailing: Text('Syst'),
                    ),
                    MeasureCard(date: DateTime.now()),
                    MeasureCard(date: DateTime.now()),
                    Container(
                      height: 60,
                      color: Colors.deepPurple,
                    ),
                    MeasureCard(date: DateTime.now()),
                    Card(
                      margin: EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      color: Colors.grey[200],
                      elevation: 0,
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 30),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [Text('20/04/2021'), Text('10:17')],
                        ),
                        leading: Text('1'),
                        trailing: Text('128'),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      color: Colors.grey[200],
                      elevation: 0,
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 30),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [Text('20/04/2021'), Text('10:17')],
                        ),
                        leading: Text('1'),
                        trailing: Text('128'),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      color: Colors.grey[200],
                      elevation: 0,
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 30),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [Text('20/04/2021'), Text('10:17')],
                        ),
                        leading: Text('1'),
                        trailing: Text('128'),
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.all(8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                      ),
                      color: Colors.grey[200],
                      elevation: 0,
                      child: ListTile(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 6, horizontal: 30),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [Text('20/04/2021'), Text('10:17')],
                        ),
                        leading: Text('1'),
                        trailing: Text('128'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}