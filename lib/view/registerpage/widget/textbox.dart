import 'package:flutter/material.dart';

class TextBox extends StatefulWidget {
  final String? label;
  final TextEditingController? controller;
  final validation;
  final icon;
  TextBox(
      {super.key,
      this.label,
      this.controller,
      this.validation,
      required this.icon});

  @override
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: TextFormField(
        controller: widget.controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
            prefixIcon: Icon(
              widget.icon,
              color: Colors.white,
            ),
            hintText: "${widget.label}",
            hintStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.normal),
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.5),
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.5),
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.5),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 1.5),
            ),
            errorStyle: const TextStyle(color: Colors.white)),
        validator: widget.validation,
      ),
    );
  }
}
