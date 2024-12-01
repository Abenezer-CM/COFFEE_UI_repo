// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffeeuiapp/screens/coffee_listtile_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0; // Keep track of the selected index
  final List<String> coffeeNames = [
    'Cappuccino',
    'Espresso',
    'Latte',
    'Americano',
    'Macchiato',
    'Mocha',
    'Flat White',
    'Ristretto',
    'Affogato',
    'Cortado',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xff0C0F14),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: Icon(
            Icons.apps,
            size: 30,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 17),
              child: Container(
                padding: EdgeInsets.all(2.5),
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 52, 58, 70),
                    borderRadius: BorderRadius.circular(10)),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child:
                        Image.asset(height: 40, "assets/images/profile.jpg")),
              ),
            )
          ],
        ),
        // Main column that containes everything
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // top part text

              SizedBox(
                height: 25,
              ),
              Text(
                "Find the best \ncoffee for you",
                style: GoogleFonts.bebasNeue(
                    textStyle: TextStyle(fontSize: 40, height: 1.2)),
              ),

              // text field

              SizedBox(
                height: 25,
              ),
              TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xff141921),
                    hintStyle: TextStyle(
                      color: Colors.white38,
                    ),
                    hintText: "Find your coffee...",
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.white38,
                      size: 25,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(
                          20,
                        )),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white54),
                        borderRadius: BorderRadius.circular(20))),
              ),

              // horizontal listview items

              SizedBox(
                height: 40,
              ),
              SizedBox(
                  height: 70,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: coffeeNames.length,
                      itemBuilder: (BuildContext context, index) {
                        bool isSelected = selectedIndex == index;
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Column(
                              children: [
                                Text(
                                  coffeeNames[index],
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: (isSelected)
                                          ? Colors.orange
                                          : const Color.fromARGB(
                                              255, 132, 131, 131)),
                                ),
                                (isSelected)
                                    ? CircleAvatar(
                                        radius: 4,
                                        backgroundColor: Colors.orange,
                                      )
                                    : Text(""),
                              ],
                            ),
                          ),
                        );
                      })),

              //horizontal scrollable cards / containers with info

              SizedBox(
                height: 310,
                width: double.infinity,
                child: ListView(scrollDirection: Axis.horizontal, children: [
                  CoffeeListtileScreen(
                    rating: 4.5,
                    imgLocation: "assets/images/coffee_1.jpg",
                    coffeeName: "Capuccino",
                    coffeeNameDesc: "with Oat Milk",
                    price: 4.25,
                    idNo: 1,
                  ),
                  CoffeeListtileScreen(
                    rating: 4.5,
                    imgLocation: "assets/images/coffee_2.jpg",
                    coffeeName: "Americano",
                    coffeeNameDesc: "Dark And Bold",
                    price: 5.13,
                    idNo: 2,
                  ),
                  CoffeeListtileScreen(
                    rating: 5,
                    imgLocation: "assets/images/coffee_3.jpg",
                    coffeeName: "Latte",
                    coffeeNameDesc: "Creamy Texture",
                    price: 7.55,
                    idNo: 3,
                  ),
                  CoffeeListtileScreen(
                    rating: 4.55,
                    imgLocation: "assets/images/coffee_4.jpg",
                    coffeeName: "Mocha",
                    coffeeNameDesc: "Blend of Arabica",
                    price: 7.55,
                    idNo: 4,
                  ),
                ]),
              ),

              //special for you container
              SizedBox(
                height: 12,
              ),
              Text(
                "Special for you",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                height: 170,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                      colors: [Color(0xff242933), Color(0xff0E1116)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                            width: 120,
                            fit: BoxFit.fitWidth,
                            "assets/images/coffee_2.jpg"),
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "Four Coffee Beans\n You Must Try!",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "Guji",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "Yirgacheffe",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "Sidama",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "Harar",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w300),
                          ),
                          SizedBox(
                            height: 3,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ]

                    //bottom navigation bar

                    ),
          ),
        ),
        bottomNavigationBar: Container(
          color: Color.fromARGB(255, 20, 22, 28),
          padding: EdgeInsets.only(left: 45, right: 45, bottom: 17, top: 17),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.home,
                size: 27,
                color: Colors.orange,
              ),
              Icon(
                Icons.card_travel_rounded,
                size: 27,
              ),
              Icon(
                Icons.favorite,
                size: 27,
              ),
              Icon(
                Icons.notifications,
                size: 27,
              ),
            ],
          ),
        ));
  }
}
