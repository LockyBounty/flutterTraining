import 'package:flutter/material.dart';

// class MyAppBar extends StatelessWidget {
//   MyAppBar({this.title});

//   // Fields in a Widget subclass are always marked "final".

//   final Widget title;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 56.0, // in logical pixels
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       decoration: BoxDecoration(color: Colors.blue[500]),
//       // Row is a horizontal, linear layout.
//       child: Row(
//         // <Widget> is the type of items in the list.
//         children: <Widget>[
//           IconButton(
//             icon: Icon(Icons.menu),
//             tooltip: 'Navigation menu',
//             onPressed: null, // null disables the button
//           ),
//           // Expanded expands its child to fill the available space.
//           Expanded(
//             child: title,
//           ),
//           IconButton(
//             icon: Icon(Icons.search),
//             tooltip: 'Search',
//             onPressed: null,
//           ),
//         ],
//       ),
//     );
//   }
// }

// var button1 = 0;

// class MyButton extends StatelessWidget {
  
//   @override
//   Widget build(BuildContext context) {
    
//     return GestureDetector(
//       onTap: () {
        
//         print('MyButton was tapped! ${button1++}');
//       },
//       child: Container(
//         height: 56.0,
//         padding: const EdgeInsets.all(8.0),
//         margin: const EdgeInsets.symmetric(horizontal: 8.0),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(9.0),
//           color: Colors.green,
//         ),
//         child: Center(
//           child: Text('Button $button1'),
//         ),
//       ),
//     );
//   }
// }

// class MyScaffold extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var tester= 'test here';
//     // Material is a conceptual piece of paper on which the UI appears.
//     return Material(
//       // Column is a vertical, linear layout.
//       child: Column(
//         children: <Widget>[
//           MyAppBar(
//             title: Text(
//               'Thunder application',
//               style: Theme.of(context).primaryTextTheme.title,
//             ),
//           ),
//           Expanded(
//             child: Center(
//               child: Text(tester),
              
//                 //"Hello, welcome to North Korea my friend, we wish you a good trip! and dont forget buy our party badge"),
//             ),
//           ),
//           ShoppingList()
//           MyButton(),
//           Counter(),
          
//         ],
//       ),
//     );
//   }
// }



class CounterDisplay extends StatelessWidget {
  CounterDisplay({this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    print('I pissed on your face $count times');
    return Text('Count: $count') ;
  }
}

class CounterIncrementor extends StatelessWidget {
  CounterIncrementor({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      child: Text('Increment Piss'),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int _counter = 0;

  void _increment() {
    setState(() {
      ++_counter;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: <Widget>[
      CounterIncrementor(onPressed: _increment),
      Expanded(child: Center(
              child: Text("lol"),)),
      CounterDisplay(count: _counter),
    ]);
  }
}


class Product {
  const Product({this.name});
  final String name;
}

typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({Product product, this.inCart, this.onCartChanged})
      : product = product,
        super(key: ObjectKey(product));

  final Product product;
  final bool inCart;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    // The theme depends on the BuildContext because different parts of the tree
    // can have different themes.  The BuildContext indicates where the build is
    // taking place and therefore which theme to use.

    return inCart ? Colors.green : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle(BuildContext context) {
    if (!inCart) return null;

    return TextStyle(
      color: Colors.green,
      decoration: TextDecoration.lineThrough,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        onCartChanged(product, inCart);
      },
      leading: CircleAvatar(
        backgroundColor: _getColor(context),
        child: Text(product.name[0]),
      ),
      title: Text(product.name, style: _getTextStyle(context)),
    );
  }
}

class ShoppingList extends StatefulWidget {
  ShoppingList({Key key, this.products}) : super(key: key);

  final List<Product> products;

  // The framework calls createState the first time a widget appears at a given
  // location in the tree. If the parent rebuilds and uses the same type of
  // widget (with the same key), the framework re-uses the State object
  // instead of creating a new State object.

  @override
  _ShoppingListState createState() => _ShoppingListState();
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = Set<Product>();

  void _handleCartChanged(Product product, bool inCart) {
    setState(() {
      // When a user changes what's in the cart, you need to change
      // _shoppingCart inside a setState call to trigger a rebuild.
      // The framework then calls build, below,
      // which updates the visual appearance of the app.

      if (!inCart)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping List'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        children: widget.products.map((Product product) {
          return ShoppingListItem(
            product: product,
            inCart: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    title: 'Shopping App',
    home: ShoppingList(
      products: <Product>[
        Product(name: 'Eggs'),
        Product(name: 'Flour'),
        Product(name: 'Chocolate chips'),
      ],
    ),
  ));
}

// void main() {
//   runApp(MaterialApp(
//     title: 'My app', // used by the OS task switcher
//     home: MyScaffold(),
    
//   ));
// }