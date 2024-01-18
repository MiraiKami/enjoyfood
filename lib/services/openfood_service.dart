
import 'package:openfoodfacts/openfoodfacts.dart';

class OpenFoodService {
  static Future<SearchResult> searchProductByName(OpenFoodFactsLanguage language, List<String> terms){
    ProductSearchQueryConfiguration configuration = ProductSearchQueryConfiguration(parametersList: [
      SearchTerms(terms: terms)
    ],
        language: language,
        version: ProductQueryVersion.v3);

    return OpenFoodAPIClient.searchProducts(const User(userId: '', password: ''), configuration);
  }
}