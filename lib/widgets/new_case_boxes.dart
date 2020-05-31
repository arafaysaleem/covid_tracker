import 'package:flutter/material.dart';

class NewCaseBoxes extends StatelessWidget {
  final color;

  const NewCaseBoxes({Key key, this.color}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //Row of affected and deaths
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            //New Affected
            Container(
              width:175,
              height: 95,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(13),
              ),
              padding: EdgeInsets.fromLTRB(15, 12, 0, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Affected",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "30000",
                    style: TextStyle(
                      fontSize: 23,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(width: 13),

            //New Deaths
            Expanded(
              child: Container(
                height: 95,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(13),
                ),
                padding: EdgeInsets.fromLTRB(15, 12, 0, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Deaths",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        color: color,
                      ),
                    ),
                    Text(
                      "30000",
                      style: TextStyle(
                        fontSize: 23,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                        color: color,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 13),

        //Row of Tested and recovered
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            //New tested
            Expanded(
              child: Container(
                height: 95,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(13),
                ),
                padding: EdgeInsets.fromLTRB(15, 12, 0, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Tested",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        color: color,
                      ),
                    ),
                    Text(
                      "30000",
                      style: TextStyle(
                        fontSize: 23,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                        color: color,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(width: 13),

            //New Recovered
            Container(
              width:175,
              height: 95,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(13),
              ),
              padding: EdgeInsets.fromLTRB(15, 12, 0, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Recovered",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "30000",
                    style: TextStyle(
                      fontSize: 23,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
