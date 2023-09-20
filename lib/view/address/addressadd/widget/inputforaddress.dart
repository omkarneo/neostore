import 'package:flutter/material.dart';

class AddressInputs extends StatefulWidget {
  final label;
  final weight;
  final maxline;
  final minline;
  const AddressInputs(
      {super.key, this.label, this.weight, this.maxline, this.minline});

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
          // width: MediaQuery.sizeOf(context).width / 2.3,
          child: TextFormField(
            maxLines: widget.maxline,
            minLines: widget.minline,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0),
                  borderSide: BorderSide.none,
                ),
                fillColor: Colors.white,
                filled: true),
          ),
        ),
      ],
    );
  }
}
