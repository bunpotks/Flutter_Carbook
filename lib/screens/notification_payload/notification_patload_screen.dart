import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PayloadScreen extends StatefulWidget {
  const PayloadScreen(
    this.payload, {
    Key? key,
  }) : super(key: key);

  static const String routeName = '/payloadScreen';

  final String? payload;

  @override
  State<PayloadScreen> createState() => _PayloadScreenState();
}

class _PayloadScreenState extends State<PayloadScreen> {
  String? _payload;

  @override
  void initState() {
    super.initState();
    _payload = widget.payload;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('payload ${_payload ?? ''}'),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go back!'),
            ),
          ],
        ),
      ),
    );
  }
}
