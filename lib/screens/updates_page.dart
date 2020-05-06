import 'package:cached_network_image/cached_network_image.dart';
import 'package:covidtracker/network_requests/api_client.dart';
import 'package:covidtracker/network_requests/exceptions.dart';
import 'package:covidtracker/widgets/my_web_view.dart';
import 'package:flutter/cupertino.dart';
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
    } on FetchDataException catch(fde) {
      return fde;
    }
    var articles = json['articles'];
    return articles;
  }

  Widget getNewsTile(Map<String, dynamic> article) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MyWebView(selectedUrl: article['url'])));
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
            onPressed: (){getNews();},
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
          padding: const EdgeInsets.fromLTRB(10, 120, 10, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              //Divider
              Container(
                color: Colors.black,
                height: 2,
              ),

              SizedBox(height: 15),

              //Sorting + drop down
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  //Sort by
                  Padding(
                    padding: MediaQuery.of(context).size.width>360.0? EdgeInsets.only(left: 20):EdgeInsets.only(left: 0),
                    child: Text(
                      "Sort By",
                      style: TextStyle(
                        fontFamily: "Monsterrat",
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  SizedBox(width: 10),

                  Expanded(child: Icon(Icons.filter_list,size: 26,)),

                  SizedBox(width:10),

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

              SizedBox(height:20),

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
                              if(snapshot.data is FetchDataException){
                                return Text("${snapshot.data.toString()}");
                              }
                              return getNewsTile(snapshot.data[index]);
                            });
                  },
                ),
              ),
              SizedBox(height:15),
            ],
          ),
        ),
      ),
    );
  }
}
