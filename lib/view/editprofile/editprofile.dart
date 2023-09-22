import 'package:flutter/material.dart';
import 'package:neostore/view/editprofile/widget/editprofileinput.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
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
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height - 90,
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            Center(
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  image: const DecorationImage(
                      image: NetworkImage(
                          "https://www.shutterstock.com/image-photo/head-shot-portrait-close-smiling-250nw-1714666150.jpg"),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const EditProfileInput(
              label: "First Name",
              icon: Icons.person,
            ),
            const EditProfileInput(
              label: "Last Name",
              icon: Icons.person,
            ),
            const EditProfileInput(
              label: "Mail",
              icon: Icons.email,
            ),
            const EditProfileInput(
              label: "Phone Number",
              icon: Icons.phone,
            ),
            const EditProfileInput(
              label: "DOB",
              icon: Icons.cake,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffffffff),
                  fixedSize: Size(MediaQuery.sizeOf(context).width - 40, 60),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              child: const Text(
                "SUBMIT",
                style: TextStyle(fontSize: 20, color: Color(0xffE91C1A)),
              ),
              onPressed: () async {},
            ),
          ]),
        ),
      ),
    );
  }
}
