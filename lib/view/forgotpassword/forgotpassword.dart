import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neostore/viewmodel/login/loginprovider.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController mail = TextEditingController();
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
          "Reset Password",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        backgroundColor: const Color(0xffE91C1A),
      ),
      backgroundColor: const Color(0xffE91C1A),
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const Padding(
          padding: EdgeInsets.only(bottom: 30),
          child: Text(
            "NeoSTORE",
            style: TextStyle(
                fontSize: 50, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: TextFormField(
            controller: mail,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.mail,
                  color: Colors.white,
                ),
                hintText: "Email",
                hintStyle: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.normal),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.5),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 1.5),
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
        Consumer(
          builder: (context, ref, child) => Padding(
            padding: const EdgeInsets.only(top: 35),
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffffffff),
                    fixedSize: Size(MediaQuery.sizeOf(context).width - 40, 60),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: const Text(
                  "LOGIN",
                  style: TextStyle(fontSize: 30, color: Color(0xffE91C1A)),
                ),
                onPressed: () async {
                  var data = ref
                      .read(loginprovider)
                      .forgotpassword({"email": mail.text});
                  var snackBar = SnackBar(
                    content: Text(data['user_msg']),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
