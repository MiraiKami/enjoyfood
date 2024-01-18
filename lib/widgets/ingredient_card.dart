import 'package:flutter/cupertino.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class IngredientCard extends StatelessWidget {
  final Ingredient ingredient;

  const IngredientCard({super.key, required this.ingredient});

  @override
  Widget build(BuildContext context) {
    return Center(
      child : Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Row(
              children: [
                const Text("Nom de l'ingrédient : ", style: TextStyle(fontWeight: FontWeight.bold)),
              Flexible(child: Text(ingredient.text ?? "Ingrédient incoonu"))
              ],
            ),
            Row(
              children: [
                const Text("Présence de l'ingrédient (%) : ", style: TextStyle(fontWeight: FontWeight.bold)),
                Text(ingredient.percent != null ? ingredient.percent.toString() : 'non renseignée')
              ],
            )
          ],
        )
      )
    );
  }
}