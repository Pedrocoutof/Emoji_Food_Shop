import 'package:flutter/material.dart';
import 'package:shop_emoji_ui/models/Food.dart';
import 'package:shop_emoji_ui/AppColors.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: ListView(
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
                fontWeight: FontWeight.w800, fontSize: 27.0, color: Colors.white),
          ),
                      _BuildIgredient(),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

 Container _BuildIgredient() {
   return Container(
     child: Column(
        children: [
          ListTile(
            leading: Checkbox(
              value: isCheck,
              onChanged: (bool? value) {
                setState(() {
                  isCheck = value!;
                });
              },
            ),
            title: Text( "Ingrediente 1",
                style: GoogleFonts.notoSans(
                    fontSize: 22,
                    color: Colors.white,
                    decoration: isCheck
                        ? TextDecoration.lineThrough
                        : TextDecoration.none)),
          ),
        ],
      ),
   );
  }
}
