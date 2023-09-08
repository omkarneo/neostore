import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neostore/view/registerpage/widget/checkbox.dart';
import 'package:neostore/view/registerpage/widget/textbox.dart';

import '../../viewmodel/register/registerprovider.dart';

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
  String? gender = "M";
  bool? check = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE91C1A),
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
          "Register",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        backgroundColor: const Color(0xffE91C1A),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: Form(
              key: _formKey,
              child: Column(children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
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
                Consumer(builder: (context, ref, child) {
                  gender = ref.watch(registerprovider).gender;
                  return Padding(
                    padding: const EdgeInsets.only(top: 5, left: 25, right: 20),
                    child: Row(
                      children: [
                        const Text(
                          "Gender",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                        Radio(
                            activeColor: Colors.white,
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => Colors.white),
                            value: "M",
                            groupValue: gender,
                            onChanged: (value) {
                              //  Set/selected value
                              ref.read(registerprovider).genderaction(value);
                            }),
                        const Text(
                          "Male",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        // const Spacer(),
                        Radio(
                            activeColor: Colors.white,
                            value: "F",
                            groupValue: gender,
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => Colors.white),
                            onChanged: (value) {
                              ref.read(registerprovider).genderaction(value);
                            }),
                        const Text(
                          "Female",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                        const Spacer(),
                      ],
                    ),
                  );
                }),
                TextBox(
                  label: "Phone Number",
                  controller: confirmspassword,
                  icon: Icons.mobile_friendly_sharp,
                  validation: (value) {
                    var noValid = RegExp(r"^(?:[+0]9)?[0-9]{10}$");
                    if (noValid.hasMatch(value!)) {
                      return null;
                    }
                    return "Please Enter Valid mail";
                  },
                ),
                Padding(
                    padding: EdgeInsets.only(top: 20, left: 25, right: 20),
                    child: Checkbox1(
                      extract: (bool val) {
                        check = val;
                      },
                      // selected: check!,
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: Consumer(
                      builder: (context, ref, child) => ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xffffffff),
                            fixedSize:
                                Size(MediaQuery.sizeOf(context).width - 40, 60),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10))),
                        child: const Text(
                          "REGISTER",
                          style:
                              TextStyle(fontSize: 30, color: Color(0xffE91C1A)),
                        ),
                        onPressed: () async {
                          print(gender);
                          print(check);
                          // if (_formKey.currentState!.validate()) {
                          //   var response =
                          //       await ref.read(registerprovider).register({
                          //     "first_name": firstname.text,
                          //     "last_name": lastname.text,
                          //     "email": email.text,
                          //     "password": password.text,
                          //     "confirm_password": confirmspassword.text,
                          //     "gender": gender,
                          //     "phone_no": phoneno.text
                          //   });
                          //   if (context.mounted) {
                          //     registerOrNot(response, context);
                          //   }
                          // }
                        },
                      ),
                    ),
                  ),
                ),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}

void registerOrNot(response, context) {
  if (response == 200) {
    final snackBar = SnackBar(content: Text("${response["user_msg"]}"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
