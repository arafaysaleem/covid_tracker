import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:covidtracker/network_requests/api_client.dart';
import 'package:covidtracker/network_requests/exceptions.dart';
import 'package:covidtracker/widgets/my_web_view.dart';
import 'package:flutter/material.dart';

class UpdatesScreen extends StatefulWidget {
  final imgPath;
  final Color color;

  UpdatesScreen({Key key, this.imgPath, this.color}) : super(key: key);

  @override
  _UpdatesScreenState createState() => _UpdatesScreenState();
}

class _UpdatesScreenState extends State<UpdatesScreen> {
  String dropDownValue = "publishedAt";
  ApiClient _client = ApiClient();

  getNews() async {
    var json;
    try {
      json = await _client.getResponse(dropDownValue);
    } on FetchDataException catch (fde) {
      return fde;
    }
    var articles = json['articles'];
    return articles;
  }

  Widget getNewsTile(Map<String, dynamic> article) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => MyWebView(selectedUrl: article['url'])));
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 95,
        child: Row(
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
                          image: AssetImage("assets/news.png"),
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
                            image: AssetImage("assets/news.png"),
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
                        image: AssetImage("assets/news.png"),
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
                  Text(
                    "${article["title"]}",
                    style: TextStyle(
                      fontFamily: "Monsterrat",
                      fontSize: 14,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  SizedBox(height: 5),

                  //Description
                  Flexible(
                    child: Text(
                      article["description"] == null
                          ? "Read More for Details"
                          : "${article["description"]}",
                      style: TextStyle(
                        fontFamily: "Monsterrat",
                        fontSize: 12,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Covid-19 Updates",
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Montserrat",
              fontSize: 20,
              fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 26,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              getNews();
            },
            icon: Icon(
              Icons.refresh,
              color: Colors.black,
              size: 26,
            ),
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Carousel
              CarouselSlider(
                items: ["assets/news1.png","assets/news2.png","assets/news3.png"]
                    .map((imgPath) => Container(
                          decoration: BoxDecoration(
                            color: Colors.red,
                            image: DecorationImage(
                              fit: BoxFit.fitWidth,
                              image: AssetImage(imgPath),
                            ),
                          ),
                        ))
                    .toList(),
                options: CarouselOptions(
                  initialPage: 0,
                  autoPlay: true,
                  pauseAutoPlayOnTouch: true,
                  autoPlayCurve: Curves.fastOutSlowIn,
                  viewportFraction: 1.1,
                  enableInfiniteScroll: true,
                  enlargeCenterPage: true,
                  height: 200
                ),
              ),

              //Divider
             Divider(
                color: Colors.black,
                height: 25,
                thickness: 2,
              ),

              //Sorting + drop down
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  //Sort by
                  Text(
                    "Sort By",
                    style: TextStyle(
                      fontFamily: "Monsterrat",
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  SizedBox(width: 10),

                  Icon(Icons.filter_list),

                  SizedBox(width: 10),

                  //DropDown
                  Container(
                    width: 230,
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 55,
                    child: Center(
                      child: Theme(
                        data: ThemeData(
                          canvasColor: Colors.black,
                        ),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          itemHeight: 50,
                          value: dropDownValue,
                          underline: Container(
                            height: 0,
                          ),
                          elevation: 20,
                          iconSize: 28,
                          icon: Icon(
                            Icons.expand_more,
                            color: Colors.white,
                          ),
                          items: <DropdownMenuItem<String>>[
                            DropdownMenuItem(
                              value: "publishedAt",
                              child: Text(
                                "Latest",
                                style: TextStyle(
                                  fontFamily: "Monsterrat",
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: "popular",
                              child: Text(
                                "Popular",
                                style: TextStyle(
                                  fontFamily: "Monsterrat",
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: "Last Week",
                              child: Text(
                                "Last Week",
                                style: TextStyle(
                                  fontFamily: "Monsterrat",
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: "Last 15",
                              child: Text(
                                "Last 15 days",
                                style: TextStyle(
                                  fontFamily: "Monsterrat",
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            DropdownMenuItem(
                              value: "Last Month",
                              child: Text(
                                "Last Month",
                                style: TextStyle(
                                  fontFamily: "Monsterrat",
                                  fontSize: 17,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ],
                          onChanged: (String newValue) {
                            setState(() {
                              dropDownValue = newValue;
                              getNews();
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              //Divider
              Divider(
                color: Colors.black,
                height: 25,
                thickness: 2,
              ),

              //News tiles
              Expanded(
                child: FutureBuilder<dynamic>(
                  future: getNews(),
                  builder: (context, snapshot) {
                    return snapshot.data == null
                        ? Center(child: CircularProgressIndicator())
                        : ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemCount: 10,
                            separatorBuilder: (context, index) {
                              return Divider(
                                height: 40,
                                color: Colors.black,
                                thickness: 2,
                              );
                            },
                            itemBuilder: (context, index) {
                              if (snapshot.data is FetchDataException) {
                                return Text("${snapshot.data.toString()}");
                              }
                              return getNewsTile(snapshot.data[index]);
                            });
                  },
                ),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }
}
