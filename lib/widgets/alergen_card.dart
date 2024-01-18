import 'package:flutter/cupertino.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class AllergenCard extends StatelessWidget {
  final String allergen;

  const AllergenCard({super.key, required this.allergen});

  @override
  Widget build(BuildContext context) {
    return Center(
      child : Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: [
            Row(
              children: [
                const Text("Nom de l'allergène : ", style: TextStyle(fontWeight: FontWeight.bold)),
                Flexible(child: Text(allergen))
              ],
            )
          ],
        )
      )
    );
  }
}