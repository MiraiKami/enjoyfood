import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

import '../widgets/alergen_card.dart';
import '../widgets/ingredient_card.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const String route = "/products/product_detail";
  final Product product;

  const ProductDetailsScreen({super.key, required this.product});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    List<Ingredient> ingredients = widget.product.ingredients ?? List.empty();
    List<String> allergens = widget.product.allergens != null ? widget.product.allergens!.names : List.empty();
    return Scaffold(
        appBar: AppBar(
          title: Text('Product Information : ${widget.product.productName}'),
        ),

        body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              children: [
                Center(
                  child: Image(
                      image: widget.product.imageFrontUrl != null ?
                      Image.network(widget.product.imageFrontUrl!).image :
                      Image.asset('assets/images/question_mark.png').image,
                      width: 300, height: 300
                  )
                ),
                const SizedBox(height: 10),
                const Text('Ingrédients', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Expanded(
                  child: ListView.builder(
                    itemCount : ingredients.length,
                      itemBuilder: (context, index) {
                        return IngredientCard(ingredient: ingredients[index]);
                      }
                  )
                ),
                const SizedBox(height: 10),
                const Text('Allergènes', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                Expanded(
                    child: ListView.builder(
                        itemCount : allergens.length,
                        itemBuilder: (context, index) {
                          return AllergenCard(allergen: allergens[index]);
                        }
                    )
                )
              ],
            )
        )
    );
  }
}