import 'package:flutter/material.dart';

import '../../../core/utils/staticdata.dart';

class CupBoardBox extends StatefulWidget {
  const CupBoardBox({super.key});

  @override
  State<CupBoardBox> createState() => _CupBoardBoxState();
}

class _CupBoardBoxState extends State<CupBoardBox> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          color: colorPrimary,
          width: MediaQuery.sizeOf(context).width / 2 - 16,
          height: 180,
          child: const Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 15, left: 22),
                    child: Text(
                      "Dinning Sets",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500),
                    ),
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5.0),
                    child: Icon(
                      Icons.dining_rounded,
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
