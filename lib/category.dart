import 'package:flutter/material.dart';
import 'package:listac/cartmodel.dart';
import 'package:listac/home.dart';
import 'package:scoped_model/scoped_model.dart';
//import 'package:scoped_model/scoped_rtmodel.dart';

class CategoryPage extends StatelessWidget {
  List<Product> _products = [
    Product(
      id: 1,
      title: "Meyve-Sebze",
      price: 10,
      imgUrl: "https://img.icons8.com/color/96/000000/blueberry.png",
      qty: 1,
      //screen: HomePage()
    ),
    Product(
      id: 2,
      title: "Bebek",
      price: 10,
      imgUrl: "https://img.icons8.com/doodle/96/000000/baby-bottle.png",
      qty: 1,
      //screen: HomePage()
    ),
    Product(
      id: 3,
      title: "Temizlik",
      price: 10,
      imgUrl: "https://img.icons8.com/doodle/96/000000/hand-wash.png",
      qty: 1,
      //screen: HomePage()
    ),
    Product(
      id: 4,
      title: "Yiyecek",
      price: 10,
      imgUrl: "https://img.icons8.com/color/96/000000/chocolate-bar.png",
      qty: 1,
      //screen: HomePage()
    ),
    Product(
      id: 5,
      title: "Kozmetik",
      price: 10,
      imgUrl: "https://img.icons8.com/doodle/48/000000/perfume-bottle.png",
      qty: 1,
      //screen: HomePage()
    ),
    Product(
      id: 6,
      title: "Kırtasiye",
      price: 10,
      imgUrl: "https://img.icons8.com/doodle/96/000000/teaching.png",
      qty: 1,
      //screen: HomePage()
    ),
    Product(
      id: 7,
      title: "Teknoloji",
      price: 10,
      imgUrl: "https://img.icons8.com/doodle/96/000000/electrical--v1.png",
      qty: 1,
      //screen: HomePage()
    ),
    Product(
      id: 8,
      title: "Oyuncak",
      price: 10,
      imgUrl: "https://img.icons8.com/fluency/96/000000/toy-train.png",
      qty: 1,
      //screen: HomePage()
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Kategoriler"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
          )
        ],
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(8.0),
        itemCount: _products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 0.8),
        itemBuilder: (context, index) {
          return ScopedModelDescendant<CartModel>(
              builder: (context, child, model) {
            return Card(
                child: Column(children: <Widget>[
              Image.network(
                _products[index].imgUrl,
                height: 120,
                width: 120,
              ),
              Text(
                _products[index].title,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(_products[index].price.toString()),
              RaisedButton(
                child: Text("Git"),
                color: Colors.green,
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => HomePage())
                    //builder: (context) => HomePage()),
                    ),

                /*OutlineButton(
                  child: Text("Git"),
                  onPressed: () => model.addProduct(_products[index]))*/
              )
            ]));
          });
        },
      ),

      // ListView.builder(
      //   itemExtent: 80,
      //   itemCount: _products.length,
      //   itemBuilder: (context, index) {
      //     return ScopedModelDescendant<CartModel>(
      //         builder: (context, child, model) {
      //       return ListTile(
      //           leading: Image.network(_products[index].imgUrl),
      //           title: Text(_products[index].title),
      //           subtitle: Text("\₺"+_products[index].price.toString()),
      //           trailing: OutlineButton(
      //               child: Text("Add"),
      //               onPressed: () => model.addProduct(_products[index])));
      //     });
      //   },
      // ),
    );
  }
}
