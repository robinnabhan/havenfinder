// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schemas.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class Property extends _Property
    with RealmEntity, RealmObjectBase, RealmObject {
  Property(
    ObjectId id,
    String description,
    String phone_number,
    double price,
    String type,
    String availability,
    String title,
    String location,
    String ownerId,
    bool isSold, {
    Iterable<String> images = const [],
  }) {
    RealmObjectBase.set(this, '_id', id);
    RealmObjectBase.set(this, 'description', description);
    RealmObjectBase.set(this, 'phone_number', phone_number);
    RealmObjectBase.set(this, 'price', price);
    RealmObjectBase.set(this, 'type', type);
    RealmObjectBase.set(this, 'availability', availability);
    RealmObjectBase.set(this, 'title', title);
    RealmObjectBase.set(this, 'location', location);
    RealmObjectBase.set(this, 'owner_id', ownerId);
    RealmObjectBase.set(this, 'isSold', isSold);
    RealmObjectBase.set<RealmList<String>>(
        this, 'images', RealmList<String>(images));
  }

  Property._();

  @override
  ObjectId get id => RealmObjectBase.get<ObjectId>(this, '_id') as ObjectId;
  @override
  set id(ObjectId value) => RealmObjectBase.set(this, '_id', value);

  @override
  String get description =>
      RealmObjectBase.get<String>(this, 'description') as String;
  @override
  set description(String value) =>
      RealmObjectBase.set(this, 'description', value);

  @override
  String get phone_number =>
      RealmObjectBase.get<String>(this, 'phone_number') as String;
  @override
  set phone_number(String value) =>
      RealmObjectBase.set(this, 'phone_number', value);

  @override
  double get price => RealmObjectBase.get<double>(this, 'price') as double;
  @override
  set price(double value) => RealmObjectBase.set(this, 'price', value);

  @override
  String get type => RealmObjectBase.get<String>(this, 'type') as String;
  @override
  set type(String value) => RealmObjectBase.set(this, 'type', value);

  @override
  String get availability =>
      RealmObjectBase.get<String>(this, 'availability') as String;
  @override
  set availability(String value) =>
      RealmObjectBase.set(this, 'availability', value);

  @override
  RealmList<String> get images =>
      RealmObjectBase.get<String>(this, 'images') as RealmList<String>;
  @override
  set images(covariant RealmList<String> value) =>
      throw RealmUnsupportedSetError();

  @override
  String get title => RealmObjectBase.get<String>(this, 'title') as String;
  @override
  set title(String value) => RealmObjectBase.set(this, 'title', value);

  @override
  String get location =>
      RealmObjectBase.get<String>(this, 'location') as String;
  @override
  set location(String value) => RealmObjectBase.set(this, 'location', value);

  @override
  String get ownerId => RealmObjectBase.get<String>(this, 'owner_id') as String;
  @override
  set ownerId(String value) => RealmObjectBase.set(this, 'owner_id', value);

  @override
  bool get isSold => RealmObjectBase.get<bool>(this, 'isSold') as bool;
  @override
  set isSold(bool value) => RealmObjectBase.set(this, 'isSold', value);

  @override
  Stream<RealmObjectChanges<Property>> get changes =>
      RealmObjectBase.getChanges<Property>(this);

  @override
  Property freeze() => RealmObjectBase.freezeObject<Property>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(Property._);
    return const SchemaObject(ObjectType.realmObject, Property, 'Property', [
      SchemaProperty('id', RealmPropertyType.objectid,
          mapTo: '_id', primaryKey: true),
      SchemaProperty('description', RealmPropertyType.string),
      SchemaProperty('phone_number', RealmPropertyType.string),
      SchemaProperty('price', RealmPropertyType.double),
      SchemaProperty('type', RealmPropertyType.string),
      SchemaProperty('availability', RealmPropertyType.string),
      SchemaProperty('images', RealmPropertyType.string,
          collectionType: RealmCollectionType.list),
      SchemaProperty('title', RealmPropertyType.string),
      SchemaProperty('location', RealmPropertyType.string),
      SchemaProperty('ownerId', RealmPropertyType.string, mapTo: 'owner_id'),
      SchemaProperty('isSold', RealmPropertyType.bool),
    ]);
  }
}
