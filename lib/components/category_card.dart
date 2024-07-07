import 'package:flutter/material.dart';
import 'package:yummy/models/food_category.dart';

class CategoryCard extends StatelessWidget {
  final FoodCategory category;

  const CategoryCard({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: Get text theme
    final textTheme = Theme.of(context)
        .textTheme
        .apply(displayColor: Theme.of(context).colorScheme.onSurface);

    //TODO: Replace with card widget
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // TODO: Add Stack widget
          Stack(
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(8.0)),
                child: Image(
                  image: AssetImage(category.imageUrl),
                ),
              ),
              Positioned(
                left: 16.0,
                top: 16.0,
                child: Text(
                  'Yummy',
                  style: textTheme.headlineLarge,
                ),
              ),
              Positioned(
                  bottom: 16.0,
                  right: 16.0,
                  child: RotatedBox(
                    quarterTurns: 2,
                    child: Text(
                      'Smoothies',
                      style: textTheme.headlineLarge,
                    ),
                  )),
            ],
          ),
          // TODO: Add ListTile widget
          ListTile(
            title: Text(
              category.name,
              style: textTheme.titleSmall,
            ),
            subtitle: Text('${category.numberOfRestaurants} places',
                style: textTheme.bodySmall),
          ),
        ],
      ),
    );
  }
}
