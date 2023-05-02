import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:havenfinder/src/core/components/responsive/responsive_layout_builder.dart';
import 'package:havenfinder/src/core/components/widget/property_card.dart';
import 'package:havenfinder/src/core/components/widget/search_field.dart';
import 'package:havenfinder/src/core/components/widget/widgets.dart';
import 'package:havenfinder/src/core/theme/constants.dart';
import 'package:havenfinder/src/realm/realm_services.dart';
import 'package:havenfinder/src/realm/schemas.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';
//import 'package:havenfinder/src/modules/items_module/presenter/provider/items_search_provider.dart';
//import 'package:havenfinder/src/modules/items_module/presenter/view_model/items_search_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final realmServices = Provider.of<RealmServices>(context);
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
                              children: [
                                Row(
                                  children: [
                                    Text("Location ˯"),
                                    Text(
                                        "Welcome ${realmServices.currentUser.profile.email.toString()}")
                                  ],
                                ),
                                Text("📍 Beirut,Lebanon"),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsetsDirectional.only(
                              start: 10,
                              end: 10,
                            ),
                            child:
                                //SearchField(),

                                TextField(
                              controller: searchController,
                              decoration: const InputDecoration(
                                hintText: 'Search',
                                prefixIcon: Icon(Icons.search),
                              ),
                              onSubmitted: (value) {
                                // Call the filtering function
                                realmServices.filterProperties(value);
                              },
                            ),
                          ),
                        ],
                      ))),
              body: Column(
                children: [
                  Text("Recently added"),
                  // Container(
                  //   color: Colors.red,
                  //   height: 200,
                  //   width: width,
                  // ),
                  // Container(
                  //   color: Color.fromARGB(255, 130, 0, 0),
                  //   width: width,
                  //   height: 50,
                  // ),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.all(16.0),
                      textStyle: const TextStyle(fontSize: 20),
                    ),
                    onPressed: () => context.go('/login'),
                    child: const Text('Login'),
                  ),
                  // Switch(
                  //   value: realmServices.showAll,
                  //   onChanged: (value) async {
                  //     if (realmServices.offlineModeOn) {
                  //       infoMessageSnackBar(context,
                  //               "Switching subscriptions does not affect Realm data when the sync is offline.")
                  //           .show(context);
                  //     }
                  //     await realmServices.switchSubscription(value);
                  //   },
                  // ),

                  // Expanded(
                  //   child: StreamBuilder<RealmResultsChanges<Property>>(
                  //     stream: realmServices.realm.all<Property>().changes,
                  //     builder: (context, snapshot) {
                  //       final data = snapshot.data;

                  //       if (data == null) return waitingIndicator();

                  //       final results = data.results;
                  //       return ListView.builder(
                  //         shrinkWrap: true,
                  //         itemCount:
                  //             results.realm.isClosed ? 0 : results.length,
                  //         itemBuilder: (context, index) =>
                  //             results[index].isValid
                  //                 ? PropertyCard(
                  //                     ownerId: results[index].ownerId,
                  //                     title: results[index].title,
                  //                     price: results[index].price,
                  //                     location: results[index].location,
                  //                     availability: results[index].availability,
                  //                     description: results[index].description,
                  //                     type: results[index].type,
                  //                     images: results[index].images,
                  //                     phoneNumber: results[index].phone_number,
                  //                   )
                  //                 : Container(),
                  //       );
                  //     },
                  //   ),
                  // ),
                  Expanded(
                    child: StreamBuilder<RealmResultsChanges<Property>>(
                      stream:
                          realmServices.filterProperties(searchController.text),
                      builder: (context, snapshot) {
                        final data = snapshot.data;

                        if (data == null) return waitingIndicator();

                        final results = data.results;
                        return ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              results.realm.isClosed ? 0 : results.length,
                          itemBuilder: (context, index) =>
                              results[index].isValid
                                  ? PropertyCard(
                                      ownerId: results[index].ownerId,
                                      title: results[index].title,
                                      price: results[index].price,
                                      location: results[index].location,
                                      availability: results[index].availability,
                                      description: results[index].description,
                                      type: results[index].type,
                                      images: results[index].images,
                                      phoneNumber: results[index].phone_number,
                                    )
                                  : Container(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ));
  }
}
