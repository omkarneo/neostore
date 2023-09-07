import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          hintText: "Username",
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.5),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.white,
                          ),
                          hintText: "Password",
                          hintStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.normal),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.5),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.white, width: 1.5),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 35),
                      child: Center(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffffffff),
                              fixedSize: Size(
                                  MediaQuery.sizeOf(context).width - 40, 60),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: const Text(
                            "LOGIN",
                            style: TextStyle(
                                fontSize: 30, color: Color(0xffE91C1A)),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 20),
                      child: Text("Forgot Password?",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Colors.white)),
                    ),
                  ],
                ),
                Spacer(),
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
                        onPressed: () {},
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
    );
  }
}
