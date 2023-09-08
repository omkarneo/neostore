import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Checkbox1 extends StatefulWidget {
  Checkbox1({required this.selected, super.key});
  bool selected;
  @override
  State<Checkbox1> createState() => _Checkbox1State();
}

class _Checkbox1State extends State<Checkbox1> {
  late var select = widget.selected;
  @override
  Widget build(BuildContext context) {
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
        setState(() {
          select = !select;
        });
      },
    );
  }
}
