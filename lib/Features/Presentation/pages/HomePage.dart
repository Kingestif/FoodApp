// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:untitled/Features/BusinessLogic/food_bloc.dart';
import 'package:untitled/Features/Presentation/pages/detailsPage.dart';
import '../../Domain/entity/Food.dart';
import '../bloc/food_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/assesBurger.png',
              fit: BoxFit.cover,
              width: 50,
              height: 50,
            ),
            SizedBox(width: 8),
            Text(
              'Burger',
              style: TextStyle(),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Search bar
              TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  suffixIcon: Icon(Icons.tune, color: Colors.black),
                  hintText: 'Search',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                  ),
                  filled: true,
                  fillColor: Colors.grey.withOpacity(0.1),
                  border: InputBorder.none,
                ),
              ),
              SizedBox(height: 20),
              // Grid of foods
              Expanded(
                child: BlocBuilder<FoodBloc, FoodState>(
                  builder: (context, state) {
                    if (state is FoodInitial) {
                      return Center(child: CircularProgressIndicator());
                    } else if (state is LoadedHomeState) {
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, // Number of columns in the grid
                          crossAxisSpacing: 10, // Space between columns
                          mainAxisSpacing: 10, // Space between rows
                          childAspectRatio: 0.8, // Aspect ratio(height) of each item
                        ),
                        itemCount: state.products.length,
                        itemBuilder: (context, index) {
                          final food = state.products[index];
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => DetailsPage(
                                    imageUrl: food.imageUrl,
                                    foodName: food.title,
                                    description: food.description,
                                    foodPrice: food.price.toString(),
                                    foodRating: food.rating.toString(),
                                    foodDiscount: food.discount.toString(),
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          food.imageUrl,
                                          height: 130,
                                          width: double.infinity,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Positioned(
                                        top: 10,
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
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          food.title,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        SizedBox(height: 3),
                                        Row(
                                          children: [
                                            Icon(Icons.star,
                                                color: Colors.amber),
                                            Text(food.rating.toString()),
                                          ],
                                        ),
                                        SizedBox(height: 3),
                                        Row(
                                          children: [
                                            Text(
                                              '£ ${food.price.toString()}',
                                              style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 18,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              '£ ${food.discount.toString()}',
                                              style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.red,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    } else if (state is LoadHomeFailure) {
                      return Center(child: Text('Error: ${state.message}'));
                    } else {
                      return Center(child: Text('No Data Available'));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
