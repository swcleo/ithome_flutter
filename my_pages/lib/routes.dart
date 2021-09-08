import 'package:flutter/material.dart';

import 'pages/home.page.dart';
import 'pages/unknown.page.dart';
import 'pages/items.page.dart';

class RoutePage extends RouteSettings {
  final Function? builder;

  final String? path;

  Widget get widget => this.builder!();

  const RoutePage({
    required String name,
    Object? arguments,
    this.builder,
    this.path,
  }) : super(name: name, arguments: arguments);

  RoutePage.widget(Widget widget) : this(name: 'widget', builder: () => widget);
}

RoutePage getRoutePage({required String name}) {
  print("[RoutePage] getRoutePage $name");
  switch (name) {
    case '/':
      return RoutePage(name: "Home", path: name, builder: () => HomePage());
    case '/items':
      return RoutePage(name: "Items", path: name, builder: () => ItemsPage());
    default:
      return RoutePage(
          name: 'Unknwon', path: '/404', builder: () => UnknownPage());
  }
}
