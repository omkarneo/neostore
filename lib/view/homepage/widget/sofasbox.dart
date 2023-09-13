import 'package:flutter/material.dart';

import '../../../core/utils/staticdata.dart';

class SofasBox extends StatefulWidget {
  const SofasBox({super.key});

  @override
  State<SofasBox> createState() => _SofasBoxState();
}

class _SofasBoxState extends State<SofasBox> {
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
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 15, left: 15),
                    child: Text(
                      "Sofas",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 55.0),
                    child: Icon(
                      Icons.chair,
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
