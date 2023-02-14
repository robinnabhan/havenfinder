import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:havenfinder/src/core/components/responsive/responsive_layout_builder.dart';
import 'package:havenfinder/src/core/components/widget/search_field.dart';
import 'package:havenfinder/src/core/theme/constants.dart';
//import 'package:havenfinder/src/modules/items_module/presenter/provider/items_search_provider.dart';
//import 'package:havenfinder/src/modules/items_module/presenter/view_model/items_search_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return ResponsiveLayoutBuilder(
        child: (isWeb, isMobile, width, height) => Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                  automaticallyImplyLeading: false,
                  title: Row(
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        fit: BoxFit.contain,
                        height: 50,
                      ),
                    ],
                  ),
                  backgroundColor: Colors.white,
                  shadowColor: Colors.transparent,
                  bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(80.0),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: const [
                                Text("Location ˯"),
                                Text("📍 Beirut,Lebanon"),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsetsDirectional.only(
                              start: 10,
                              end: 10,
                            ),
                            child: SearchField(),
                          ),
                        ],
                      ))),
              body: Column(
                children: [
                  Text("Recently added"),
                  Container(
                    color: Colors.red,
                    height: 200,
                    width: width,
                  ),
                  Container(
                    color: Color.fromARGB(255, 130, 0, 0),
                    width: width,
                    height: 50,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.all(16.0),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () => context.go('/login'),
                    child: const Text('Login'),
                  ),
                ],
              ),
            ));
  }
}
