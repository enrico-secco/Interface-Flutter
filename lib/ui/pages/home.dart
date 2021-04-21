import 'package:charts_painter/chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../components/components.dart';
import '../utils/utils.dart';

class CandleItem {
  CandleItem(this.min, this.max);

  final double max;
  final double min;
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CandleItem> _value = <CandleItem>[
    CandleItem(60, 155),
    CandleItem(61, 110),
    CandleItem(95, 155),
    CandleItem(70, 130),
    CandleItem(50, 120),
    CandleItem(55, 105),
  ];

  int _selected; //Variáveis podem ser em lowerCamelCase também.

  void switchBottomItem(index) {
    setState(() {
      _selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundColor: Colors.orange,
        ),
        leadingWidth: 95,
        actions: [
          IconButton(
            icon: Icon(FontAwesome5Solid.equals),
            onPressed: () => Navigator.pushNamed(context, 'my-trends-page'),
          ),
        ],
        elevation: 0,
      ),
      body: _buildBody(_selected),
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selected,
        onPressed: switchBottomItem,
      ),
    );
  }

  Widget _buildBody(int index) {
    if (index == 0) {
      return Center(
        child: Text('Index 0'),
      );
    } else if (index == 1) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TopContainer(),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .20,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BPCard(
                      title: 'My average BP',
                      icon: Feather.activity,
                      systolic: 139,
                      diastolic: 80,
                    ),
                    BPCard(
                      title: 'My last BP',
                      icon: Feather.activity,
                      systolic: 155,
                      diastolic: 95,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            MeasureChart(value: _value),
          ],
        ),
      );
    } else {
      return Center(
        child: Text('Index 2'),
      );
    }
  }
}

class MeasureChart extends StatelessWidget {
  const MeasureChart({
    Key key,
    @required List<CandleItem> value,
  })  : _value = value,
        super(key: key);

  final List<CandleItem> _value;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12, bottom: 10),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: AppColors.blue,
                          radius: 5,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Systolic',
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.orange,
                          radius: 5,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Text(
                          'Diastolic',
                          style: TextStyle(fontSize: 12),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Icon(
                      Icons.info,
                      size: 14,
                      color: Colors.grey,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 2.0,
              ),
              child: CandleChart<CandleItem>(
                data: _value,
                dataToValue: (CandleItem value) =>
                    CandleValue(value.min, value.max),
                height: MediaQuery.of(context).size.height * .275,
                chartBehaviour: ChartBehaviour(
                  isScrollable: true,
                ),
                backgroundDecorations: [
                  HorizontalAxisDecoration(
                    showValues: true,
                    lineWidth: .5,
                    dashArray: [2, 4],
                    legendFontStyle: TextStyle(
                      color: AppColors.blue,
                      fontSize: 10,
                    ),
                    legendPosition: HorizontalLegendPosition.start,
                    axisStep: 20,
                  ),
                ],
                foregroundDecorations: [
                  ValueDecoration(
                    alignment: Alignment.topCenter,
                    textStyle: TextStyle(
                      color: AppColors.blue,
                      fontSize: 10,
                    ),
                  ),
                ],
                chartItemOptions: BarItemOptions(
                  minBarWidth: 6.0,
                  padding: EdgeInsets.symmetric(horizontal: 22.0),
                  color: Theme.of(context).colorScheme.primary.withOpacity(1.0),
                  radius: BorderRadius.all(
                    Radius.circular(100.0),
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

class BottomNavBar extends StatelessWidget {
  int selectedIndex;
  Function onPressed;

  BottomNavBar({this.selectedIndex = 0, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            color: selectedIndex == 0 ? Colors.blue : Colors.blueGrey,
            icon: Icon(FontAwesome5Solid.capsules),
            onPressed: () => onPressed(0),
          ),
          IconButton(
            color: selectedIndex == 1 ? Colors.blue : Colors.blueGrey,
            icon: Icon(Icons.favorite_border),
            onPressed: () => onPressed(1),
          ),
          IconButton(
            color: selectedIndex == 2 ? Colors.blue : Colors.blueGrey,
            icon: Icon(Icons.mail_outline),
            onPressed: () => onPressed(2),
          ),
        ],
      ),
    );
  }
}

class BPCard extends StatelessWidget {
  const BPCard({
    Key key,
    this.icon,
    this.title,
    this.systolic,
    this.diastolic,
  }) : super(key: key);

  final IconData icon;
  final title;
  final systolic;
  final diastolic;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Color(0xFFF4F5F8),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$title',
            ),
            Icon(
              icon,
              color: AppColors.blue,
            ),
            RichText(
              text: TextSpan(
                text: '$systolic',
                style: TextStyle(
                    color: AppColors.blue,
                    fontSize: 30,
                    fontWeight: FontWeight.w300),
                children: [
                  TextSpan(
                      text: '/',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 30,
                      ),
                      children: [
                        TextSpan(
                          text: '$diastolic',
                          style: TextStyle(
                            color: AppColors.blue,
                            fontSize: 30,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ])
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
