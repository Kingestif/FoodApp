// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  final String imageUrl;
  final String foodName;
  final String description;
  final String foodPrice;
  final String foodRating;
  final String foodDiscount;

  DetailsPage({
    required this.imageUrl,
    required this.foodName,
    required this.description,
    required this.foodPrice,
    required this.foodRating,
    required this.foodDiscount,
  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  bool _addCheese = false;
  bool _addMeat = false;
  bool _addBeacon = false;
  int initial = 1;

  void _increment() {
    setState(() {
      initial += 1;
    });
  }

  void _decrement() {
    setState(() {
      if (initial > 0) {
        initial -= 1;
      }
    });
  }

  void _toggleCheckbox(String option) {
    setState(() {
      switch (option) {
        case 'cheese':
          _addCheese = !_addCheese;
          break;
        case 'meat':
          _addMeat = !_addMeat;
          break;
        case 'beacon':
          _addBeacon = !_addBeacon;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: null,
        body: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: [
                  // Image
                  Container(
                    child: Card(
                      margin: EdgeInsets.zero,
                      elevation: 0,
                      child: Stack(
                        children: [
                          Container(
                            // Shoe pic
                            width: double.infinity,
                            height: 300,
                            child: ClipRRect(
                              child: Image.network(
                                widget.imageUrl,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),

                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: IconButton(
                              icon: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 18,
                                  child: Icon(Icons.favorite_border,
                                      color: Colors.deepOrange)),
                              onPressed: () {
                                // Handle the favorite action
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 10),
                      width: MediaQuery.of(context).size.width * 0.85,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.foodName,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  '£ ${widget.foodPrice}',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 25,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '£ ${widget.foodDiscount}',
                                  style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.red,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.star, color: Colors.amber),
                                Text(widget.foodRating,
                                    style: TextStyle(fontSize: 19)),
                              ],
                            ),
                            Text(widget.description,
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 16)),
                            SizedBox(height: 30),
                            Text('Additional Options:',
                                style: TextStyle(
                                    fontSize: 19, fontWeight: FontWeight.bold)),
                            _buildOptionRow('Add Cheese', _addCheese, 'cheese'),
                            _buildOptionRow('Add Meat', _addMeat, 'meat'),
                            _buildOptionRow('Add Beacon', _addBeacon, 'beacon'),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width * 0.85,

                      // color: Colors.red,
                      child: Row(
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove, size: 30),
                            onPressed: _decrement,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            initial.toString(),
                            style: TextStyle(fontSize: 30),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          IconButton(
                            icon: Icon(Icons.add, size: 30),
                            onPressed: _increment,
                          ),
                          Spacer(),
                          Container(
                            width: 160,
                            height: 50,
                            child: ElevatedButton(
                              //PURE BUTTON
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Add to Basket",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),

                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(double.infinity, 40),
                                backgroundColor: Colors.deepOrangeAccent,
                                shape: RoundedRectangleBorder(
                                  //MAKE the Button Square
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              // MAKE it last of the stack (WIDGETS declared at the Bottom are displayed on the Top)!!
              top: 2,
              left: 2,
              child: FloatingActionButton(
                shape: CircleBorder(),
                mini: true,
                backgroundColor: Colors.white,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back_ios_new, size: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOptionRow(String label, bool value, String option) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 19),
        ),
        Spacer(),
        Text(
          '+£10.00',
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        Checkbox(
          value: value,
          onChanged: (bool? newValue) {
            _toggleCheckbox(option);
          },
        ),
      ],
    );
  }
}
