import 'package:flutter/material.dart';

class Menutile extends StatefulWidget {
  final String? name;
  final IconData? icon;
  final Function action;
  const Menutile({super.key, this.name, this.icon, required this.action});

  @override
  State<Menutile> createState() => _MenutileState();
}

class _MenutileState extends State<Menutile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.action();
      },
      child: SizedBox(
        width: 70,
        height: 60,
        // decoration:
        //     BoxDecoration(border: Border.all(width: 1, color: Colors.black)),
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Icon(
              widget.icon,
              color: Colors.white,
            ),
          ),
          Text(
            "${widget.name}",
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          // Spacer()
        ]),
      ),
    );
  }
}
