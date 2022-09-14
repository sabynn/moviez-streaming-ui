part of '_pages.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                top: 18.0,
                right: 24.0,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Moviez',
                            style: FontThemes.avenir28w700nightBlue(),
                          ),
                          Text(
                            'Watch much easier',
                            style: FontThemes.avenir16w400gray(),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SearchPage(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.search,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  FutureBuilder(
                    future: MoviezService.searchData(''),
                    builder: (
                      BuildContext context,
                      AsyncSnapshot snapshot,
                    ) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.waiting:
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        default:
                          if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.hasData &&
                              snapshot.data.isNotEmpty) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 290,
                                  child: ListView.builder(
                                    clipBehavior: Clip.none,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: snapshot.data.length,
                                    itemBuilder: (_, index) {
                                      return Padding(
                                        padding: const EdgeInsets.only(
                                          right: 24.0,
                                        ),
                                        child: BigMoviezCard(
                                          moviezModel: snapshot.data[index],
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                Text(
                                  'From Disney',
                                  style: FontThemes.avenir24w700nightBlue(),
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                ListView.builder(
                                  clipBehavior: Clip.none,
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (_, index) {
                                    return Padding(
                                      padding: const EdgeInsets.only(
                                        bottom: 32.0,
                                      ),
                                      child: SmallMoviezCard(
                                        moviezModel: snapshot.data[index],
                                      ),
                                    );
                                  },
                                ),
                              ],
                            );
                          } else {
                            return const Padding(
                              padding: EdgeInsets.only(left: 8.0),
                              child: Text(
                                'No Data',
                              ),
                            );
                          }
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
