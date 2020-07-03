import 'package:auto_size_text/auto_size_text.dart';

import '../../widgets/stats_widgets/countries_grid.dart';
import '../../widgets/skeletons/country_list_skeleton.dart';
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

  void _clearFocus(BuildContext context) {
    FocusScope.of(context).unfocus();
  }

  @override
  void initState() {
    super.initState();
    countries = [];
    themeColor = Color(0xff52b9aa);
    searchValue = "";
    _future = getCountriesList();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _clearFocus(context),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 20),
            child: AutoSizeText(
              "Search Any Country",
              style: TextStyle(
                fontSize: 20,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.w600,
                color: Color(0xFF424242),
              ),
              stepGranularity: 1,
              maxFontSize: 20,
            ),
          ),

          //Search Bar
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey[200],
                  offset: Offset(0, 0.8),
                )
              ],
            ),
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: TextFormField(
              cursorColor: themeColor,
              style: TextStyle(
                color: themeColor,
                fontFamily: "Montserrat",
                fontWeight: FontWeight.normal,
                fontSize: MediaQuery.of(context).size.width<360.0?16:18,
              ),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 17),
                hintText: "Country Name",
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: themeColor,
                    width: 1.4,
                    style: BorderStyle.solid,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                      color: themeColor, width: 1.4, style: BorderStyle.solid,
                  ),
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
            child: FutureBuilder<bool>(
              future: _future,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  //error container
                  return Container(
                    margin: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Color(0xfff3cfff),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
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
                    List<SummaryEachCountry> list = getFilteredCountries();

                    //Country Tiles
                    return CountriesGrid(
                      list: list,
                    );
                  }
                } else {
                  return CountryListLoader();
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
