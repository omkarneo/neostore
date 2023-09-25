// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neostore/core/Navigation/route_paths.dart';
import 'package:neostore/core/utils/shared_preference.dart';
import 'package:neostore/core/utils/staticdata.dart';
import 'package:neostore/view/editprofile/widget/editprofileinput.dart';
import 'package:neostore/viewmodel/account/account_pro.dart';

class EditProfile extends StatefulWidget {
  final userdata;
  const EditProfile({super.key, this.userdata});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  ImagePicker picker = ImagePicker();
  XFile? image;
  String photo = "";
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController phoneno = TextEditingController();
  TextEditingController dob = TextEditingController();
  // TextEditingController photo = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    firstname.text = widget.userdata.firstName;
    lastname.text = widget.userdata.lastName;
    mail.text = widget.userdata.email;
    phoneno.text = widget.userdata.phoneNo;
    dob.text = widget.userdata.dob ?? "";
    // photo.text = widget.userdata.profilePic ?? "";

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_sharp,
            size: 20,
          ),
        ),
        title: const Text(
          "Edit Profile",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        backgroundColor: const Color(0xffE91C1A),
      ),
      backgroundColor: const Color(0xffE91C1A),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height - 90,
            child: Column(children: [
              const SizedBox(
                height: 20,
              ),
              Consumer(builder: (context, ref, child) {
                var data = ref.watch(accountprovider).editimage;
                return Center(
                  child: InkWell(
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        image: DecorationImage(
                          image: (ref.watch(accountprovider).firstflag)
                              ? MemoryImage(base64Decode(data)) as ImageProvider
                              : (data != "")
                                  ? NetworkImage(data)
                                  : const NetworkImage(
                                      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                          fit: BoxFit.fill,
                          colorFilter: ColorFilter.mode(
                              Colors.black.withOpacity(0.7), BlendMode.dstATop),
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(60)),
                        child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Tap To Change Image",
                            style: TextStyle(color: colorPrimaryText),
                          ),
                        ),
                      ),
                    ),
                    onTap: () async {
                      await picker
                          .pickImage(source: ImageSource.gallery)
                          .then((value) {
                        final bytes = File(value!.path).readAsBytesSync();
                        photo = "data:image/jpg;base64,${base64Encode(bytes)}";
                        ref
                            .read(accountprovider)
                            .selectimage(base64Encode(bytes));
                      }).onError((error, stackTrace) => null);
                    },
                  ),
                );
              }),
              const SizedBox(
                height: 20,
              ),
              EditProfileInput(
                controller: firstname,
                icon: Icons.person,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter first name';
                  }
                  return null;
                },
              ),
              EditProfileInput(
                controller: lastname,
                icon: Icons.person,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter last name';
                  }
                  return null;
                },
              ),
              EditProfileInput(
                controller: mail,
                icon: Icons.email,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email';
                  }
                  return null;
                },
              ),
              EditProfileInput(
                controller: phoneno,
                icon: Icons.phone,
                validation: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter phone number';
                  }
                  return null;
                },
              ),
              // EditProfileInput(
              //   controller: photo,
              //   icon: Icons.photo,
              //   validation: null,
              // ),
              EditProfileInput(
                controller: dob,
                icon: Icons.cake,
                validation: null,
              ),
              const SizedBox(
                height: 20,
              ),
              Consumer(
                builder: (context, ref, child) => ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffffffff),
                      fixedSize:
                          Size(MediaQuery.sizeOf(context).width - 40, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    "SUBMIT",
                    style: TextStyle(fontSize: 20, color: Color(0xffE91C1A)),
                  ),
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      // print(photo.text);
                      var snackBar;
                      var res = await ref
                          .read(accountprovider)
                          .updateuser(LocalPreference.getToken(), {
                        "first_name": firstname.text,
                        "last_name": lastname.text,
                        "email": mail.text,
                        "dob": dob.text,
                        "phone_no": phoneno.text,
                        "profile_pic": photo
                      });
                      if (res != "Error") {
                        snackBar = const SnackBar(
                          content: Text('User Detailed Updated'),
                        );
                        Navigator.pushNamedAndRemoveUntil(
                            context, RoutePaths.login, (route) => false);
                      } else {
                        snackBar = const SnackBar(
                          content: Text('Some Error Occured'),
                        );
                      }
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
