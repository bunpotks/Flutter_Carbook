import 'package:carbook/components/default_button.dart';
import 'package:carbook/screens/Maps/map_select.dart';
import 'package:carbook/screens/Maps/search_location_model.dart';
import 'package:carbook/screens/passenger_profile/passengerprofille_screen.dart';
import 'package:carbook/screens/sumary/sumary_screen.dart';

import 'package:flutter/material.dart';
import 'package:carbook/service/comp_service.dart';
import 'package:intl/intl.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:carbook/screens/passenger_profile/components/passenger.dart';
import 'package:carbook/service/select_service.dart';

class BookingForm extends StatefulWidget {
  const BookingForm({super.key});

  @override
  State<BookingForm> createState() => _BookingFormState();
}

class _BookingFormState extends State<BookingForm> {
  // Map<dynamic, dynamic>? passenger;
  // DateTime? timeStart;
  late Passenger passengerData;

  Results? Location_1;
  Results? Location_2;

  TextEditingController passenger = TextEditingController();
  TextEditingController route1 = TextEditingController();
  TextEditingController route2 = TextEditingController();

  TextEditingController dateStart = TextEditingController(
      text: DateFormat('yyyy-MM-dd').format(DateTime.now()));
  TextEditingController timeStart =
      TextEditingController(text: DateFormat('HH:mm').format(DateTime.now()));

  List<Map<dynamic, dynamic>> route = [];
  CompService compService = CompService();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        buildPasssengerFromField(),
        SizedBox(height: 30),
        buildDateFormField(),
        SizedBox(height: 30),
        buildTimeFormField(),
        SizedBox(height: 30),
        buildLocation_1FormField(),
        SizedBox(height: 30),
        buildLocation_2FormField(),
        SizedBox(height: 30),
        DefaultButton(
          text: 'ถัดไป',
          press: () async {
            Navigator.pushNamed(context, SumaryScreen.routeName);
          },
        ),
      ],
    );
  }

  InkWell buildPasssengerFromField() {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () => {},
      child: TextFormField(
        controller: passenger,
        readOnly: true,
        onTap: () async => showBarModalBottomSheet(
            // showCupertinoModalBottomSheet
            // showMaterialModalBottomSheet
            // showBarModalBottomSheet
            expand: true,
            context: context,
            // backgroundColor: Colors.transparent,
            builder: (context) => PassengerSelect()).then((value) {
          if (value != null) {
            setState(() {
              passengerData = value;
              var passName = passengerData.name!.title! +
                  ' ' +
                  passengerData.name!.first! +
                  ' ' +
                  passengerData.name!.last!;
              passenger.text = passName;
            });
          }

          // print(passengerData.toJson());
        }),
        decoration: InputDecoration(
          labelText: 'เลือกผู้โดยสาร',
          hintText: 'ระบุผู้โดยสารที่ต้องการเดินทาง',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(
            Icons.man_outlined,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  InkWell buildDateFormField() {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () => {},
      child: TextFormField(
        controller: dateStart,
        readOnly: true,
        onTap: () async => await compService.getDate(context).then((value) => {
              setState(() {
                dateStart.text = value;
              })
            }),
        decoration: InputDecoration(
          labelText: 'วันที่เดินทาง',
          hintText: 'ระบุวันที่เดินทาง',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(
            Icons.date_range,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  InkWell buildTimeFormField() {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () => {},
      child: TextFormField(
        controller: timeStart,
        readOnly: true,
        onTap: () async => await compService.getTime(context).then((value) => {
              setState(() {
                timeStart.text = value;
              })
            }),
        decoration: InputDecoration(
          labelText: 'เวลาที่เดินทาง',
          hintText: 'ระบุเวลาที่เดินทาง',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(
            Icons.punch_clock_rounded,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  InkWell buildLocation_1FormField() {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () => {},
      child: TextFormField(
        controller: route1,
        style: TextStyle(fontSize: 14),
        readOnly: true,
        onTap: () async => Navigator.push(
                context, MaterialPageRoute(builder: ((context) => MapSelect())))
            .then((value) {
          if (value != null) {
            setState(() {
              Location_1 = value;
              String text = Location_1!.name! + ' - ' + Location_1!.vicinity!;
              route1.text = text;
            });
          }
        }),
        decoration: InputDecoration(
          labelText: 'สถานที่รับ',
          hintText: 'ระบุสถานที่แรกที่ต้องการให้ไปรับ',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(
            Icons.pin_drop_outlined,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  InkWell buildLocation_2FormField() {
    return InkWell(
      borderRadius: BorderRadius.circular(10),
      onTap: () => {},
      child: TextFormField(
        style: TextStyle(fontSize: 14),
        controller: route2,
        readOnly: true,
        onTap: () async => Navigator.push(
                context, MaterialPageRoute(builder: ((context) => MapSelect())))
            .then((value) {
          if (value != null) {
            setState(() {
              Location_2 = value;
              String text = Location_2!.name! + ' - ' + Location_2!.vicinity!;
              route2.text = text;
            });
          }
        }),
        decoration: InputDecoration(
          // labelStyle: ,
          // isDense: true,
          labelText: 'สถานที่ปลายทาง',
          hintText: 'เลือกสถานที่ปลายที่ที่ต้องการไปส่ง',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          suffixIcon: Icon(
            Icons.pin_drop_outlined,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
