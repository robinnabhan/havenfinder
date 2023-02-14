// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:havenfinder/src/core/components/responsive/responsive_layout_builder.dart';
// import 'package:havenfinder/src/modules/user_module/user_navigator_module/presenter/view_model/user_navigator_viewmodel.dart';
// import 'package:havenfinder/src/modules/user_module/user_navigator_module/view/widgets/user_navigator_tab_bar.dart';
// import 'package:vrouter/vrouter.dart';

// class UserNavigatorView extends ConsumerStatefulWidget {
//   const UserNavigatorView({
//     Key? key,
//     required this.index,
//     required this.child,
//   }) : super(key: key);
//   final int index;
//   final Widget child;
//   @override
//   UserNavigatorViewState createState() => UserNavigatorViewState();
// }

// class UserNavigatorViewState extends ConsumerState<UserNavigatorView>
//     with TickerProviderStateMixin {
//   late final TabController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = TabController(
//       length: tabs.length,
//       vsync: this,
//       initialIndex: widget.index,
//     );

//     _controller.addListener(() {
//       context.vRouter.to(
//         UserNavigatorViewModel.instance.navigationTabsUrl[tabControllerIndex],
//       );
//     });
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   /* *** *** Variables *** *** */
//   List<Widget> tabs = [
//     Container(),
//     Container(),
//     Container(),
//     Container(),
//     Container(),
//   ];
//   int get tabControllerIndex =>
//       _controller.index + _controller.offset.sign.toInt();

//   /* *** *** Build *** *** */
//   @override
//   Widget build(BuildContext context) {
//     // Sync the tabController with the url
//     if (!_controller.indexIsChanging && tabControllerIndex != widget.index) {
//       _controller.animateTo(widget.index);
//     }
//     tabs[widget.index] = widget.child;
//     tabs = List.from(tabs); // Needed so that TabBarView updates its children

//     return ResponsiveLayoutBuilder(
//       child: (isWeb, isMobile, width, height) => GestureDetector(
//         onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//         child: Scaffold(
//           extendBody: true,
//           resizeToAvoidBottomInset: false,
//           floatingActionButton: FloatingActionButton(
//             onPressed: () =>
//                 context.vRouter.to('/shop/home', isReplacement: true),
//             child: const Text('shop'),
//           ),
//           body: TabBarView(
//             physics: UserNavigatorViewModel
//                         .instance.navigationTabsUrl[tabControllerIndex]
//                         .split('/')
//                         .length <
//                     3
//                 ? const ClampingScrollPhysics()
//                 : const NeverScrollableScrollPhysics(),
//             controller: _controller,
//             children: tabs,
//           ),
//           bottomNavigationBar:
//               //  isMobile
//               //     ? null
//               //     :
//               UserNavigatorTabBar(
//             width: width,
//             height: height,
//             currentIndex: _controller.index,
//             onTap: (index) {
//               if (UserNavigatorViewModel
//                           .instance.navigationTabsUrl[tabControllerIndex]
//                           .split('/')
//                           .length >
//                       1 &&
//                   _controller.index == index) {
//                 UserNavigatorViewModel
//                         .instance.navigationTabsUrl[tabControllerIndex] =
//                     "/${UserNavigatorViewModel.instance.navigationTabsUrl[tabControllerIndex].split('/')[1]}";
//                 context.vRouter.to(UserNavigatorViewModel
//                     .instance.navigationTabsUrl[tabControllerIndex]);
//               } else {
//                 _controller.animateTo(index);
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
