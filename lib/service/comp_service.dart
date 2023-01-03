import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CompService {
  Future getDate(context) async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2022),
        lastDate: DateTime(2100));

    if (pickedDate != null) {
      String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
      return formattedDate;
    } else {
      return null;
    }
  }

  Future getTime(context) async {
    TimeOfDay selectedTime = TimeOfDay(hour: 00, minute: 00);
    TimeOfDay? pickedTime =
        await showTimePicker(context: context, initialTime: selectedTime);

    if (pickedTime != null) {
      selectedTime = pickedTime;
      var hr = selectedTime.hour.toString().padLeft(2, "0");
      var mi = selectedTime.minute.toString().padLeft(2, "0");
      String times = hr + ':' + mi;
      return times;
    } else {
      return null;
    }
  }
}
