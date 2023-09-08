import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neostore/view/registerpage/widget/textbox.dart';

import '../../core/Navigation/route_paths.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmspassword = TextEditingController();
  TextEditingController phoneno = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE91C1A),
      appBar: AppBar(
        centerTitle: true,
        shadowColor: Colors.transparent,
        leading: const Icon(
          Icons.arrow_back_ios_new_sharp,
          size: 20,
        ),
        title: const Text(
          "Register",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        backgroundColor: const Color(0xffE91C1A),
      ),
      body: SizedBox(
        child: Form(
          key: _formKey,
          child: Column(
              // mainAxisAlignment: MainAxisAlignment.sp,
              children: [
                Spacer(),
                Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(bottom: 30),
                      child: Text(
                        "NeoSTORE",
                        style: TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    TextBox(
                      label: "First Name",
                      controller: firstname,
                      icon: Icons.person,
                      validation: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextBox(
                      label: "Last Name",
                      controller: lastname,
                      icon: Icons.person,
                      validation: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextBox(
                      label: "Email",
                      controller: email,
                      icon: Icons.email,
                      validation: (value) {
                        var emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                        if (emailValid.hasMatch(value!)) {
                          return null;
                        }
                        return "Please Enter Valid mail";
                      },
                    ),
                    TextBox(
                      label: "Password",
                      controller: password,
                      icon: Icons.lock,
                      validation: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextBox(
                      label: "Confirm Password",
                      controller: confirmspassword,
                      icon: Icons.lock,
                      validation: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    TextBox(
                      label: "Phone Number",
                      controller: confirmspassword,
                      icon: Icons.mobile_friendly_sharp,
                      validation: (value) {
                        var emailValid = RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                        if (emailValid.hasMatch(value!)) {
                          return null;
                        }
                        return "Please Enter Valid mail";
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: Center(
                        child: Consumer(
                          builder: (context, ref, child) => ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xffffffff),
                                fixedSize: Size(
                                    MediaQuery.sizeOf(context).width - 40, 60),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            child: const Text(
                              "REGISTER",
                              style: TextStyle(
                                  fontSize: 30, color: Color(0xffE91C1A)),
                            ),
                            onPressed: () async {},
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ]),
        ),
      ),
    );
  }
}
