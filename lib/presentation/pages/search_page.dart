part of '_pages.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  SearchPageState createState() => SearchPageState();
}

class SearchPageState extends State<SearchPage> {
  bool allMoviez = true;
  String query = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(150),
                  ),
                  elevation: 1,
                  child: SizedBox(
                    child: TextField(
                      cursorColor: BaseColors.nightBlue,
                      style: FontThemes.avenir16w400nightBlue(),
                      onChanged: (value) => {
                        setState(
                          () {
                            query = value;
                            if (value != '') {
                              allMoviez = false;
                            } else {
                              allMoviez = true;
                            }
                          },
                        )
                      },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(
                          Icons.search_rounded,
                          color: BaseColors.nightBlue,
                        ),
                        hintText: 'Search...',
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0,
                          horizontal: 20.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(32.0),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: BaseColors.white,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(32.0),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: BaseColors.white,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(32.0),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<MoviezModel>>(
                future: MoviezService.searchData(query),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    final List<MoviezModel>? moviez = snapshot.data;
                    if (moviez?.isNotEmpty ?? false) {
                      return ListView(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 24,
                            ),
                            child: Text(
                              allMoviez
                                  ? 'All Moviez'
                                  : 'Search Result (${moviez?.length})',
                              style: FontThemes.avenir20w500nightBlue(),
                            ),
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: moviez?.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: SmallMoviezCard(
                                  moviezModel: moviez![index],
                                ),
                              );
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 78.0,
                            ),
                            child: SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: BaseColors.nightBlue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(37),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Suggest Movie',
                                  style: FontThemes.avenir16w400white(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return _stateInfo(
                        "No article available for keywords $query",
                        true,
                        Icons.search_off_rounded,
                      );
                    }
                  } else if (snapshot.hasError) {
                    return _stateInfo(
                      snapshot.error.toString(),
                      true,
                      Icons.close,
                    );
                  } else {
                    return _stateInfo(
                      "Load the articles",
                      false,
                      Icons.search_off_rounded,
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _stateInfo(String message, bool noData, IconData icon) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            noData
                ? Icon(
                    icon,
                    size: 100,
                    color: BaseColors.nightBlue,
                  )
                : const Center(
                    child: CircularProgressIndicator(
                      color: BaseColors.nightBlue,
                    ),
                  ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(message, style: FontThemes.avenir24w700nightBlue()),
            ),
          ],
        ),
      ),
    );
  }
}
