import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neostore/core/Navigation/route_paths.dart';
import 'package:neostore/core/utils/shared_preference.dart';
import '../../viewmodel/login/loginprovider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    alreadytoken(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE91C1A),
      body: SingleChildScrollView(
        // physics: AlwaysScrollableScrollPhysics(),
        child: SizedBox(
          // height: MediaQuery.sizeOf(context).height,
          height: (MediaQuery.of(context).orientation == Orientation.portrait)
              ? MediaQuery.sizeOf(context).height
              : MediaQuery.sizeOf(context).width,
          width: MediaQuery.sizeOf(context).width,
          child: Form(
            key: _formKey,
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.sp,
                children: [
                  const Spacer(),
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
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: TextFormField(
                          controller: email,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              hintText: "Email",
                              hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1.5),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1.5),
                              ),
                              errorStyle: TextStyle(color: Colors.white)),
                          validator: (value) {
                            var emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                            if (emailValid.hasMatch(value!)) {
                              return null;
                            }
                            return "Please Enter Valid mail";
                          },
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 10, left: 20, right: 20),
                        child: TextFormField(
                          controller: password,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.white,
                              ),
                              hintText: "Password",
                              hintStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1.5),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1.5),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.white, width: 1.5),
                              ),
                              errorStyle: TextStyle(color: Colors.white)),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 35),
                        child: Center(
                          child: Consumer(
                            builder: (context, ref, child) => ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffffffff),
                                  fixedSize: Size(
                                      MediaQuery.sizeOf(context).width - 40,
                                      60),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10))),
                              child: const Text(
                                "LOGIN",
                                style: TextStyle(
                                    fontSize: 30, color: Color(0xffE91C1A)),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  var response = await ref
                                      .read(loginprovider)
                                      .getlogin({
                                    "email": email.text,
                                    "password": password.text
                                  });
                                  if (context.mounted) {
                                    loginOrNot(response, context);
                                  }
                                }
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: InkWell(
                          child: const Text("Forgot Password?",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white)),
                          onTap: () {
                            Navigator.pushNamed(
                                context, RoutePaths.forgotpasswordpage);
                          },
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Text("DONT HAVE AN ACCOUNT?",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        const Spacer(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            fixedSize: const Size(2, 50),
                            backgroundColor: const Color(0xff9e0100),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(
                                context, RoutePaths.registerpage);
                          },
                          child: const Icon(
                            Icons.add,
                            color: Color(0xffffffff),
                            size: 35,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}

void loginOrNot(response, context) {
  if (response['status'] == 200) {
    Navigator.pushNamed(context, RoutePaths.dashboard);
  } else if (response['status'] == 401) {
    final snackBar = SnackBar(content: Text("${response["user_msg"]}"));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

alreadytoken(context) {
  SchedulerBinding.instance.addPostFrameCallback((_) {
    if (LocalPreference.getProfile() != "") {
      Navigator.pushNamed(context, RoutePaths.dashboard);
    }
  });
}
