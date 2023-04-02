import 'package:havenfinder/src/realm/schemas.dart';
import 'package:realm/realm.dart';

class PropertyViewModel {
  final ObjectId id;
  final String ownerId;
  final String title;
  final double price;
  final String location;
  final String type;
  final String availability;
  final String description;
  final List<String> images;
  final String phoneNumber;
  final bool isSold;
  final Realm realm;

  PropertyViewModel._(
      this.realm,
      this.ownerId,
      this.isSold,
      this.title,
      this.price,
      this.location,
      this.type,
      this.availability,
      this.description,
      this.images,
      this.phoneNumber,
      this.id);
  PropertyViewModel(Realm realm, Property property)
      : this._(
            realm,
            property.ownerId,
            property.isSold,
            property.title,
            property.price,
            property.location,
            property.type,
            property.availability,
            property.description,
            property.images,
            property.phone_number,
            property.id);

  static PropertyViewModel create(Realm realm, Property property) {
    final propertyInRealm =
        realm.write<Property>(() => realm.add<Property>(property));
    return PropertyViewModel(realm, property);
  }

  // void delete() {
  //   realm.write(() => realm.delete(property));
  // }

  // void update({String? summary, bool? isComplete}) {
  //   realm.write(() {
  //     if (summary != null) {
  //       summary = summary;
  //       property.summary = summary as String;
  //     }
  //     if (isComplete != null) {
  //       isComplete = isComplete;
  //       property.isComplete = isComplete as bool;
  //     }
  //   });
  // }
}
