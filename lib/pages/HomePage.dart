import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_emoji_ui/AppColors.dart';
import 'package:shop_emoji_ui/pages/FoodPage.dart';

import '../models/IFood.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  initState(){
    super.initState();
    setState(() {
      initLists();
    });
  }
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  backgroundColor: AppColors.backgroundColor,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              'SEARCH FOR\nRECIPES',
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w800, fontSize: 27.0),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.010,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10)),
              child: TextField(
                decoration: const InputDecoration(
                  focusedBorder: InputBorder.none,
                  hintText: "Search",
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: Colors.grey,
                  ),
                ),
                controller: _searchController,
                onChanged: (_searchString) {
                  setState(() {});
                },
              ),
            ),
          ),
          searchWidget(_searchController.text.toString()),
          _searchController.text.isEmpty ? FavoriteFoodsWidget() : Column(),
          _searchController.text.isEmpty ? RecommendedFoodsWidget() : Column(),
          _searchController.text.isEmpty ? AllFoodsWidget() : Column(),
          
         
        ],
      ),
    );
  }

  Column AllFoodsWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 30.0),
          child: Text(
            'All Foods',
            style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w800, fontSize: 27.0),
          ),
        ),
        Container(height: 400, child: _buildListItem(AllFoodList)),
      ],
    );
  }

  Column FavoriteFoodsWidget() {
    return FavoriteFoodsList.isNotEmpty
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  'Favorites',
                  style: GoogleFonts.notoSans(
                      fontWeight: FontWeight.w800, fontSize: 27.0),
                ),
              ),
              Container(height: 400, child: _buildListItem(FavoriteFoodsList)),
            ],
          )
        : Column();
  }

  Column RecommendedFoodsWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: Text(
            'Recommended',
            style: GoogleFonts.notoSans(
                fontWeight: FontWeight.w800, fontSize: 27.0),
          ),
        ),
        Container(height: 400, child: _buildListItem(RecommendedFood)),
      ],
    );
  }

  ListView _buildListItem(List list) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, elementIndex) => Padding(
            padding: const EdgeInsets.all(15.0),
            child: InkWell(
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => FoodPage(food: list.elementAt(elementIndex)))));
                  },
              child: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.75),
                        borderRadius: BorderRadius.circular(25)),
                    width: 200,
                    height: 300,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  list.elementAt(elementIndex).nameDisplay,
                                  style: GoogleFonts.notoSans(
                                      fontWeight: FontWeight.bold),
                                ),
                                list.elementAt(elementIndex).favorite
                                    ? IconButton(
                                        icon: const Icon(
                                          Icons.star,
                                          color: Colors.yellow,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            list
                                                .elementAt(elementIndex)
                                                .favoriteChange();
                                          });
                                        },
                                      )
                                    : IconButton(
                                        icon: const Icon(
                                          Icons.star_border,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            list
                                                .elementAt(elementIndex)
                                                .favoriteChange();
                                          });
                                        },
                                      ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                                height: 200,
                                width: 100,
                                child: Text(
                                  list
                                      .elementAt(elementIndex)
                                      .description
                                      .toString(),
                                  style: GoogleFonts.notoSans(),
                                  textAlign: TextAlign.left,
                                )),
                          )
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 110.0, top: 130),
                    child: Image.asset(list.elementAt(elementIndex).asset_img),
                  ),
                ],
              ),
            )));
  }

  Column searchWidget(String _search) {
    return _search == ""
        ? Column()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  SearchFoodInList(_search).isNotEmpty ? 'Found foods' : 'No food found :(',
                  style: GoogleFonts.notoSans(
                      fontWeight: FontWeight.w800, fontSize: 27.0),
                ),
              ),
              Container(
                  height: 400,
                  child: _buildListItem(SearchFoodInList(_search))),
            ],
          );
  }
}
