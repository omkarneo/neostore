import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:neostore/core/Navigation/route_paths.dart';
import 'package:neostore/view/myaccount/widget/accountinput.dart';
import 'package:neostore/viewmodel/account/account_pro.dart';

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
      body: Consumer(builder: (context, ref, child) {
        var data = ref.watch(accountprovider).user;
        if (data != null) {
          return SingleChildScrollView(
            child: SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height - 90,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                      children: [
                        Center(
                          child: Container(
                            width: 180,
                            height: 180,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage((data.profilePic != null)
                                      ? data.profilePic
                                      : "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png"),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        AccountInput(
                          label: data.firstName,
                          icon: Icons.person,
                        ),
                        AccountInput(
                          label: data.lastName,
                          icon: Icons.person,
                        ),
                        AccountInput(
                          label: data.email,
                          icon: Icons.email,
                        ),
                        AccountInput(
                          label: data.phoneNo,
                          icon: Icons.phone,
                        ),
                        AccountInput(
                          label: data.dob,
                          icon: Icons.cake,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffffffff),
                              fixedSize: Size(
                                  MediaQuery.sizeOf(context).width - 40, 60),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          child: const Text(
                            "EDIT PROFILE",
                            style: TextStyle(
                                fontSize: 20, color: Color(0xffE91C1A)),
                          ),
                          onPressed: () async {
                            Navigator.pushNamed(
                                context, RoutePaths.editaccountpage,
                                arguments: data);
                          },
                        ),
                      ],
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
                        Navigator.pushNamed(
                            context, RoutePaths.resetpasswordpage);
                      },
                    ),
                  ]),
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(color: Colors.white),
          );
        }
      }),
    );
  }
}
