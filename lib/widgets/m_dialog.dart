import 'package:demo/utils/filled_button_util.dart';
import 'package:demo/utils/outlined_button_util.dart';
import 'package:demo/utils/size_util.dart';
import 'package:demo/utils/theme_util.dart';
import 'package:demo/widgets/m_text_field.dart';
import 'package:demo/widgets/space.dart';
import 'package:flutter/material.dart';

import 'check_box_list.dart';
import 'close_button.dart';
import 'm_filled_button.dart';

class MDialog extends StatelessWidget {
  final String? title;
  const MDialog({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,border: Border.all(color: context.primary,width: 1),
          borderRadius: BorderRadius.circular(5),
        ),
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(title ?? 'Title',style: context.headlineSmall,),
                MCloseButton(),
              ],
            ),
            Space(5),
            MTextField(hintText: 'Search Category' ,suffixIcon: Icon( Icons.search),),
          Space(),
            CheckBoxList<String>(items: ['Item 1', 'Item 2', 'Item 3'],labelBuilder: (item) => item,),
            Space(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                OutlinedButton(onPressed: (){}, child: Text('Cancel')).originalButton(context),
                FilledButton(child: Text('ok'),onPressed: (){},).originalButton(context),

              ],
            )
          ],
        ),
      ),
    );
  }
}




