import 'dart:convert';
import 'package:carbook/constants.dart';
import 'package:carbook/screens/blank/examples/cupertino_share.dart';
import 'package:flutter/material.dart';

// class testModel {
//   List<Item>? item;

//   testModel({this.item});

//   testModel.fromJson(Map<String, dynamic> json) {
//     if (json['item'] != null) {
//       item = <Item>[];
//       json['item'].forEach((v) {
//         item!.add(new Item.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.item != null) {
//       data['item'] = this.item!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Item {
//   dynamic id;

//   Item({this.id});

//   Item.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     return data;
//   }
// }

class CouponItemModel {
  String? id;
  String? name;
  String? desc;
  String? percent;
  String? exp;

  CouponItemModel({this.id, this.name, this.desc, this.percent, this.exp});

  CouponItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    desc = json['desc'];
    percent = json['percent'];
    exp = json['exp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['desc'] = this.desc;
    data['percent'] = this.percent;
    data['exp'] = this.exp;

    return data;
  }
}

class CouponItem extends StatefulWidget {
  const CouponItem({super.key});

  @override
  State<CouponItem> createState() => _CouponItemState();
}

class _CouponItemState extends State<CouponItem> {
  List<CouponItemModel> item = [
    CouponItemModel(
        id: '1',
        name: 'coupon discount',
        desc: '10 % of birthday Coupon',
        exp: '20/02/2023 - 20/03/2023',
        percent: '10 % Off'),
    CouponItemModel(
        id: '2',
        name: 'coupon discount',
        desc: '20 % of Holiday Coupon',
        exp: '20/02/2023 - 20/03/2023',
        percent: '20 % Off'),
    CouponItemModel(
        id: '3',
        name: 'coupon discount',
        desc: '10 Baht of Winter Coupon',
        exp: '20/02/2023 - 20/03/2023',
        percent: '10  Baht'),
    CouponItemModel(
        id: '4',
        name: 'coupon discount',
        desc: '10 % of Sumer Coupon',
        exp: '20/02/2023 - 20/03/2023',
        percent: '50 % Off'),
    CouponItemModel(
        id: '5',
        name: 'coupon discount',
        desc: '10 % of birthday Coupon',
        exp: '20/02/2023 - 20/03/2023',
        percent: '10 % Off'),
    CouponItemModel(
        id: '6',
        name: 'coupon discount',
        desc: '10 % of birthday Coupon',
        exp: '20/02/2023 - 20/03/2023',
        percent: '10 % Off'),
    CouponItemModel(
        id: '7',
        name: 'coupon discount',
        desc: '10 % of birthday Coupon',
        exp: '20/02/2023 - 20/03/2023',
        percent: '10 % Off')
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF5F6F9),
      child: ListView.builder(
        itemCount: item.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
          child: Coupon(
            item: item[index],
            press: () {
              setState(() {
                // item.removeAt(index);
                item.add(CouponItemModel(
                    id: (item.length + 1).toString(),
                    name: 'coupon discount',
                    desc: (item.length + 1).toString() +
                        '10 % of birthday Coupon',
                    exp: '20/02/2023 - 20/03/2023',
                    percent: '10 % Off'));
                // item.removeWhere((items) => items.id == '1');
              });
            },
          ),
        ),
      ),
    );
  }
}

class Coupon extends StatelessWidget {
  final CouponItemModel? item;
  final Function? press;

  const Coupon({Key? key, this.item, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var data = {
    //   "item": [
    //     {"id": "1"},
    //     {"id": "2"},
    //     {"id": '222'},
    //   ],
    // };

    // testModel eiei = testModel.fromJson(data);
    // List<Item>

    // print(eiei.item.toString());

    // List<Item> dataItem =
    //     List<Item>.from(data['item']!.map((model) => Item.fromJson(model)));

    return Container(
      height: 150,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        semanticContainer: false,
        child: InkWell(
          onTap: press as void Function()?,
          borderRadius: BorderRadius.circular(20),
          child: Row(
            children: [
              // Text(eiei.item![2]!.id.toString()),
              Expanded(
                  flex: 2,
                  child: Container(
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.5),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        item!.percent.toString(),
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
              Expanded(
                  flex: 4,
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: kSecondaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item!.desc.toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          item!.exp.toString(),
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
