import 'package:flutter/material.dart';
import 'package:listac/cartmodel.dart';
import 'package:scoped_model/scoped_model.dart';
//import 'package:scoped_model/scoped_rtmodel.dart';

class BabyPage extends StatelessWidget {
  List<Product> _products = [
    Product(
        id: 1,
        title: "Biberon",
        price: 25.0,
        imgUrl: "https://img.icons8.com/color/100/000000/baby-bottle.png",
        qty: 1),
    Product(
        id: 2,
        title: "Oyuncak",
        price: 50.0,
        imgUrl: "https://img.icons8.com/office/80/000000/rattle.png",
        qty: 1),
    Product(
        id: 3,
        title: "Bebek Arabası",
        price: 1800.0,
        imgUrl: "https://img.icons8.com/doodle/96/000000/stroller--v1.png",
        qty: 1),
    Product(
        id: 4,
        title: "Ana Kucağı",
        price: 85.0,
        imgUrl: "https://img.icons8.com/color/100/000000/baby-sling.png",
        qty: 1),
    Product(
        id: 5,
        title: "Bebek Küveti",
        price: 1250.0,
        imgUrl: "https://img.icons8.com/color/100/000000/spa.png",
        qty: 1),
    Product(
        id: 6,
        title: "Bebek Çorabı",
        price: 8.5,
        imgUrl: "https://img.icons8.com/color/96/000000/pair-of-socks.png",
        qty: 1),
    Product(
        id: 7,
        title: "Bebek Bezi",
        price: 95.5,
        imgUrl: "https://img.icons8.com/bubbles/100/000000/nappy.png",
        qty: 1),
    Product(
        id: 8,
        title: "Beşik Süsü",
        price: 32.0,
        imgUrl: "https://img.icons8.com/color/100/000000/baby-mobile.png",
        qty: 1),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[50],
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Ürünler"),
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
              Text("\₺" + _products[index].price.toString()),
              OutlineButton(
                  child: Text("Ekle"),
                  color: Colors.green,
                  onPressed: () => model.addProduct(_products[index]))
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
