import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class SwipeWidget extends StatelessWidget{
  final List<String> pics = ['assets/bg_banner_1.png','assets/bg_banner_2.jpg',
    'assets/bg_banner_3.jpg'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: Swiper(
        itemBuilder: (BuildContext context,int index){
          return Image.asset(pics[index],
              fit: BoxFit.fitWidth);
        },
        itemCount: 3,
        autoplay: true
      ),
    );
  }

}