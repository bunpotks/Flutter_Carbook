import 'package:carbook/constants.dart';
import 'package:carbook/theme.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String desc;
  final press;

  const CustomAlertDialog(
      {Key? key,
      this.title = 'แจ้งเตือน',
      this.desc = 'เกิดข้อผิดพลาดไม่สามารถค้นหาข้อมูลได้โปรดลองใหม่อีกครั้ง',
      this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(
        Icons.info,
        size: 50,
      ),
      insetPadding: EdgeInsets.all(20),
      // contentPadding: EdgeInsets.all(20),
      actionsPadding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      alignment: Alignment.center,
      title: Center(
          child: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      )),
      content: Text(
        desc,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: kPrimaryColor,
                    minimumSize: Size(100, 60) // p
                    ),
                onPressed: press,
                child: const Text(
                  'ยืนยัน',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CustomConfirmDialog extends StatelessWidget {
  final String title;
  final String desc;
  final press;
  final cancel;

  const CustomConfirmDialog(
      {Key? key,
      required this.title,
      required this.desc,
      this.press,
      this.cancel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      icon: Icon(
        Icons.info,
        size: 50,
      ),
      insetPadding: EdgeInsets.all(20),
      // contentPadding: EdgeInsets.all(20),
      actionsPadding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
      alignment: Alignment.center,
      title: Center(
          child: Text(
        title,
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      )),
      content: Text(
        desc,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 16),
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: kSecondaryColor,
                    minimumSize: Size(100, 60) // p

                    ),
                onPressed: press,
                child: const Text(
                  'ยกเลิก',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: kPrimaryColor,
                    minimumSize: Size(100, 60) // p
                    ),
                onPressed: press,
                child: const Text(
                  'ยืนยัน',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class CustomLoadingDialog extends StatelessWidget {
  const CustomLoadingDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      // The background color
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            // The loading indicator
            CircularProgressIndicator(),
            SizedBox(
              height: 15,
            ),
            // Some text
            Text('Loading...Please Wait')
          ],
        ),
      ),
    );
  }
}

Future showLoading(context) async {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => CustomLoadingDialog());
}

Future hideloading(context) async {
  Navigator.pop(context);
}
