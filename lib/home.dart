import 'package:flutter/material.dart';
import 'package:yummy/components/category_card.dart';
import 'package:yummy/components/color_button.dart';
import 'package:yummy/components/post_card.dart';
import 'package:yummy/components/restaurant_landscape_card.dart';
import 'package:yummy/components/theme_button.dart';
import 'package:yummy/constants.dart';
import 'package:yummy/models/food_category.dart';
import 'package:yummy/models/post.dart';
import 'package:yummy/models/restaurant.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
    required this.changeTheme,
    required this.changeColor,
    required this.colorSelected,
  });

  final void Function(bool useLightMode) changeTheme;
  final void Function(int value) changeColor;
  final ColorSelection colorSelected;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int tab = 0;

  List<NavigationDestination> appBarDestinations = const [
    NavigationDestination(
      icon: Icon(Icons.restaurant),
      label: 'Category',
      selectedIcon: Icon(Icons.restaurant),
    ),
    NavigationDestination(
      icon: Icon(Icons.post_add),
      label: 'Post',
      selectedIcon: Icon(Icons.post_add),
    ),
    NavigationDestination(
      icon: Icon(Icons.map),
      label: 'Restaurant',
      selectedIcon: Icon(Icons.map),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: Define pages
    final pages = [
      Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 300),
          child: CategoryCard(category: categories[0]),
        ),
      ),
      // TODO: Replace with post card
      Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: PostCard(post: posts[0]),
        ),
      ),
      Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: RestaurantLandscapeCard(restaurant: restaurants[0]),
        ),
      ),
      Container(
        color: Colors.blue,
      )
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 4.0,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          ThemeButton(changeThemeMode: widget.changeTheme),
          ColorButton(
              changeColor: widget.changeColor,
              colorSelected: widget.colorSelected),
        ],
        title: const Center(
            child: Text(
          'Yummy',
          style: TextStyle(fontSize: 24.0),
        )),
      ),
      // TODO: Switch between pages
      body: IndexedStack(
        index: tab,
        children: pages,
      ),
      // TODO: Add bottom navigation bar
      bottomNavigationBar: NavigationBar(
        destinations: appBarDestinations,
        selectedIndex: tab,
        onDestinationSelected: (index) {
          setState(() {
            tab = index;
          });
        },
      ),
    );
  }
}
