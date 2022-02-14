import 'package:flutter/material.dart';
import 'package:listac/cartmodel.dart';
import 'package:scoped_model/scoped_model.dart';
//import 'package:scoped_model/scoped_rtmodel.dart';

class HomePage extends StatelessWidget {
  List<Product> _products = [
    Product(
        id: 1,
        title: "Elma",
        price: 5.0,
        imgUrl: "https://img.icons8.com/plasticine/2x/apple.png",
        qty: 1),
    Product(
        id: 2,
        title: "Muz",
        price: 11.0,
        imgUrl: "https://img.icons8.com/cotton/2x/banana.png",
        qty: 1),
    Product(
        id: 3,
        title: "Portakal",
        price: 9.0,
        imgUrl: "https://img.icons8.com/cotton/2x/orange.png",
        qty: 1),
    Product(
        id: 4,
        title: "Karpuz",
        price: 8.0,
        imgUrl: "https://img.icons8.com/cotton/2x/watermelon.png",
        qty: 1),
    Product(
        id: 5,
        title: "Avokado",
        price: 25.0,
        imgUrl: "https://img.icons8.com/cotton/2x/avocado.png",
        qty: 1),
    Product(
        id: 6,
        title: "Şeftali",
        price: 8.5,
        imgUrl: "https://img.icons8.com/plasticine/100/000000/peach.png",
        qty: 1),
    Product(
        id: 7,
        title: "Üzüm",
        price: 6.5,
        imgUrl: "https://img.icons8.com/doodle/96/000000/grape.png",
        qty: 1),
    Product(
        id: 8,
        title: "Çilek",
        price: 17.5,
        imgUrl: "https://img.icons8.com/doodle/96/000000/strawberry-2.png",
        qty: 1),
    Product(
        id: 9,
        title: "Armut",
        price: 7.5,
        imgUrl: "https://img.icons8.com/color/96/000000/bad-pear.png",
        qty: 1),
    Product(
        id: 10,
        title: "Vişne",
        price: 10.5,
        imgUrl: "https://img.icons8.com/fluency/96/000000/cherry.png",
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
