import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:havenfinder/src/modules/main_module/presenter/controller/dashboard_controller.dart';

class BottomNavigationWidget extends ConsumerStatefulWidget {
  //String location;
  const BottomNavigationWidget({
    super.key,
  });

  //final Widget child;

  @override
  ConsumerState<BottomNavigationWidget> createState() =>
      _BottomNavigationWidgetState();
}

class _BottomNavigationWidgetState
    extends ConsumerState<BottomNavigationWidget> {
  //int _currentIndex = 0;

  static const List<MyCustomBottomNavBarItem> tabs = [
    MyCustomBottomNavBarItem(
      icon: Icon(Icons.home),
      activeIcon: Icon(Icons.home),
      label: 'HOME',
      //initialLocation: '/',
    ),
    MyCustomBottomNavBarItem(
      icon: Icon(Icons.search),
      activeIcon: Icon(Icons.search),
      label: 'SEARCH',
      //initialLocation: '/search',
    ),
    MyCustomBottomNavBarItem(
      icon: Icon(Icons.add_circle_outline_rounded),
      activeIcon: Icon(Icons.add_circle_outline_rounded),
      label: 'UPLOAD',
      //initialLocation: '/upload',
    ),
    MyCustomBottomNavBarItem(
      icon: Icon(Icons.favorite),
      activeIcon: Icon(Icons.favorite),
      label: 'FAVORITE',
      //initialLocation: '/favorite',
    ),
    MyCustomBottomNavBarItem(
      icon: Icon(Icons.account_circle_outlined),
      activeIcon: Icon(Icons.account_circle),
      label: 'PROFILE',
      //initialLocation: '/profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    const labelStyle = TextStyle(fontFamily: 'Roboto');
    final position = ref.watch(dashboardControllerProvider);
    return
        //body: SafeArea(child: widget.child),
        BottomNavigationBar(
      currentIndex: position,
      selectedLabelStyle: labelStyle,
      unselectedLabelStyle: labelStyle,
      selectedItemColor: const Color(0xFF434343),
      selectedFontSize: 12,
      unselectedItemColor: const Color(0xFF838383),
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        _goOtherTab(index);
      },
      // currentIndex: widget.location == '/'
      //     ? 0
      //     : widget.location == '/search'
      //         ? 1
      //         : widget.location == '/upload'
      //             ? 2
      //             : widget.location == '/favorite'
      //                 ? 3
      //                 : 4,
      items: tabs,
    );
  }

  void _goOtherTab(int index) {
    ref.read(dashboardControllerProvider.notifier).setPosition(index);

    switch (index) {
      case 0:
        context.go('/');
        log("Successfuly navigated to : /");
        break;
      case 1:
        context.go('/search');
        log("Successfuly navigated to : /search");
        break;
      case 2:
        context.go('/upload');
        log("Successfuly navigated to : /upload");
        break;
      case 3:
        context.go('/favorite');
        log("Successfuly navigated to : /favorite");
        break;
      case 4:
        context.go('/profile');
        log("Successfuly navigated to : /profile");
        break;
      default:
    }
  }
  //   if (index == _currentIndex) return;
  //   GoRouter router = GoRouter.of(context);
  //   String location = tabs[index].initialLocation;

  //   setState(() {
  //     _currentIndex = index;
  //   });
  //   if (index == 4) {
  //     context.push('/profile');
  //   } else {
  //     router.go(location);
  //   }
  // }
}

class MyCustomBottomNavBarItem extends BottomNavigationBarItem {
  //final String initialLocation;

  const MyCustomBottomNavBarItem(
      {
      //required this.initialLocation,
      required Widget icon,
      String? label,
      Widget? activeIcon})
      : super(icon: icon, label: label, activeIcon: activeIcon ?? icon);
}
