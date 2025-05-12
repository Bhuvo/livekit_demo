
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'm_text_field.dart';

class MDateTimePicker extends StatefulWidget {
  final Function(DateTime?)? selectedDate;
  final bool isDate;
  MDateTimePicker({super.key, this.selectedDate, this.isDate = false});

  @override
  State<MDateTimePicker> createState() => _MDateTimePickerState();
}

class _MDateTimePickerState extends State<MDateTimePicker> {
  DateTime? _selectedDate;


  @override
  Widget build(BuildContext context) {

    return MTextField(
      key: ValueKey(_selectedDate),
      initialValue: _selectedDate != null ? (widget.isDate? DateFormat('yyyy-MM-dd').format(_selectedDate!) : DateFormat('HH:mm').format(_selectedDate!)) : '',
      hintText: widget.isDate ? 'Select Date' :'Select Time',
      onTap: () async {
        if(widget.isDate) {
          var d = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime.now(),
          );
          setState(() {
            _selectedDate=d;
          });
        }else{
          var f = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.now(),
          );
          setState(() {
            _selectedDate=DateTime(
                DateTime.now().year,
                DateTime.now().month,
                DateTime.now().day,
                f!.hour,
                f.minute
            );
          });
        }
        print(_selectedDate);
        widget.selectedDate?.call(_selectedDate);
      },
      suffixIcon: widget.isDate ?Icon(
        Icons.calendar_month,
        color: Colors.grey,
      ) : Icon(
        Icons.access_time,
        color: Colors.grey,
      ),
    );
  }
}