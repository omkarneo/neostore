// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../viewmodel/register/registerprovider.dart';

// ignore: must_be_immutable
class Checkbox1 extends ConsumerStatefulWidget {
  Checkbox1({super.key, required this.extract});

  Function(bool) extract;
  @override
  Checkbox1State createState() => Checkbox1State();
}

class Checkbox1State extends ConsumerState<Checkbox1> {
  var select;
  @override
  Widget build(BuildContext context) {
    select = ref.watch(registerprovider).check;
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(border: Border.all(color: Colors.white)),
            // margin: const EdgeInsets.all(5),
            child: (select == true)
                ? Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      color: Colors.white,
                    ),
                  )
                : null,
          ),
          const SizedBox(
            width: 15,
          ),
          RichText(
              text: const TextSpan(
                  text: "I agree the ",
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w500),
                  children: [
                TextSpan(
                    text: "Terms & Conditions",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w500))
              ])),
        ],
      ),
      onTap: () {
        ref.read(registerprovider).checkaction();
        widget.extract(ref.watch(registerprovider).check);
      },
    );
  }
}
