import '../../values/country_color_data.dart';
import '../../widgets/country_list_item.dart';
import '../../models/summary_each_country.dart';
import '../../network_requests/api_client.dart';
import '../../network_requests/exceptions.dart';
import 'package:flutter/material.dart';

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
    themeColor = Color(0xff52b9aa);
    searchValue = "";
    _future=getCountriesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: ()=> Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back,color: Colors.grey[800],size: 25,),
        ),
        title: Text(
            "Search Any Country",
            style: TextStyle(
                fontSize: 20,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                color: Colors.grey[800],
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
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey[200],
                            offset: Offset(0,0.8),
                          )
                        ],
                    ),
                    padding: const EdgeInsets.fromLTRB(15,0,15,15),
                    child: TextFormField(
                      cursorColor: themeColor,
                      style: TextStyle(
                        color: themeColor,
                        fontFamily: "Montserrat",
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(vertical: 17),
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
                          padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15),
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
