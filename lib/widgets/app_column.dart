import 'package:flutter/material.dart';
import 'package:fooddelivery/utils/colors.dart';
import 'package:fooddelivery/utils/dimensions.dart';
import 'package:fooddelivery/widgets/small_text.dart';

import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;
  final int rate;
  final int comment;


  const AppColumn({Key? key, required this.text, required this.rate, required this.comment}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(text: text,size: Dimensions.font26,),
        SizedBox(height: Dimensions.height10,),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  rate,
                      (index) {
                    return Icon(Icons.star,color: AppColors.mainColor,size: 15,);
                  }
              ),
            ),
            SizedBox(width: 10,),
            SmallText(text: "${rate}"),
            SizedBox(width: 10,),
            SmallText(text: "${comment}"),
            SizedBox(width: 10,),
            SmallText(text: "Comments"),
          ],
        ),
        SizedBox(height: Dimensions.height20,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
                icon: Icons.circle_sharp,
                text: "Normal",
                iconColor: AppColors.iconColor1
            ),
            IconAndTextWidget(
                icon: Icons.location_on,
                text: "1.7km",
                iconColor: AppColors.mainColor
            ),
            IconAndTextWidget(
                icon: Icons.access_time_rounded,
                text: "32min",
                iconColor: AppColors.iconColor2
            ),
          ],
        ),
      ],
    );
  }
}
