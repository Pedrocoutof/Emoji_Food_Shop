import 'package:flutter/material.dart';
import 'package:shop_emoji_ui/models/Food.dart';
import 'package:shop_emoji_ui/AppColors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_emoji_ui/models/IFood.dart';

/** to - do 
 * setar image + description + background como um container e colocar no topo da page view.
 */

class FoodPage extends StatefulWidget {
  final Food food;
  FoodPage({Key? key, required this.food}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

bool isCheck = false;

class _FoodPageState extends State<FoodPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: PageView(
                padEnds: false ,
                scrollDirection: Axis.vertical,
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 350.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 500,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor.withOpacity(0.75),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(100),
                                  topRight: Radius.circular(100))),
                        ),
                      ),
                      Column(
                        children: [
                          Center(
                              child: Padding(
                            padding: const EdgeInsets.only(top: 250.0),
                            child: Image.asset(widget.food.asset_img),
                          )),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                        
                              children: [
                                widget.food.favorite ? IconButton(icon: Icon(Icons.star, color: Colors.yellow,), onPressed: (){},) : IconButton(icon: Icon(Icons.star_outlined), onPressed: (){},),
                                Text(
                                  widget.food.nameDisplay,
                                  style: GoogleFonts.notoSans(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 27.0,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.food.description ?? "",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.notoSans(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18.0,
                                  color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 20.0, horizontal: 50),
                            child: Divider(
                              height: 2,
                              color: Colors.white60,
                            ),
                          ),/*
                          Text(
                            "Ingredients",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.notoSans(
                                fontWeight: FontWeight.w800,
                                fontSize: 27.0,
                                color: Colors.white),
                          ),
                          
                          Icon(Icons.keyboard_arrow_up_rounded),
                          */

                        ],
                      ),
                    ],
                  ),

                   //_BuildIgredient(),

                ],
                ),
            ),

            /*TopBar*/
            Padding(
              padding: const EdgeInsets.only(top: 24.0),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios)),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FloatingActionButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    backgroundColor: AppColors.backgroundColor,
                  ),
                )
              ],
          ),
            ),
          ],
        ),
);
  }

  Container _BuildIgredient() {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, top: 80),
        child:
        ListView.builder(
          itemBuilder: (context, index) =>
            ListTile(
              leading: Checkbox(
                value: isCheck,
                onChanged: (bool? value) {
                  setState(() {
                    isCheck = value!;
                  });
                },
              ),
              title: Text(widget.food.ingredents[index].ingredient.toString(),
                  style: GoogleFonts.notoSans(
                      fontSize: 22,
                      color: Colors.black,
                      decoration: isCheck
                          ? TextDecoration.lineThrough
                          : TextDecoration.none)),
            ),
      ),
      )
    );
  }

  Widget oldListView() {
    return ListView(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.arrow_back)),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: FloatingActionButton(
                    onPressed: () {},
                    child: const Icon(
                      Icons.edit,
                      color: Colors.white,
                    ),
                    backgroundColor: AppColors.backgroundColor,
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 177.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 700,
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor.withOpacity(0.75),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(100),
                            topRight: Radius.circular(100))),
                  ),
                ),
                Column(
                  children: [
                    Center(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 90.0),
                      child: Image.asset(widget.food.asset_img),
                    )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.food.nameDisplay,
                        style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w800,
                            fontSize: 27.0,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.food.description ?? "",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.w800,
                            fontSize: 18.0,
                            color: Colors.white),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 50),
                      child: Divider(
                        height: 2,
                        color: Colors.white60,
                      ),
                    ),
                    Text(
                      "Ingredients",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.notoSans(
                          fontWeight: FontWeight.w800,
                          fontSize: 27.0,
                          color: Colors.white),
                    ),
                    _BuildIgredient(),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}


/* APP BAR */
/*//APPBAR
        Container(
          color: Colors.transparent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back)),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: FloatingActionButton(
                  onPressed: () {},
                  child: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                  backgroundColor: AppColors.backgroundColor,
                ),
              ),
            ],
          ),
        ),*/