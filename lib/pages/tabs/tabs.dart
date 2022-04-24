import 'package:flutter/material.dart';
import 'package:flutter_jdshop/pages/tabs/cart.dart';
import 'package:flutter_jdshop/pages/tabs/category.dart';
import 'package:flutter_jdshop/pages/tabs/home.dart';
import 'package:flutter_jdshop/pages/tabs/user.dart';
import 'package:flutter_jdshop/services/screen_adapter.dart';

class Tabs extends StatefulWidget {
  const Tabs({Key? key}) : super(key: key);

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 1;
  late PageController _pageController;

  final List<Widget> _pageList = [
    const HomePage(),
    const CategoryPage(),
    const CardPage(),
    const UserPage()
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
  }

  AppBar _appBarWidget() {
    if (_currentIndex == 3) {
      return AppBar(
        title: const Text("用户中心"),
      );
    } else {
      return AppBar(
        leading: IconButton(
            icon: const Icon(Icons.center_focus_weak,
                size: 28, color: Colors.black87),
            onPressed: () {}),
        title: Container(
          child: InkWell(
            child: Container(
              height: ScreenAdaper.height(70),
              decoration: BoxDecoration(
                  color: const Color.fromRGBO(233, 233, 233, 0.8),
                  borderRadius: BorderRadius.circular(30)
              ),
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.search),
                  Text("笔记本" , style: TextStyle(fontSize: ScreenAdaper.size(28)),)
                ],
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, "/search");
            },
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.message, size: 28, color: Colors.black87))
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(),
      body: PageView(
        controller: _pageController,
        children: _pageList,
        onPageChanged: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        physics: const NeverScrollableScrollPhysics(), //禁止PageView滑动
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _pageController.jumpToPage(index);
          });
        },
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "首页"),
          BottomNavigationBarItem(icon: Icon(Icons.category), label: "分类"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "购物车"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "个人"),
        ],
      ),
    );
  }
}
