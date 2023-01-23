import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String desc;
  final Function? press;

  const CustomAlertDialog(
      {Key? key, required this.title, required this.desc, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(desc),
      actions: [
        TextButton(
          onPressed: press as void Function()?,
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
