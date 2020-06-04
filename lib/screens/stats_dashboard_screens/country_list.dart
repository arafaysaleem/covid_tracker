import '../../models/item_color_data.dart';
import '../../widgets/country_list_item.dart';
import '../../models/summary_each_country.dart';
import '../../network_requests/api_client.dart';
import '../../network_requests/exceptions.dart';
import 'package:flutter/material.dart';

final List<ItemColorData> colordata = <ItemColorData>[
  //TODO: Refactor repeated Color data
  ItemColorData(
    backgroundColor: Color(0xff008e7b),
    gradientColor: Color(0xff009a88),
    lineColor: Color(0xff5bc8b7),
  ),
  ItemColorData(
    backgroundColor: Color(0xffff775e),
    gradientColor: Color(0xffff8d77),
    lineColor: Color(0xffffc4b7),
  ),
  ItemColorData(
    backgroundColor: Color(0xffffcb0f),
    gradientColor: Color(0xffffd642),
    lineColor: Color(0xfffff199),
  ),
  ItemColorData(
    backgroundColor: Color(0xff6078ff),
    gradientColor: Color(0xff758aff),
    lineColor: Color(0xffe7e9fb),
  )
];

class CountriesScreen extends StatefulWidget {
  @override
  _CountriesScreenState createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  List<SummaryEachCountry> countries;
  String searchValue;
  Color themeColor;
  Future<bool> _future;

  Future<bool> getCountriesList() async {
    ApiClient _client = ApiClient();
    List<dynamic> json = await _client.getStatsResponse(StateLocation.ALL);

    json.forEach((country) {
      if (!(country["countryInfo"]["iso2"] == null)) {
        SummaryEachCountry summary = SummaryEachCountry().formMap(country);
        countries.add(summary);
      }
    });
    return true;
  }

  List<SummaryEachCountry> getFilteredCountries() {
    if (searchValue.isEmpty) {
      return countries;
    }
    String search = searchValue.toLowerCase();
    List<SummaryEachCountry> filteredCountries = [];
    countries.forEach((country) {
      if (country.country.toLowerCase().startsWith(search)) {
        filteredCountries.add(country);
      }
    });
    return filteredCountries;
  }

  @override
  void initState() {
    super.initState();
    countries = [];
    //TODO: Fix Color to purple
    themeColor = Color(0xff52b9aa);
    searchValue = "";
    _future=getCountriesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: Add a back button
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: GestureDetector(
          onTap: ()=> Navigator.of(context).pop(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Icon(Icons.arrow_back,color: Colors.black,),
          ),
        ),
        title: Text(
            "Search Countries",
            style: TextStyle(
                fontSize: 18,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                color: Colors.black,
            ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: FutureBuilder<bool>(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            //error container
            return Container(
              margin: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                color: Color(0xfff3cfff),
                borderRadius: BorderRadius.circular(16),
              ),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Center(
                child: Text(
                  snapshot.error.toString(),
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontSize: 21,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
              ),
            );
          }

          if (snapshot.hasData) {
            if (snapshot.data is FetchDataException) {
              return Container(
                decoration: BoxDecoration(
                  color: Color(0xfff3cfff),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    snapshot.data.toString(),
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 21,
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                  ),
                ),
              );
            } else {
              return Column(
                children: <Widget>[
                  //Search Bar
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 20),
                    child: TextFormField(
                      cursorColor: themeColor,
                      style: TextStyle(
                        color: themeColor,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 15),
                        hintText: "Country Name",
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                              color: themeColor,
                              width: 1.4,
                              style: BorderStyle.solid),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(
                              color: themeColor,
                              width: 1.4,
                              style: BorderStyle.solid),
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: themeColor,
                          size: 21,
                        ),
                      ),
                      onChanged: (String val) {
                        setState(() {
                          searchValue = val;
                        });
                      },
                    ),
                  ),

                  //Countries Grid
                  Expanded(
                    child: Builder(
                      builder: (context) {
                        List<SummaryEachCountry> list = getFilteredCountries();
                        return GridView.builder(
                          physics: BouncingScrollPhysics(),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 30,
                            childAspectRatio: 2 / 2.9,
                          ),
                          itemCount: list.length,
                          itemBuilder: (ctx, i) {
                            return CountryListItem(
                              height: 180,
                              countryName: list[i].country,
                              countryCode: list[i].code,
                              value: list[i].totalCases,
                              flagPath: list[i].flagPath,
                              isIncreasing: list[i].isIncreasing,
                              itemColorData: colordata[i % colordata.length],
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          } else {
            //TODO: Add a skeleton loader
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
