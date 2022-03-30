import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/IFood.dart';

Color primaryColor = const Color(0xFFFE7D6A);
Color backgroundColor = const Color(0xFFFE7D6A);

class AllFoodsWidget extends StatefulWidget {
  const AllFoodsWidget({ Key? key }) : super(key: key);

  @override
  State<AllFoodsWidget> createState() => _AllFoodsWidgetState();
}

class _AllFoodsWidgetState extends State<AllFoodsWidget> {
  @override
  Widget build(BuildContext context) {
  TextEditingController _searchController = TextEditingController();
    return Container(
            height: 400,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: SearchFoodInList(_searchController.text.toString()).length,
              itemBuilder: (context, elementIndex) => Padding(
                padding: const EdgeInsets.all(15.0),
                child: Stack(
                  children: [
                    Container(
                  decoration: BoxDecoration(
                  color: primaryColor.withOpacity(0.75),
                  borderRadius: BorderRadius.circular(25)),
                  width: 220,
                  height: 400,
                  child: Column(children: [
                    
                    ListTile(
                      title: Text( foodsFound.elementAt(elementIndex).nameDisplay, style: GoogleFonts.notoSans(fontWeight: FontWeight.bold),),
                      trailing: foodsFound.elementAt(elementIndex).favorite ?
                      IconButton(icon: Icon(Icons.star, color: Colors.yellow,), onPressed: (){
                        setState(() {
                           foodsFound.elementAt(elementIndex).favoriteChange();
                        });
                       },) :
                      IconButton(icon: Icon(Icons.star_border,), onPressed: (){
                        setState(() {
                           foodsFound.elementAt(elementIndex).favoriteChange();
                        });
                      },),

                    )
                  ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 133.0, top: 130),
                    child: Image.asset(foodsFound.elementAt(elementIndex).asset_img),
                  ),
                  ],
                )
              )),
    );
  }
}