import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products.dart';
import './product_item.dart';

class ProductGrid extends StatelessWidget {
  final bool showFavs;

  ProductGrid(this.showFavs);
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.Favoriteitems : productsData.items;

    return products.isEmpty
        ? showFavs
            ? Center(child: Text('Add some favorites.'))
            : Center(child: Text('Add some products.'))
        : GridView.builder(
            padding: const EdgeInsets.all(10.0),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
            itemBuilder: (ctx, i) {
              // return ChangeNotifierProvider(
              //   create: (ctx) => products[i],
              return ChangeNotifierProvider.value(
                //when context not needed use changeNotifierProvider.value
                value: products[i],
                child: ProductItem(),
              );

              //single product is acting like a provider for productItem
            },
            itemCount: products.length,
          );
  }
}
