import 'package:flutter/material.dart';
import 'package:neostore/core/Navigation/route_paths.dart';
import 'package:neostore/view/myaccount/widget/accountinput.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
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
          "My Account",
          style: TextStyle(fontWeight: FontWeight.w400),
        ),
        backgroundColor: const Color(0xffE91C1A),
      ),
      backgroundColor: const Color(0xffE91C1A),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height - 90,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                const AccountInput(
                  label: "Sagar",
                  icon: Icons.person,
                ),
                const AccountInput(
                  label: "Shinde",
                  icon: Icons.person,
                ),
                const AccountInput(
                  label: "sagarshinde@wwindia.com",
                  icon: Icons.email,
                ),
                const AccountInput(
                  label: "9876543211",
                  icon: Icons.phone,
                ),
                const AccountInput(
                  label: "08-11-1857",
                  icon: Icons.cake,
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffffffff),
                      fixedSize:
                          Size(MediaQuery.sizeOf(context).width - 40, 60),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  child: const Text(
                    "EDIT PROFILE",
                    style: TextStyle(fontSize: 20, color: Color(0xffE91C1A)),
                  ),
                  onPressed: () async {
                    Navigator.pushNamed(context, RoutePaths.editaccountpage);
                  },
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xffffffff),
                      fixedSize: Size(MediaQuery.sizeOf(context).width, 70),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0))),
                  child: const Text(
                    "RESET PASSWORD",
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                  onPressed: () async {
                    Navigator.pushNamed(context, RoutePaths.resetpasswordpage);
                  },
                ),
              ]),
        ),
      ),
    );
  }
}
