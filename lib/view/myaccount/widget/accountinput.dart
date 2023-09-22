import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:neostore/core/utils/staticdata.dart';

class AccountInput extends StatefulWidget {
  final label;
  final icon;
  final controller;
  final validation;
  const AccountInput(
      {super.key, this.label, this.icon, this.controller, this.validation});

  @override
  State<AccountInput> createState() => _AccountInputState();
}

class _AccountInputState extends State<AccountInput> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 0),
      child: TextFormField(
        // controller: widget.controller,
        readOnly: true,
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
      ),
    );
  }
}
