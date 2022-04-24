import 'package:flutter/material.dart';
import 'package:flutter_jdshop/pages/product_content.dart';
import 'package:flutter_jdshop/pages/product_list.dart';
import 'package:flutter_jdshop/pages/search.dart';
import 'package:flutter_jdshop/pages/tabs/tabs.dart';

//配置路由
final Map<String, Function> routes = {
  "/": (context) => const Tabs(),
  "/search": (context) => const SearchPage(),
  "/productList": (context, {arguments}) => ProductListPage(arguments: arguments),
  "/productContent": (context, {arguments}) => ProductContentPage(arguments: arguments),
};

//固定写法
// ignore: prefer_function_declarations_over_variables
var onGenerateRoute = (RouteSettings settings) {
// 统一处理
  final String? name = settings.name;
  final Function? pageContentBuilder = routes[name];
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) =>
              pageContentBuilder(context, arguments: settings.arguments));
      return route;
    } else {
      final Route route =
      MaterialPageRoute(builder: (context) => pageContentBuilder(context));
      return route;
    }
  }
};