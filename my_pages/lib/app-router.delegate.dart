import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'routes.dart';

class AppRouterDelegate extends RouterDelegate<RoutePage>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<RoutePage> {
  final List<Page> _pages = [];

  AppRouterDelegate() : navigatorKey = GlobalKey();

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  @override
  RoutePage get currentConfiguration {
    print("RouterDelegate currentConfiguration");

    return _pages.last.arguments as RoutePage;
  }

  @override
  Future<void> setNewRoutePath(RoutePage configuration) {
    print("RouterDelegate setNewRoutePath ${configuration.name}");

    final shouldAddPage = _pages.isEmpty ||
        (_pages.last.arguments as RoutePage).name != configuration.name;

    if (shouldAddPage) {
      replace(configuration);
    }

    return SynchronousFuture(null);
  }

  replace(RoutePage configuration) {
    _pages.clear();
    _addPage(configuration);
  }

  static AppRouterDelegate of(BuildContext context) {
    RouterDelegate routerDelegate = Router.of(context).routerDelegate;
    return routerDelegate as AppRouterDelegate;
  }

  void push(Widget widget) {
    _addPage(RoutePage.widget(widget));
  }

  void _addPage(RoutePage configuration) {
    _pages.add(
      MaterialPage(
        child: configuration.widget,
        key: ValueKey(configuration.name),
        name: configuration.name,
        arguments: configuration,
      ),
    );
    notifyListeners();
  }

  void pushNamed(String name) {
    RoutePage configuration = getRoutePage(name: name);
    replace(configuration);
  }

  @override
  Widget build(BuildContext context) {
    print("RouterDelegate build");
    return Navigator(
      key: navigatorKey,
      onPopPage: _onPopPage,
      pages: List.of(_pages),
    );
  }

  bool _onPopPage(Route<dynamic> route, result) {
    print("onPopPage");
    final didPop = route.didPop(result);

    if (!didPop) {
      return false;
    }

    if (_pages.length > 1) {
      _pages.removeLast();
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }
}

class AppRouterParser extends RouteInformationParser<RoutePage> {
  @override
  Future<RoutePage> parseRouteInformation(RouteInformation routeInformation) {
    print(
        'RouteInformationParser parseRouteInformation ${routeInformation.location}');

    RoutePage configuration =
        getRoutePage(name: routeInformation.location ?? '/');

    return SynchronousFuture(configuration);
  }

  @override
  RouteInformation restoreRouteInformation(RoutePage configuration) {
    print(
        'RouteInformationParser restoreRouteInformation ${configuration.path}');
    return RouteInformation(location: configuration.path ?? '/');
  }
}
