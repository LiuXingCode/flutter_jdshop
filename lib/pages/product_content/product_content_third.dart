import 'package:flutter/material.dart';

class ProductContentThird extends StatefulWidget {
  const ProductContentThird({Key? key}) : super(key: key);

  @override
  State<ProductContentThird> createState() => _ProductContentThirdState();
}

class _ProductContentThirdState extends State<ProductContentThird> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("商品页面"),
    );
  }
}
