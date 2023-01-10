import 'package:carbook/size_config.dart';
import 'package:flutter/material.dart';

class CouponDiscount extends StatelessWidget {
  const CouponDiscount({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> couponList = [
      {
        "image":
            "https://img.freepik.com/free-vector/super-sale-horizontal-banner_52683-59532.jpg?w=2000",
        "title": "คูปองส่วลด",
        "desc": "ใช้เป็นส่วนลดสำหรับการเดินทาง",
      },
      {
        "image":
            "https://img.freepik.com/premium-vector/special-offer-sale-discount-banner_180786-46.jpg?w=2000",
        "title": "คูปองส่วลด",
        "desc": "ใช้เป็นส่วนลดสำหรับการเดินทาง",
      },
      {
        "image":
            "https://media.istockphoto.com/id/1161746161/vector/flash-sale-and-discount-banner-design.jpg?s=170667a&w=0&k=20&c=Y3U7PpLfWNaWQsAIbWR2ldN6ti_fU-hSZMoxm9PA-GI=",
        "title": "คูปองส่วลด",
        "desc": "ใช้เป็นส่วนลดสำหรับการเดินทาง",
      },
      {
        "image":
            "https://www.creativefabrica.com/wp-content/uploads/2020/12/09/Big-sale-discount-banner-promotion-Graphics-7082388-1-580x387.jpg",
        "title": "คูปองส่วลด",
        "desc": "ใช้เป็นส่วนลดสำหรับการเดินทาง",
      },
      {
        "image":
            "https://previews.123rf.com/images/denisined/denisined2009/denisined200900175/155692670-sale-15-off-discount-banner-design-template-promo-tag-special-offer-vector-illustration.jpg",
        "title": "คูปองส่วลด",
        "desc": "ใช้เป็นส่วนลดสำหรับการเดินทาง",
      },
    ];
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            SizedBox(width: getProportionateScreenWidth(10)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: List.generate(
                  couponList.length,
                  (index) => CouponItem(
                        image: couponList[index]['image'],
                        title: couponList[index]['title'],
                        desc: couponList[index]['desc'],
                      )),
            ),
            SizedBox(width: getProportionateScreenWidth(20)),
          ],
        ),
      ),
    );
  }
}

class CouponItem extends StatelessWidget {
  final String? image, title, desc;

  const CouponItem({Key? key, this.image, this.title, this.desc})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getProportionateScreenWidth(0)),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
        child: Container(
          width: 150,
          height: 190,
          child: InkWell(
            onTap: (() => print('test')),
            child: Column(
              children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill, image: NetworkImage(image!)),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5),
                            topRight: Radius.circular(5))),
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(title!),
                          Text(
                            desc!,
                            maxLines: 1,
                            style: TextStyle(fontSize: 12),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
