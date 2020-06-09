import 'package:flutter/material.dart';

class NewsListLoader extends StatefulWidget {
  @override
  _NewsListLoaderState createState() => _NewsListLoaderState();
}

class _NewsListLoaderState extends State<NewsListLoader>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 700), lowerBound: 0.5)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed)
          _controller.reverse();
        else if (status == AnimationStatus.dismissed) _controller.forward();
      });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12)),
            width: MediaQuery.of(context).size.width,
            height: 121,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //News image
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(12)),
                  height: 95,
                  width: 95,
                ),

                SizedBox(width: 8),

                //Column of title and description
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //Title
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8)),
                        height: 31,
                      ),

                      SizedBox(height: 10),

                      //Description
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8)),
                        height: 54,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 10,
            color: Colors.transparent,
            thickness: 2,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12)),
            width: MediaQuery.of(context).size.width,
            height: 121,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //News image
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(12)),
                  height: 95,
                  width: 95,
                ),

                SizedBox(width: 8),

                //Column of title and description
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //Title
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8)),
                        height: 31,
                      ),

                      SizedBox(height: 10),

                      //Description
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8)),
                        height: 54,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 10,
            color: Colors.transparent,
            thickness: 2,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12)),
            width: MediaQuery.of(context).size.width,
            height: 121,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //News image
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(12)),
                  height: 95,
                  width: 95,
                ),

                SizedBox(width: 8),

                //Column of title and description
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //Title
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8)),
                        height: 31,
                      ),

                      SizedBox(height: 10),

                      //Description
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(8)),
                        height: 54,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
