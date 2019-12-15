import 'package:flutter/material.dart';

import '../models/image_model.dart';

class DrawImage extends StatelessWidget{
  final List<ImageModel> ctx;
  DrawImage(this.ctx);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ctx.length,
      itemBuilder: (context,int index){
        return Container(
          padding: EdgeInsets.all(40),
          margin: EdgeInsets.all(10),
          child: Image.network(ctx[index].url),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
          ),
        );
      },
    );
  }
}