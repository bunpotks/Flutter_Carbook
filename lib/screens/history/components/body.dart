import 'package:carbook/screens/history/components/history_detail.dart';
import 'package:flutter/material.dart';

class PaymentItem extends StatelessWidget {
  final String? inv;
  final String? date;
  final String? type;
  final String? desc;
  final String? subtotal;
  final String? discount;
  final String? total;
  final Function? press;

  const PaymentItem(
      {Key? key,
      this.inv,
      this.date,
      this.type,
      this.desc,
      this.subtotal,
      this.discount,
      this.total,
      this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press as void Function()?,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text(inv!), Text(date!)],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [Text('ราคา : ${total!}')],
      ),
    );
  }
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Map<dynamic, dynamic>> invoiceList = [
    {
      "inv": 'IV202201000',
      "date": '23/01/2566 15:00',
      "type": 'OneWayTrip',
      "desc": 'One Way Trip',
      "subtotal": '499.00',
      "discount": '0.00',
      "total": '499.00',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 20,
      separatorBuilder: (BuildContext context, int index) => Divider(),
      itemBuilder: (context, index) {
        var newitem = {
          "inv": invoiceList[0]['inv'] + '${index + 1}',
          "date": invoiceList[0]['date'],
          "type": invoiceList[0]['type'],
          "desc": invoiceList[0]['desc'],
          "subtotal": invoiceList[0]['subtotal'],
          "discount": invoiceList[0]['discount'],
          "total": invoiceList[0]['total'],
        };
        return PaymentItem(
            inv: newitem['inv'],
            date: newitem['date'],
            type: newitem['type'],
            desc: newitem['desc'],
            subtotal: newitem['subtotal'],
            discount: newitem['discount'],
            total: newitem['total'],
            press: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => HistoryDetail(
                          item: newitem,
                        )))));
      },
    );
  }
}

class TextFunc extends StatefulWidget {
  const TextFunc({super.key});

  @override
  State<TextFunc> createState() => _TextFuncState();
}

class _TextFuncState extends State<TextFunc> {
  String k = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: TextButton(
              onPressed: () => setState(() {
                    // k++;
                  }),
              child: Text('Hello')),
        ),
        Text(k.toString())
      ],
    );
  }
}
