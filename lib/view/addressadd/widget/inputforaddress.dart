// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class AddressInputs extends StatefulWidget {
  final label;
  final weight;
  final maxline;
  final minline;
  final contoller;
  const AddressInputs(
      {super.key,
      this.label,
      this.weight,
      this.maxline,
      this.minline,
      this.contoller});

  @override
  State<AddressInputs> createState() => _AddressInputsState();
}

class _AddressInputsState extends State<AddressInputs> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w500,
              color: Colors.grey.shade700),
        ),
        const SizedBox(
          height: 15,
        ),
        SizedBox(
          width: widget.weight,
          child: TextFormField(
            maxLines: widget.maxline,
            minLines: widget.minline,
            controller: widget.contoller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(0),
                borderSide: BorderSide.none,
              ),
              fillColor: Colors.white,
              filled: true,
            ),
            validator: (value) {
              if (value!.isEmpty) {
                return "Please Enter ${widget.label}";
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}
