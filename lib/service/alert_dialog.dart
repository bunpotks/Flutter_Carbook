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
      title: Text(title),
      content: Text(desc),
      actions: [
        TextButton(
          onPressed: press,
          child: const Text('OK'),
        ),
      ],
    );
  }
}

class CustomConfirmDialog extends StatelessWidget {
  final String title;
  final String desc;
  final Function? press;
  final Function? cancel;

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
      title: Text(title),
      content: Text(desc),
      actions: [
        TextButton(
          onPressed: cancel as void Function()?,
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: press as void Function()?,
          child: const Text('OK'),
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
