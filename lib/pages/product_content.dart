import 'package:flutter/material.dart';
import 'package:flutter_jdshop/pages/product_content/product_content_first.dart';
import 'package:flutter_jdshop/pages/product_content/product_content_second.dart';
import 'package:flutter_jdshop/pages/product_content/product_content_third.dart';
import 'package:flutter_jdshop/services/screen_adapter.dart';

class ProductContentPage extends StatefulWidget {
  final Map arguments;

  const ProductContentPage({Key? key, required this.arguments})
      : super(key: key);

  @override
  State<ProductContentPage> createState() => _ProductContentPageState();
}

class _ProductContentPageState extends State<ProductContentPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: ScreenAdaper.width(400),
                  child: const TabBar(
                    indicatorColor: Colors.red,
                    indicatorSize: TabBarIndicatorSize.label,
                    tabs: [
                      Tab(
                        child: Text("商品"),
                      ),
                      Tab(
                        child: Text("详情"),
                      ),
                      Tab(
                        child: Text("评价"),
                      ),
                    ],
                  ),
                )
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    showMenu(
                        context: context,
                        position: RelativeRect.fromLTRB(
                            ScreenAdaper.width(600), 100, 10, 0),
                        items: [
                          PopupMenuItem(
                              child: Row(
                            children: const [Icon(Icons.home), Text("首页")],
                          )),
                          PopupMenuItem(
                              child: Row(
                            children: const [Icon(Icons.search), Text("首页")],
                          )),
                          PopupMenuItem(
                              child: Row(
                            children: const [Icon(Icons.home), Text("首页")],
                          )),
                        ]);
                  },
                  icon: const Icon(Icons.more_horiz))
            ],
          ),
          body: const TabBarView(
            children: [
              ProductContentFirst(),
              ProductContentSecond(),
              ProductContentThird(),
            ],
          ),
        ));
  }
}
