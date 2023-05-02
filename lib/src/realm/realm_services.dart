// // import 'package:flutter_todo/realm/schemas.dart';
// import 'package:havenfinder/src/realm/schemas.dart';
// import 'package:realm/realm.dart';
// import 'package:flutter/material.dart';

// class RealmServices with ChangeNotifier {
//   static const String queryAllName = "getAllPropertiesSubscription";
//   //static const String queryMyItemsName = "getMyItemsSubscription";

//   bool showAll = false;
//   bool offlineModeOn = false;
//   bool isWaiting = false;
//   late Realm realm;
//   User? currentUser;
//   App app;

//   RealmServices(this.app) {
//     if (app.currentUser != null || currentUser != app.currentUser) {
//       currentUser ??= app.currentUser;
//       realm =
//           Realm(Configuration.flexibleSync(currentUser!, [Property.schema]));
//       // showAll = (realm.subscriptions.findByName(queryAllName) != null);
//       if (realm.subscriptions.isEmpty) {
//         updateSubscriptions();
//       }
//       realm.subscriptions.update(
//         (mutableSubscriptions) {
//           mutableSubscriptions.clear();
//           mutableSubscriptions.add(realm.all<Property>(), name: queryAllName);
//         },
//       );
//       // Add subscription to sync all Car objects in the realm
//       // realm.subscriptions.update((mutableSubscriptions) {
//       //   mutableSubscriptions.add(realm.all<Property>());
//       // }
//       //);
// // Sync all subscriptions
//       realm.subscriptions.waitForSynchronization();
//     }
//   }

//   Future<void> updateSubscriptions() async {
//     realm.subscriptions.update((mutableSubscriptions) {
//       mutableSubscriptions.clear();
//       if (showAll) {
//         mutableSubscriptions.add(realm.all<Property>(), name: queryAllName);
//       }
//       // else {
//       //   mutableSubscriptions.add(
//       //       realm.query<Item>(r'owner_id == $0', [currentUser?.id]),
//       //       name: queryMyItemsName);
//       // }
//     });
//     await realm.subscriptions.waitForSynchronization();
//   }

//   Future<void> sessionSwitch() async {
//     offlineModeOn = !offlineModeOn;
//     if (offlineModeOn) {
//       realm.syncSession.pause();
//     } else {
//       try {
//         isWaiting = true;
//         notifyListeners();
//         realm.syncSession.resume();
//         await updateSubscriptions();
//       } finally {
//         isWaiting = false;
//       }
//     }
//     notifyListeners();
//   }

//   Future<void> switchSubscription(bool value) async {
//     showAll = value;
//     if (!offlineModeOn) {
//       try {
//         isWaiting = true;
//         notifyListeners();
//         await updateSubscriptions();
//       } finally {
//         isWaiting = false;
//       }
//     }
//     notifyListeners();
//   }

//   void createProperty(
//       ObjectId id,
//       String description,
//       String phone_number,
//       double price,
//       String type,
//       String availability,
//       String title,
//       String location,
//       String ownerId,
//       bool isSold,
//       List<String> images) {
//     final newProperty = Property(id, description, phone_number, price, type,
//         availability, title, location, ownerId, isSold,
//         images: images);
//     realm.write<Property>(() => realm.add<Property>(newProperty));
//     notifyListeners();
//   }

//   // static PropertyViewModel create(Realm realm, Property property) {
//   //   final propertyInRealm =
//   //       realm.write<Property>(() => realm.add<Property>(property));
//   //   return PropertyViewModel(realm, property);
//   // }

//   // void deleteItem(Item item) {
//   //   realm.write(() => realm.delete(item));
//   //   notifyListeners();
//   // }

//   // Future<void> updateItem(Item item,
//   //     {String? summary, bool? isComplete}) async {
//   //   realm.write(() {
//   //     if (summary != null) {
//   //       item.summary = summary;
//   //     }
//   //     if (isComplete != null) {
//   //       item.isComplete = isComplete;
//   //     }
//   //   });
//   //   notifyListeners();
//   // }

//   Future<void> close() async {
//     if (currentUser != null) {
//       await currentUser?.logOut();
//       currentUser = null;
//     }
//     realm.close();
//   }

//   @override
//   void dispose() {
//     realm.close();
//     super.dispose();
//   }
// }
import 'package:havenfinder/src/realm/schemas.dart';
import 'package:realm/realm.dart';
import 'package:flutter/material.dart';

class RealmServices with ChangeNotifier {
  static const String queryAllName = "getAllPropertiesSubscription";
  late final Realm realm;
  late final App app;
  late final User currentUser;

  bool showAll = false;
  bool offlineModeOn = false;
  bool isWaiting = false;

  RealmServices(this.app) : currentUser = app.currentUser! {
    realm = Realm(Configuration.flexibleSync(currentUser, [Property.schema]));
    if (realm.subscriptions.isEmpty) {
      updateSubscriptions();
    }
    realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.clear();
      mutableSubscriptions.add(realm.all<Property>(), name: queryAllName);
    });
    realm.subscriptions.waitForSynchronization();
  }

  Future<void> updateSubscriptions() async {
    realm.subscriptions.update((mutableSubscriptions) {
      mutableSubscriptions.clear();
      if (showAll) {
        mutableSubscriptions.add(realm.all<Property>(), name: queryAllName);
      }
    });
    await realm.subscriptions.waitForSynchronization();
  }

  Future<void> sessionSwitch() async {
    offlineModeOn = !offlineModeOn;
    if (offlineModeOn) {
      realm.syncSession.pause();
    } else {
      try {
        isWaiting = true;
        notifyListeners();
        realm.syncSession.resume();
        await updateSubscriptions();
      } finally {
        isWaiting = false;
      }
    }
    notifyListeners();
  }

  Future<void> switchSubscription(bool value) async {
    showAll = value;
    if (!offlineModeOn) {
      try {
        isWaiting = true;
        notifyListeners();
        await updateSubscriptions();
      } finally {
        isWaiting = false;
      }
    }
    notifyListeners();
  }

  void createProperty(
      ObjectId id,
      String description,
      String phoneNumber,
      double price,
      String type,
      String availability,
      String title,
      String location,
      String ownerId,
      bool isSold,
      List<String> images) {
    final newProperty = Property(
      id,
      description,
      phoneNumber,
      price,
      type,
      availability,
      title,
      location,
      ownerId,
      isSold,
      images: images,
    );
    realm.write(() => realm.add<Property>(newProperty));
    notifyListeners();
  }

  Stream<RealmResultsChanges<Property>> filterProperties(String query) {
    if (query.isEmpty) {
      return realm.all<Property>().changes;
    }
    print(realm.all<Property>());
    print(Property.schema.properties);

    final filteredProperties = realm.all<Property>().query(
          'title CONTAINS[c] "$query" OR description CONTAINS[c] "$query"',
          //'title == $query OR description CONTAINS[c] $query',
        );
    print("-----------------------------------------------");
    print(filteredProperties);
    print(filteredProperties.changes.toString());
    print(filteredProperties.changes.toList());
    print('------------------------------------------------');
    return filteredProperties.changes;
  }

  Future<void> close() async {
    await currentUser.logOut();
    realm.close();
  }

  @override
  void dispose() {
    realm.close();
    super.dispose();
  }
}
