import '../widgets/news_widgets/news_tile.dart';
import '../widgets/news_widgets/updates_page_carousel.dart';
import '../network_requests/api_client.dart';
import '../network_requests/exceptions.dart';
import '../widgets/skeletons/news_list_skeleton.dart';
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
  Future<dynamic> _newsFuture;

  getNews() async {
    var json;
    try {
      json = await _client.getNewsResponse(dropDownValue);
    } on FetchDataException catch (fde) {
      return fde;
    }
    var articles = json['articles'];
    return articles;
  }

  refresh() async{
    await Future.delayed(Duration(milliseconds: 800),() {
      setState(() {
        _newsFuture=getNews();
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _newsFuture=getNews();
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
              setState(() {
                _newsFuture=null;
                refresh();
              });
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
              ImageCarousel(),

              //Divider
             Divider(
                color: Colors.black,
                height: 25,
                thickness: 2,
              ),

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
                        fontFamily: "Montserrat",
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  SizedBox(width: 10),

                  Expanded(child: Icon(Icons.filter_list,size: 26,)),

                  SizedBox(width: 10),

                  //DropDown
                  Container(
                    width: 230,
                    padding: const EdgeInsets.only(left: 15, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 50,
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
                                  fontFamily: "Montserrat",
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
                                  fontFamily: "Montserrat",
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
                                  fontFamily: "Montserrat",
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
                                  fontFamily: "Montserrat",
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
                                  fontFamily: "Montserrat",
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
                              _newsFuture=getNews();
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
                  future: _newsFuture,
                  builder: (context, snapshot) {
                    return (snapshot.data == null || snapshot.connectionState!=ConnectionState.done)
                        ? NewsListLoader()
                        : ListView.separated(
                            physics: BouncingScrollPhysics(),
                            itemCount: 10,
                            separatorBuilder: (context, index) {
                              return Divider(
                                height: (snapshot.data is FetchDataException)?20:40,
                                color: Colors.black,
                                thickness: 2,
                              );
                            },
                            itemBuilder: (context, index) {
                              if (snapshot.data is FetchDataException) {
                                return Container(
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Center(
                                    child: Text(
                                      snapshot.data.toString(),
                                      style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                );
                              }
                              return NewsTile(article:snapshot.data[index]);
                            },
                    );
                  },
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
