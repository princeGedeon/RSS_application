import 'package:flutter/material.dart';

class ImageView extends StatelessWidget

{
  final String imageUrl;

  const ImageView({Key? key,required this.imageUrl}):super(key:key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(padding: EdgeInsets.symmetric(vertical: 8),
      child: (imageUrl == 'default') ? Image.asset(
        "images/tumblr_9b818145206dc05c3553585d1d4952af_443ecc25_1280.jpg",
        fit: BoxFit.cover,
        height: MediaQuery
            .of(context)
            .size
            .height / 4,
      ) : Image.network(imageUrl,
        fit: BoxFit.cover,
        height: MediaQuery
            .of(context)
            .size
            .height / 4,
      ),


    );
  }

}