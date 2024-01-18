import 'package:enjoy_food/blocs/my_product/my_product_bloc.dart';
import 'package:enjoy_food/screens/product_details_screen.dart';
import 'package:enjoy_food/screens/products_list.dart';
import 'package:enjoy_food/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    OpenFoodAPIConfiguration.userAgent = UserAgent(
      name: 'EnjoyFood',
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider<MyProductBloc>(create: (context) =>
            MyProductBloc()
        )
      ],
      child: MaterialApp(
        title: 'Enjoy Food !',
        theme: ThemeData(
          primarySwatch: Colors.red
        ),
        routes : {
          '/home': (context) => const HomePage(title: 'Enjoy Food !'),
        },
        onGenerateRoute: (settings) {
          if (settings.name == ProductListScreen.route) {
            final productName = settings.arguments as String;
            return MaterialPageRoute(builder: (context) {
              return ProductListScreen(productName: productName);
            });
          } else if (settings.name == ProductDetailsScreen.route) {
            final product = settings.arguments as Product;
            return MaterialPageRoute(builder: (context) {
              return ProductDetailsScreen(product: product);
            });
          }
        },
        initialRoute: '/home',
      )
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: const Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SearchWidget(hint: "Search a product", route: ProductListScreen.route)
      )
    );
  }
}
