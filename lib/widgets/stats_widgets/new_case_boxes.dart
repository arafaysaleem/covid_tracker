import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class NewCaseBoxes extends StatelessWidget {
  final color;
  int affected,deaths,tested,recovered,totalCases;
  bool today;
  final formatter = new NumberFormat("#,###");

  NewCaseBoxes({Key key, this.color,this.affected,this.deaths,this.recovered,this.tested,this.today,this.totalCases}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //Row of affected and deaths
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[

            //New Affected
            Expanded(
              child: Container(
                height: 95,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(13),
                ),
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    AutoSizeText(
                      "New Affected",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      maxFontSize: 15,
                    ),
                    AutoSizeText(
                      formatter.format(affected),
                      style: TextStyle(
                        fontSize: 21,
                        fontFamily: "Montserrat",
                        letterSpacing: 1,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      maxFontSize: 21,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(width: 13),

            //New Deaths
            Container(
              width: 145,
              height: 95,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(13),
              ),
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  AutoSizeText(
                    "New Deaths",
                    style: TextStyle(
                      fontSize: 15,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w600,
                      color: color,
                    ),
                    maxFontSize: 15,
                  ),
                  AutoSizeText(
                    formatter.format(deaths),
                    style: TextStyle(
                      fontSize: 21,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1,
                      color: color,
                    ),
                    maxFontSize: 21,
                  ),
                ],
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
            Container(
              width: 145,
              height: 95,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(13),
              ),
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
              child: LayoutBuilder(
                builder:(ctx,constraint)=> Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    AutoSizeText(
                      "Total Tested",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        color: color,
                      ),
                      maxFontSize: 15,
                    ),
                    AutoSizeText(
                      formatter.format(tested),
                      style: TextStyle(
                        fontSize: 21,
                        fontFamily: "Montserrat",
                        letterSpacing: 1,
                        fontWeight: FontWeight.w700,
                        color: color,
                      ),
                      maxLines: 1,
                      maxFontSize: 21,
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(width: 13),

            //New Recovered || Probability
            Expanded(
              child: Container(
                height: 95,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(13),
                ),
                padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    AutoSizeText(
                      today? "Recovered": "Infection Probability",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                      maxFontSize: 15,
                    ),
                    AutoSizeText(
                      today?formatter.format(recovered):"${(totalCases/tested*100).toStringAsFixed(1)}%",
                      style: TextStyle(
                        fontSize: 21,
                        letterSpacing: 1,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                      maxFontSize: 21,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
