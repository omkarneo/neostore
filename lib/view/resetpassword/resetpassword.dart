import 'package:flutter/material.dart';
import 'package:neostore/view/resetpassword/widget/resetinput.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  TextEditingController oldpass = TextEditingController();
  TextEditingController newpass = TextEditingController();
  TextEditingController conpass = TextEditingController();
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
      body: Column(children: [
        const SizedBox(
          height: 30,
        ),
        const Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 30),
            child: Text(
              "NeoSTORE",
              style: TextStyle(
                  fontSize: 50,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        ResetInput(
          label: "Current Password",
          controller: oldpass,
        ),
        ResetInput(
          label: "New Password",
          controller: newpass,
        ),
        ResetInput(
          label: "Confirm Password",
          controller: conpass,
        ),
        const SizedBox(
          height: 30,
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xffffffff),
              fixedSize: Size(MediaQuery.sizeOf(context).width - 40, 60),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
          child: const Text(
            "RESET PASSWORD",
            style: TextStyle(fontSize: 20, color: Color(0xffE91C1A)),
          ),
          onPressed: () async {},
        ),
      ]),
    );
  }
}
