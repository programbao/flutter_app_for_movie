import 'package:flutter/material.dart';
import '../pages/tabs/Tabs.dart';
import '../pages/search.dart';
import '../pages/ProductList.dart';

// 配置路由
final routes = {
  '/': (context) => const Tabs(),
  '/search': (context) => const SearchPage(),
  '/productList': (context, {arguments}) =>
      ProductListPage(arguments: arguments)
};
// 固定写法
var onGenerateRoute = (RouteSettings settings) {
  // 统一处理
  final String? name = settings.name;
  final Function pageContentBuilder = routes[name] as Function;
  if (pageContentBuilder != null) {
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
          builder: (context) => ScrollConfiguration(
              behavior: const ScrollBehavior()
                  .copyWith(overscroll: false), // 去除滚动出现的阴影
              child:
                  pageContentBuilder(context, arguments: settings.arguments)));
      return route;
    } else {
      final Route route = MaterialPageRoute(
          builder: (context) => ScrollConfiguration(
              behavior: const ScrollBehavior()
                  .copyWith(overscroll: false), // 去除滚动出现的阴影
              child: pageContentBuilder(context)));
      return route;
    }
  }
};
