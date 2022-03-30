import 'package:flutter/material.dart';
import 'package:shop_emoji_ui/models/Food.dart';
import 'package:shop_emoji_ui/AppColors.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodPage extends StatefulWidget {
  final Food food;
  FoodPage({ Key? key, required this.food}) : super(key: key);

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: IconButton(onPressed: () {Navigator.pop(context);}, icon: Icon(Icons.arrow_back)),
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
              Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              widget.food.nameDisplay,
              style: GoogleFonts.notoSans(
                  fontWeight: FontWeight.w800, fontSize: 27.0),
            ),
          ),
        Stack(
          children: [
           Padding(
             padding: const EdgeInsets.only(top: 177.0),
             child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height - 300,
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.75),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(100), topRight: Radius.circular(100))
              ),
              ),
           ),
          
           Center(child: Padding(
             padding: const EdgeInsets.only(top: 90.0),
             child: Image.asset(widget.food.asset_img),
           )),
          ],
        ),
      ],
    ),);
  }
}