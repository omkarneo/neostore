import 'package:flutter/material.dart';

import '../../../core/utils/staticdata.dart';

class TableBox extends StatefulWidget {
  const TableBox({super.key});

  @override
  State<TableBox> createState() => _TableBoxState();
}

class _TableBoxState extends State<TableBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: MediaQuery.sizeOf(context).width / 2 - 16,
          height: 180,
          color: colorPrimary,
          child: const Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    Icons.table_restaurant,
                    color: Colors.white,
                    size: 125,
                  )
                ],
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 15, left: 90),
                    child: Text(
                      "Tables",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
