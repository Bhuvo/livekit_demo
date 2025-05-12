import 'package:demo/widgets/space.dart';
import 'package:flutter/material.dart';

import 'm_filled_button.dart';

List<Map<String, dynamic>> list =[
  {
    'val': '372',
    'name' : 'Program',
    'color' : 0xFFFFF4DE ,
  },
  {
    'val': '120',
    'name' : 'Mentors',
    'color' : 0xFFC9F7F5
  },
  {
    'val': '556',
    'name' : 'Mentees',
    'color': 0xFFEEE5FF
  },
];
class MainCard extends StatelessWidget {
  final String title;
  final Widget? child;
  final Widget? titleAction;
  const MainCard({super.key,  this.child, required this.title, this.titleAction});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: Border.symmetric(),
      color: Colors.white,
      elevation: 10,
      margin: EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: 8,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient:LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors:[
                            Color(0xFF02A6BD),
                            Color(0xFF1866BF),
                          ])
                  ),
                ),
                Space(10),
                Text(title ?? 'Planed Program',style: Theme.of(context).textTheme.titleSmall,),
                titleAction ?? Container(),
                Spacer(),
                MFilledButton()
              ],
            ),
            Space(10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Divider(height: 1,),
            ),
            Space(10),
            child ?? SizedBox(
              height: 310,
              child:  Column(
                children: list.map((e) {
                  return PlanedProgramChild(data: e,);
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class PlanedProgramChild extends StatelessWidget {
  final Map<String ,dynamic> data;
  const PlanedProgramChild({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    print('the val is $data');
    return Row(
      children: [
        Container(
          margin: EdgeInsets.all( 10),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(data['color'])
          ),
          child: Center(child: Text(data['val'],style: Theme.of(context).textTheme.titleMedium,)),
        ),
        Space(10),
        Text(data['name'],style: Theme.of(context).textTheme.titleSmall,)
      ],
    );
  }
}