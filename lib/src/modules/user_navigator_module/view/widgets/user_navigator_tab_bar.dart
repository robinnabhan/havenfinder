// import 'package:flutter/material.dart';
// import 'package:havenfinder/src/core/theme/constants.dart';

// class UserNavigatorTabBar extends StatelessWidget {
//   const UserNavigatorTabBar({
//     Key? key,
//     required this.currentIndex,
//     required this.onTap,
//     required this.height,
//     required this.width,
//   }) : super(key: key);

//   final double height;
//   final double width;
//   final int currentIndex;
//   final void Function(int) onTap;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Theme.of(context).scaffoldBackgroundColor,
//         // borderRadius: const BorderRadiusDirectional.only(
//         //   topStart: Radius.circular(10),
//         //   topEnd: Radius.circular(10),
//         // ),
//         // boxShadow: [
//         //   BoxShadow(
//         //       color: Theme.of(context).shadowColor,
//         //       offset: const Offset(0, 0),
//         //       blurRadius: 25),
//         // ],
//         border: const Border(
//           top: BorderSide(color: Color(0xFFF2F2F2), width: 1.0),
//         ),
//       ),
//       child:
//           // ClipRRect(
//           //   borderRadius: const BorderRadius.only(
//           //     topLeft: Radius.circular(10.0),
//           //     topRight: Radius.circular(10.0),
//           //   ),
//           //   child:
//           BottomNavigationBar(
//         currentIndex: currentIndex,
//         items: [
//           BottomNavigationBarItem(
//             label: "Explore",
//             icon: Padding(
//                 padding: Constant.tabBarIconPadding(
//                   height: height,
//                 ),
//                 child: const Icon(Icons.ac_unit)
//                 // const ImageIcon(
//                 //   AssetImage(
//                 //     'assets/icons/dashboard_icon.png',
//                 //   ),
//                 // ),
//                 ),
//           ),
//           BottomNavigationBarItem(
//             label: "Categories",
//             icon: Padding(
//                 padding: Constant.tabBarIconPadding(
//                   height: height,
//                 ),
//                 child: const Icon(Icons.ac_unit)
//                 // const ImageIcon(
//                 //   AssetImage(
//                 //     'assets/icons/items_icon.png',
//                 //   ),
//                 // ),
//                 ),
//           ),
//           BottomNavigationBarItem(
//             label: "Bag",
//             icon: Padding(
//                 padding: Constant.tabBarIconPadding(
//                   height: height,
//                 ),
//                 child: const Icon(Icons.ac_unit)
//                 // const ImageIcon(
//                 //   AssetImage(
//                 //     'assets/icons/locations_icon.png',
//                 //   ),
//                 // ),
//                 ),
//           ),
//           BottomNavigationBarItem(
//             label: "Saved",
//             icon: Padding(
//                 padding: Constant.tabBarIconPadding(
//                   height: height,
//                 ),
//                 child: const Icon(Icons.ac_unit)
//                 // const ImageIcon(
//                 //   AssetImage(
//                 //     'assets/icons/profile_icon.png',
//                 //   ),
//                 // ),
//                 ),
//           ),
//           BottomNavigationBarItem(
//             label: "Profile",
//             icon: Padding(
//                 padding: Constant.tabBarIconPadding(
//                   height: height,
//                 ),
//                 child: const Icon(Icons.ac_unit)
//                 // const ImageIcon(
//                 //   AssetImage(
//                 //     'assets/icons/profile_icon.png',
//                 //   ),
//                 // ),
//                 ),
//           ),
//         ],
//         onTap: onTap,
//       ),
//       // ),
//     );
//   }
// }
