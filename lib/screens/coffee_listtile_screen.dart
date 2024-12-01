// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffeeuiapp/screens/coffee_details_screen.dart';
import 'package:flutter/material.dart';

class CoffeeListtileScreen extends StatefulWidget {
  final double rating;
  final String imgLocation;
  final String coffeeName;
  final String coffeeNameDesc;
  final double price;
  final int idNo;

  const CoffeeListtileScreen({
    super.key,
    required this.rating,
    required this.imgLocation,
    required this.coffeeName,
    required this.coffeeNameDesc,
    required this.price,
    required this.idNo,
  });

  @override
  State<CoffeeListtileScreen> createState() => _CoffeeListtileScreenState();
}

class _CoffeeListtileScreenState extends State<CoffeeListtileScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color(0xff242933), Color(0xff0E1116)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(35)),
      margin: EdgeInsets.only(right: 20),
      height: 50,
      width: 170,
      child: Column(
        children: [
          Stack(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                      width: double.infinity,
                      fit: BoxFit.fitWidth,
                      height: 180,
                      widget.imgLocation)),
              Positioned(
                top: 7,
                left: 79,
                child: Opacity(
                  opacity: 0.8,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black),
                    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 17,
                        ),
                        Text(
                          " ${widget.rating}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 13),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment(-1, -1),
            child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  widget.coffeeName,
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                )),
          ),
          Align(
              alignment: Alignment(-1, -1),
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  widget.coffeeNameDesc,
                  style: TextStyle(fontSize: 12, color: Colors.white54),
                ),
              )),
          SizedBox(
            height: 8,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 9.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      "\$",
                      style: TextStyle(
                          color: Colors.orange,
                          fontWeight: FontWeight.w700,
                          fontSize: 17),
                    ),
                    Text(
                      " ${widget.price}",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 17),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    switch (widget.idNo) {
                      case 1:
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CoffeeDetailsScreen(
                              coffeeName: "Capuccino",
                              imgLocation: "assets/images/coffee_1.jpg");
                        }));

                      case 2:
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CoffeeDetailsScreen(
                              coffeeName: "Americano",
                              imgLocation: "assets/images/coffee_2.jpg");
                        }));

                      case 3:
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CoffeeDetailsScreen(
                              coffeeName: "Latte",
                              imgLocation: "assets/images/coffee_3.jpg");
                        }));

                      case 4:
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CoffeeDetailsScreen(
                              coffeeName: "Mocha",
                              imgLocation: "assets/images/coffee_4.jpg");
                        }));

                      default:
                        return;
                    }
                  },
                  child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange,
                      ),
                      padding: EdgeInsets.all(3.5),
                      child: Icon(Icons.add)),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
