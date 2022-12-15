import 'package:flutter/material.dart';
import 'package:carbook/screens/photoview/photoview_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../../../size_config.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  // List<String> img = [
  //   "https://static.scientificamerican.com/sciam/cache/file/4F73FD83-3377-42FC-915AD56BD66159FE_source.jpg",
  //   "https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832__340.jpg",
  //   "https://images.unsplash.com/photo-1503614472-8c93d56e92ce?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8NGslMjBtb3VudGFpbnxlbnwwfHwwfHw%3D&w=1000&q=80"
  // ];

  List<Map<String, dynamic>> img = [
    {
      'id': 1,
      'img':
          "https://static.scientificamerican.com/sciam/cache/file/4F73FD83-3377-42FC-915AD56BD66159FE_source.jpg"
    },
    {
      'id': 2,
      'img':
          "https://cdn.pixabay.com/photo/2018/01/14/23/12/nature-3082832__340.jpg"
    },
    {
      'id': 3,
      'img':
          "https://images.unsplash.com/photo-1503614472-8c93d56e92ce?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8NGslMjBtb3VudGFpbnxlbnwwfHwwfHw%3D&w=1000&q=80"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: img.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => {
            Navigator.pushNamed(context, PhotoViewScreen.routeName,
                arguments:
                    PhotoViewArguments(img[index]['img'], img[index]['id']))
          },
          child: Column(children: [
            Hero(
                tag: img[index]['id'],
                child: Image.network(
                  img[index]['img'],
                )),
            SizedBox(height: getProportionateScreenHeight(10)),
          ]),
        );
      },
    );
  }

  Container ConBox() {
    return Container(
      width: MediaQuery.of(context).size.width * 1.0,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(10)),
              Box(),
              SizedBox(height: 10),
              Box(),
              SizedBox(height: 10),
              Box(),
              SizedBox(height: 10),
              Box()
            ],
          ),
        ),
      ),
    );
  }

  Container Box() {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width * 0.65,
      decoration: BoxDecoration(
          color: Colors.amber, borderRadius: BorderRadius.circular(20)),
    );
  }
}
