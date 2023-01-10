import 'package:flutter/material.dart';
import 'components/body.dart';

class HistoryScreen extends StatelessWidget {
  static const routeName = '/history';
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Historys')),
      body: Body(),
    );
  }
}
