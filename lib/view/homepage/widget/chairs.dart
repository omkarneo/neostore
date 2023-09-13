import 'package:flutter/material.dart';

import '../../../core/utils/staticdata.dart';

class ChairsBox extends StatefulWidget {
  const ChairsBox({super.key});

  @override
  State<ChairsBox> createState() => _ChairsBoxState();
}

class _ChairsBoxState extends State<ChairsBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          color: colorPrimary,
          width: 180,
          height: 180,
          child: const Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15, left: 15),
                    child: Text(
                      "Chairs",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 55.0),
                    child: Icon(
                      Icons.event_seat,
                      color: Colors.white,
                      size: 125,
                    ),
                  )
                ],
              ),
            ],
          )),
    );
  }
}
