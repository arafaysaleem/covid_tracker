import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AffectedAreasContainer extends StatelessWidget {
  const AffectedAreasContainer();

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 3, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //Affected Areas Text
                  AutoSizeText(
                    "Affected Areas",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 17,
                      letterSpacing: 0.5,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    maxFontSize: 17,
                  ),

                  //More horiz icon
                  IconButton(
                    icon: const Icon(
                      Icons.more_horiz,
                      color: Color(0xFF7B1FA2),
                      size: 28,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 17, 14),
              child: Image(
                image: AssetImage("assets/stats/map.png"),
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
