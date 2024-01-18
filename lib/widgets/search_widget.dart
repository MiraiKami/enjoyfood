import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../screens/products_list.dart';

class SearchWidget extends StatelessWidget {
  final String hint;
  final String route;
  const SearchWidget({super.key, required this.hint, required this.route});

  @override
  Widget build(BuildContext context) {
    final TextEditingController _textEditingController = TextEditingController();
    return SearchBar(
      hintText: hint,
      controller: _textEditingController,
      padding: const MaterialStatePropertyAll<EdgeInsets>(
          EdgeInsets.symmetric(horizontal: 16.0)),
      leading: const Icon(Icons.search),
      onSubmitted: (String productName) {
        Navigator.pushNamed(context, route, arguments: productName);
      },
    );
  }
}