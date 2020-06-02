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
              flex: 3,
              child: Container(
                height: 95,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(13),
                ),
                padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "New Affected",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      formatter.format(affected),
                      style: TextStyle(
                        fontSize: 21,
                        fontFamily: "Montserrat",
                        letterSpacing: 1,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(width: 13),

            //New Deaths
            Expanded(
              flex: 2,
              child: Container(
                height: 95,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(13),
                ),
                padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "New Deaths",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        color: color,
                      ),
                    ),
                    Text(
                      formatter.format(deaths),
                      style: TextStyle(
                        fontSize: 21,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
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
              flex: 2,
              child: Container(
                height: 95,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(13),
                ),
                padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Total Tested",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        color: color,
                      ),
                    ),
                    Text(
                      formatter.format(tested),
                      style: TextStyle(
                        fontSize: 21,
                        fontFamily: "Montserrat",
                        letterSpacing: 1,
                        fontWeight: FontWeight.w700,
                        color: color,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(width: 13),

            //New Recovered || Probability
            Expanded(
              flex: 3,
              child: Container(
                height: 95,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(13),
                ),
                padding: EdgeInsets.fromLTRB(12, 12, 12, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      today? "Recovered": "Infection Probability",
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      today?formatter.format(recovered):"${(totalCases/tested*100).toStringAsFixed(1)}%",
                      style: TextStyle(
                        fontSize: 21,
                        letterSpacing: 1,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
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
