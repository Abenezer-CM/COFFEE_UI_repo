// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:flutter/material.dart';

class CoffeeDetailsScreen extends StatefulWidget {
  final imgLocation;
  final coffeeName;

  CoffeeDetailsScreen(
      {super.key, required this.imgLocation, required this.coffeeName});

  @override
  State<CoffeeDetailsScreen> createState() => _CoffeeDetailsScreenState();
}

class _CoffeeDetailsScreenState extends State<CoffeeDetailsScreen> {
  int currentSize = 0;

  Widget sizePicker(int idNo, String size) {
    bool isSelected = currentSize == idNo;

    return Expanded(
        child: GestureDetector(
      onTap: () {
        setState(() {
          currentSize = idNo;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 10),
        height: 40,
        decoration: BoxDecoration(
            border: (isSelected)
                ? Border.all(color: Colors.orange)
                : Border.all(color: Colors.transparent),
            color: (isSelected) ? Color(0xff0C0F14) : Color(0xff141921),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text(
            "$size",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: (isSelected) ? Colors.orange : Colors.white60,
                fontSize: 17),
          ),
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0C0F14),
      // Main colum that containes everything
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 13.0, right: 13.0, top: 50),
          child: Column(
            children: [
              // stack for the image and the contents on it

              Stack(
                children: [
                  // Image Display

                  ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                          height: 480,
                          "${widget.imgLocation}")),

                  //The two icons at the top of the image

                  Positioned(
                    top: 30,
                    left: 25,
                    right: 25,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(136, 0, 0, 0),
                                  borderRadius: BorderRadius.circular(10)),
                              padding: const EdgeInsets.all(5),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white60,
                              )),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: const Color.fromARGB(136, 0, 0, 0),
                                borderRadius: BorderRadius.circular(10)),
                            padding: const EdgeInsets.all(5),
                            child: const Icon(
                              Icons.favorite,
                              color: Colors.white60,
                            )),
                      ],
                    ),
                  ),

                  //container with  content at the bottom of the image

                  Positioned(
                    top: 353,
                    left: 0,
                    right: 0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(
                            sigmaX: 10,
                            sigmaY: 10), // Adjust blur intensity here
                        child: Container(
                          height: 130,
                          width: 390,
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(
                                0.5), // Semi-transparent overlay color
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // first content column
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.coffeeName,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 23),
                                    ),
                                    Text(
                                      "With Oat Milk",
                                      style: TextStyle(
                                          fontSize: 12, color: Colors.white54),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          color: Colors.orange,
                                          Icons.star,
                                          size: 17,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "4.5",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 17),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "(6,986)",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                                // second content column
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: Color(0xff101419),
                                          ),
                                          width: 45,
                                          height: 45,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.coffee,
                                                color: Colors.orange,
                                                size: 15,
                                              ),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Text(
                                                "Coffee",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white54),
                                              )
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            color: Color(0xff101419),
                                          ),
                                          width: 45,
                                          height: 45,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.water_drop,
                                                color: Colors.orange,
                                                size: 15,
                                              ),
                                              SizedBox(
                                                height: 3,
                                              ),
                                              Text(
                                                "Milk",
                                                style: TextStyle(
                                                    fontSize: 10,
                                                    color: Colors.white54),
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xff101419),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                      height: 40,
                                      width: 100,
                                      child: Center(
                                        child: Text(
                                          "Medium Roasted",
                                          style: TextStyle(
                                              color: Colors.white54,
                                              fontSize: 10),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              Align(
                alignment: Alignment(-1, -1),
                child: Text(
                  "Description",
                  style: TextStyle(fontSize: 16, color: Colors.white54),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Cappuccino is a rich Italian coffee made with equal parts espresso, steamed milk, and frothy milk foam on top. It’s creamy, balanced, and often dusted with cocoa or cinnamon, creating a perfect blend of bold espresso flavor with smooth, airy foam.",
                style: TextStyle(
                    fontSize: 15,
                    color: const Color.fromARGB(255, 233, 233, 233)),
              ),
              SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment(-1, -1),
                child: Text(
                  "Size",
                  style: TextStyle(fontSize: 16, color: Colors.white54),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  sizePicker(0, "S"),
                  sizePicker(1, "M"),
                  sizePicker(2, "L"),
                ],
              ),
              SizedBox(
                height: 27,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 16),
                          child: Text(
                            "price",
                            style: TextStyle(color: Colors.white54),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        RichText(
                          text: TextSpan(
                              text: "\$ ",
                              style:
                                  TextStyle(color: Colors.orange, fontSize: 22),
                              children: [
                                TextSpan(
                                    text: "4.20",
                                    style: TextStyle(color: Colors.white))
                              ]),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              minimumSize: Size.fromHeight(50),
                              backgroundColor: Colors.orange),
                          onPressed: () {},
                          child: Text(
                            "Buy Now",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 21),
                          )))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
