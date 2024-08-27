// ignore_for_file: prefer_const_constructors
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:untitled/Features/Presentation/pages/HomePage.dart';

import 'Dependency_injection.dart';
import 'Features/Presentation/bloc/food_bloc.dart';
import 'Features/Presentation/pages/SplashScreen.dart';
import 'Features/Presentation/pages/cartPage.dart';
import 'Features/Presentation/pages/detailsPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FoodBloc>(
          create: (context) => sl.get<FoodBloc>()..add(StarterEvent()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const SplashScreen(),
          '/second': (context) => Center(child: const HomePage()),
          '/third' : (context) => DetailsPage(imageUrl: '', foodName: '', description: '', foodPrice: '', foodRating: '', foodDiscount: ''),
          '/fourth': (context) => CartPage(),
        },
      ),
    );
  }
}
