import 'package:carbook/constants.dart';
import 'package:carbook/size_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

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
        id: '1',
        name: 'coupon discount',
        desc: '10 % of Sumer Coupon',
        exp: '20/02/2023 - 20/03/2023',
        percent: '50 % Off'),
    CouponItemModel(
        id: '1',
        name: 'coupon discount',
        desc: '10 % of birthday Coupon',
        exp: '20/02/2023 - 20/03/2023',
        percent: '10 % Off'),
    CouponItemModel(
        id: '1',
        name: 'coupon discount',
        desc: '10 % of birthday Coupon',
        exp: '20/02/2023 - 20/03/2023',
        percent: '10 % Off'),
    CouponItemModel(
        id: '1',
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
        itemBuilder: (context, index) => Coupon(index),
      ),
    );
  }

  Container Coupon(index) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10),
      margin: EdgeInsets.only(top: index == 0 ? 10 : 0, bottom: 5),
      height: 150,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        semanticContainer: false,
        child: InkWell(
          onTap: () => print(index),
          borderRadius: BorderRadius.circular(20),
          child: Row(
            children: [
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
                        item[index].percent.toString(),
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
                          item[index].desc.toString(),
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          item[index].exp.toString(),
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
