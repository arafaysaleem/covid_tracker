import 'package:auto_size_text/auto_size_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'my_web_view.dart';

// ignore: must_be_immutable
class NewsTile extends StatelessWidget {
  final Map<String, dynamic> article;

  const NewsTile({this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MyWebView(selectedUrl: article['url'])));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 95,
        child: LayoutBuilder(
          builder: (ctx,constraint) => Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //News image
              article['urlToImage'] != null
                  ? CachedNetworkImage(
                imageUrl: article['urlToImage'],
                fit: BoxFit.cover,
                width: 95,
                height: 95,
                placeholder: (context, url) => Container(
                  width: 95,
                  height: 95,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/updates/news.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                errorWidget: (context, url, dynamic) {
                  return Container(
                    width: 95,
                    height: 95,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/updates/news.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              )
                  : Container(
                width: 95,
                height: 95,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/updates/news.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(width: 8),

              //Column of title and description
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //Title
                    SizedBox(
                      width: constraint.maxWidth * 0.7,
                      child: AutoSizeText(
                        "${article["title"]}",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          fontSize: 13,
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                        stepGranularity: 1,
                        maxFontSize: 13,
                      ),
                    ),

                    SizedBox(height: 5),

                    //Description
                    Flexible(
                      child: SizedBox(
                        width: constraint.maxWidth * 0.7,
                        child: AutoSizeText(
                          article["description"] == null
                              ? "Read More for Details"
                              : "${article["description"]}",
                          maxLines: MediaQuery.of(context).size.width > 340.0?4:3,
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            fontSize: 11.8,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                          stepGranularity: 0.2,
                          maxFontSize: 11.8,
                          minFontSize: 11.8,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
