import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../components/components.dart';
import '../utils/utils.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundColor: Colors.orange,
        ),
        actions: [
          IconButton(icon: Icon(FontAwesome5Solid.equals), onPressed: null)
        ],
        elevation: 0,
      ),
      body: SingleChildScrollView(
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
          ],
        ),
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
