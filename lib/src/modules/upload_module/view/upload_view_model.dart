import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:havenfinder/src/realm/app_services.dart';
import 'package:havenfinder/src/realm/realm_services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:realm/realm.dart';

class PropertyUploadPage extends StatefulWidget {
  @override
  _PropertyUploadPageState createState() => _PropertyUploadPageState();
}

class _PropertyUploadPageState extends State<PropertyUploadPage> {
  final _formKey = GlobalKey<FormState>();

  late String _title;
  late double _price;
  late String _location;
  late String _type;
  late String _availability;
  late String _description;
  late List<String> _images = [];
  late String _phoneNumber;

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<AppServices>(context).currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Upload Property'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Basic Information',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter title',
                    labelText: 'Title',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _title = value!;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter price',
                    labelText: 'Price',
                  ),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a price';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _price = double.tryParse(value!) ?? 0.0;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter location',
                    labelText: 'Location',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a location';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _location = value!;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter type',
                    labelText: 'Type',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a type';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _type = value!;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter availability',
                    labelText: 'Availability',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter availability';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _availability = value!;
                  },
                ),
                const SizedBox(height: 10),
                TextFormField(
                  maxLines: null,
                  decoration: const InputDecoration(
                    hintText: 'Enter description',
                    labelText: 'Description',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a description';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _description = value!;
                  },
                ),
                const SizedBox(height: 20),
                const Text(
                  'Photos',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  //   onPressed: () async {
                  //     final picker = ImagePicker();
                  //     final pickedFile =
                  //         await picker.getImage(source: ImageSource.gallery);

                  //     String uniqueFileName =
                  //         DateTime.now().millisecondsSinceEpoch.toString();
                  //     // Get a reference to storage root
                  //     Reference referenceRoot = FirebaseStorage.instance.ref();
                  //     Reference referenceDirImages =
                  //         referenceRoot.child('images');

                  //     if (pickedFile != null) {
                  //       //Create a reference for the image to be stored
                  //       Reference referenceImageToUpload =
                  //           referenceDirImages.child(pickedFile.path);

                  //       try {
                  //         await referenceImageToUpload
                  //             .putFile(File(pickedFile.path));

                  //         setState(() async {
                  //           _images.add(
                  //               await referenceImageToUpload.getDownloadURL());

                  //         });
                  //       } catch (error) {
                  //         print(error.toString());
                  //       }
                  //     }
                  //   },
                  //   child: const Text('Select photos'),
                  // ),
                  onPressed: () async {
                    final picker = ImagePicker();
                    final pickedFile =
                        await picker.getImage(source: ImageSource.gallery);

                    if (pickedFile != null) {
                      // Generate a unique file name
                      String uniqueFileName =
                          DateTime.now().millisecondsSinceEpoch.toString();

                      // Get a reference to storage root
                      Reference referenceRoot = FirebaseStorage.instance.ref();

                      // Create a reference for the directory to store images
                      Reference referenceDirImages =
                          referenceRoot.child('images');

                      // Create a reference for the image to be stored, using the unique file name
                      Reference referenceImageToUpload =
                          referenceDirImages.child(uniqueFileName);

                      try {
                        // Upload the image to Firebase Storage
                        await referenceImageToUpload
                            .putFile(File(pickedFile.path));

                        // Add the image URL to the list of images
                        setState(() async {
                          _images.add(
                              await referenceImageToUpload.getDownloadURL());
                          print(_images);
                        });
                      } catch (error) {
                        print(error.toString());
                      }
                    }
                  },
                  child: const Text('Select photos'),
                ),
                const SizedBox(height: 10),
                GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  children: _images
                      .map(
                        (imagePath) => Image.network(
                          imagePath,
                          fit: BoxFit.cover,
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Contact Information',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  decoration: const InputDecoration(
                    hintText: 'Enter phone number',
                    labelText: 'Phone Number',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a phone number';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _phoneNumber = value!;
                  },
                ),
                const SizedBox(height: 20),
                Center(child: Consumer<RealmServices>(
                  builder: (context, realmServices, child) {
                    return ElevatedButton(
                      onPressed: () async =>
                          _submit(realmServices, currentUser),
                      child: const Text('Submit'),
                    );
                  },
                )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit(RealmServices realmServices, User? currentUser) {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    realmServices.createProperty(
        ObjectId(),
        _description,
        _phoneNumber,
        _price,
        _type,
        _availability,
        _title,
        _location,
        currentUser!.id,
        false,
        _images);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Property uploaded successfully!'),
        duration: Duration(seconds: 2),
      ),
    );
    context.go('/');
  }
}
