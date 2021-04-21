import 'package:charts_painter/chart.dart';
import 'package:flutter/material.dart';
import 'package:interface_clone/ui/utils/colors.dart';

class MyTrendsPage extends StatelessWidget {
  static String pageName = 'my-trends-page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'My Trends',
          style: TextStyle(color: Colors.grey),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColors.blue,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                Row(
                  children: [
                    Text('Nr.'),
                    Text('Date'),
                    Text('Time'),
                    Text('Syst.')
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
