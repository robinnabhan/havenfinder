import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:havenfinder/src/core/components/widget/property_card.dart';
import 'package:havenfinder/src/modules/viewmodels/property_viewmodel.dart';
import 'package:havenfinder/src/realm/app_services.dart';
import 'package:realm/realm.dart';
part 'schemas.g.dart';

@RealmModel()
class _Property {
  @MapTo('_id')
  @PrimaryKey()
  late ObjectId id;
  late String description;
  late String phone_number;
  late double price;
  late String type;
  late String availability;
  late List<String> images;
  late String title;
  late String location;
  @MapTo('owner_id')
  late String ownerId;
  late bool isSold;
}

void main(List<String> args) async {
  // get app id from config
  WidgetsFlutterBinding.ensureInitialized();
  final realmConfig =
      json.decode(await rootBundle.loadString('assets/config/realm.json'));

  String appId = realmConfig['appId'];
  Uri baseUrl = Uri.parse(realmConfig['baseUrl']);

  AppServices app = AppServices(appId, baseUrl);
  try {
    await app.logInUserEmailPassword('robinnabhan12345@gmail.com', 'Robin123');

    log("test");
  } catch (e) {
    log(e.toString());
  }

  var config = Configuration.flexibleSync(app.currentUser!, [Property.schema]);

  var realm = Realm(config);

  final userPropertySub = realm.subscriptions.findByName('UserProperties');
  if (userPropertySub == null) {
    realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.add(realm.all<Property>(), name: 'UserProperties');
    });
  }

  final currentUser = app.currentUser;

  ObjectId id_two;
  id_two = ObjectId();
  var myProperty = Property(
      id_two,
      "descriptionnn123",
      "71999222",
      5000000,
      "House",
      "For Sale",
      "Appartment for sale in Hazmieh",
      "Hazmieh",
      currentUser!.id,
      false,
      images: [
        'https://images.unsplash.com/photo-1570129477492-45c003edd2be?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
        'https://images.unsplash.com/photo-1570129477492-45c003edd2be?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
      ]);

  PropertyViewModel.create(realm, myProperty);
  // ItemViewModel.create(realm, Item(ObjectId(), "test2", currentUser.id));
  // ItemViewModel.create(realm, Item(ObjectId(), "test3", currentUser.id));

  print(Configuration.defaultRealmPath);
  print(Configuration.defaultRealmName);
  print(Configuration.defaultStoragePath);

  realm.write(() {
    print("Adding an object to realm");
    // realm.add(Item(ObjectId(), "TEST", "test"));
    // realm.add(Item(ObjectId(), "TEST", "test2"));
    // realm.add(Item(ObjectId(), "TEST", "test3"));
    // print('Adding a _Property to Realm.');
    // var _Property = realm.add(
    //     Property(ObjectId(), "ROBIN", "03212322", "Lebanon", currentUser.id));

    // print("Updating the _Property's model and kilometers");
    // _Property.country = "france";

    print('Adding another _Property to Realm.');
    realm.add(myProperty);
  });

  print("Getting all items");
  var items = realm.all<Property>();

  // var firstitem = items[0];
  // var seconditem = items[1];
  // for (int i = 0; i < items.length; i++) {
  //   print("${i} item summary is : ${items[i].summary}");
  // }

  // print("Getting all _Property from the Realm.");
  // var Propertyes = realm.all<Property>();
  // print("There are ${Propertyes.length} Propertyes in the Realm.");

  // var indexedPropertyes = Propertyes[0];
  // print(
  //     'The first Propertyes is ${indexedPropertyes.name} ${indexedPropertyes.country}');

  // print("Getting all Robin Propertyes from the Realm.");
  // var filteredPropertyes = realm.all<Property>().query("name == 'Robin'");
  // print('Found ${filteredPropertyes.length} Robin _Property');

  realm.close();
  // Realm.shutdown();

  print("Done");
}
