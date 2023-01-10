import 'package:carbook/constants.dart';
import 'package:carbook/size_config.dart';
import 'package:flutter/material.dart';

class HistoryDetail extends StatelessWidget {
  final dynamic item;
  const HistoryDetail({Key? key, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(item);
    return Scaffold(
      appBar: AppBar(
        title: Text(item['inv']!),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                SizedBox(height: 30),
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/success_payment.png',
                        height: getProportionateScreenWidth(80),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Payment Success'),
                      Text(item['date']),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        '฿ ${item['total']}',
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    decoration: BoxDecoration(
                        color: kPrimaryColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Item',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text('Price',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black))
                            ],
                          ),
                          Divider(),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'One Way Trip',
                                ),
                                Text(item['subtotal'])
                              ],
                            ),
                          ),
                          Divider(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'SubTotal',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(item['subtotal'])
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Discount',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(item['discount'])
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(item['total'])
                            ],
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
