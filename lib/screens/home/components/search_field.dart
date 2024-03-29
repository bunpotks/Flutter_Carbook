import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // print("Focus");
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Container(
        width: SizeConfig.screenWidth * 0.55,
        decoration: BoxDecoration(
          // color: kSecondaryColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          onChanged: (value) => print(value),
          decoration: InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                  horizontal: getProportionateScreenWidth(10),
                  vertical: getProportionateScreenWidth(12)),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              hintText: "Search",
              prefixIcon: Icon(Icons.search)),
        ),
      ),
    );
  }
}
