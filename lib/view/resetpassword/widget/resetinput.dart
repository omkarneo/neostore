import 'package:flutter/material.dart';

class ResetInput extends StatefulWidget {
  final controller;
  final label;
  const ResetInput({super.key, this.controller, this.label});

  @override
  State<ResetInput> createState() => _ResetInputState();
}

class _ResetInputState extends State<ResetInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: TextFormField(
        controller: widget.controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.lock,
              color: Colors.white,
            ),
            hintText: "${widget.label}",
            hintStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.normal),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.5),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.5),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.5),
            ),
            errorStyle: const TextStyle(color: Colors.white)),
        validator: (value) {
          var emailValid = RegExp(
              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
          if (emailValid.hasMatch(value!)) {
            return null;
          }
          return "Please Enter Valid mail";
        },
      ),
    );
  }
}
