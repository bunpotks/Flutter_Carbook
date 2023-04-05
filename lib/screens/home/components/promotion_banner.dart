import 'package:flutter/material.dart';
import '../../../size_config.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PromotionModel {
  String? id;
  String? title;
  String? bigText;
  String? image;

  PromotionModel({this.id, this.title, this.bigText, this.image});

  PromotionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    bigText = json['bigText'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['bigText'] = this.bigText;
    data['image'] = this.image;
    return data;
  }
}

class PromotionBaner extends StatelessWidget {
  const PromotionBaner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<PromotionModel> promotionList = [
      PromotionModel(
          id: "1",
          title: "A Summer Surpise",
          bigText: "Cashback 50%",
          image:
              "https://thumbs.dreamstime.com/b/travel-agency-promo-banner-discounts-tours-vector-illu-illustration-126030477.jpg"),
      PromotionModel(
          id: "2",
          title: "A Winter Surpise",
          bigText: "Cashback 60%",
          image:
              "https://img.freepik.com/free-vector/mega-sale-offers-banner-template_1017-31299.jpg?w=2000"),
      PromotionModel(
          id: "3",
          title: "A Snow Surpise",
          bigText: "Cashback 60%",
          image:
              "https://img.freepik.com/premium-vector/winter-landscape-flat-illustration-big-sale-offer-discount-promotion-banner-template_22052-4634.jpg?w=2000"),
    ];

    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: getProportionateScreenWidth(10)),
      child: CarouselSlider(
        options: CarouselOptions(
            enlargeCenterPage: false,
            autoPlay: true,
            autoPlayCurve: Curves.linear,
            enableInfiniteScroll: true,
            aspectRatio: 3 / 2,
            viewportFraction: 0.95,
            height: MediaQuery.of(context).size.width > 900
                ? MediaQuery.of(context).size.width * 0.40
                : MediaQuery.of(context).size.width * 0.55,
            autoPlayAnimationDuration: Duration(milliseconds: 1500),
            autoPlayInterval: Duration(seconds: 5)),
        items: promotionList.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return DiscountBanner(i);
            },
          );
        }).toList(),
      ),
    );
  }

  Container DiscountBanner(PromotionModel item) {
    return Container(
      margin: EdgeInsets.all(getProportionateScreenWidth(5)),
      decoration: BoxDecoration(
          // color: Color(0xFF4A3298),
          borderRadius: BorderRadius.circular(18),
          image: DecorationImage(
              image: NetworkImage(item.image!), fit: BoxFit.fill)),
    );
  }
}
