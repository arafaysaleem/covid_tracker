import 'package:flutter/material.dart';

class WorldStatsImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.purple[900],
              borderRadius: BorderRadius.circular(16)),
          padding: EdgeInsets.fromLTRB(12, 20, 12, 20),
          child: Container(
            child: Image(
              width:
              MediaQuery.of(context).size.width > 360.0
                  ? 350
                  : 300,
              fit: BoxFit.fitWidth,
              image: AssetImage(
                  "assets/stats/global_stats.png"),
            ),
          ),
        ),
      ),
    );
  }
}
