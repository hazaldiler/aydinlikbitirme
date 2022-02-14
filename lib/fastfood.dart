import 'package:flutter/material.dart';
import 'package:listac/cartmodel.dart';
import 'package:scoped_model/scoped_model.dart';
//import 'package:scoped_model/scoped_rtmodel.dart';

class FastfoodPage extends StatelessWidget {
  List<Product> _products = [
    Product(
        id: 1,
        title: "Çikolata",
        price: 5.0,
        imgUrl: "https://img.icons8.com/fluency/96/000000/chocolate-bar.png",
        qty: 1),
    Product(
        id: 2,
        title: "Meyve Suyu",
        price: 10.0,
        imgUrl:
            "https://img.icons8.com/external-wanicon-flat-wanicon/64/000000/external-fruit-juice-healthy-food-wanicon-flat-wanicon.png",
        qty: 1),
    Product(
        id: 3,
        title: "Çay",
        price: 50.0,
        imgUrl: "https://img.icons8.com/plasticine/100/000000/tea-bag.png",
        qty: 1),
    Product(
        id: 4,
        title: "Makarna",
        price: 10.0,
        imgUrl: "https://img.icons8.com/officel/80/000000/spaghetti.png",
        qty: 1),
    Product(
        id: 5,
        title: "Süt",
        price: 12.0,
        imgUrl: "https://img.icons8.com/color/100/000000/milk-bottle.png",
        qty: 1),
    Product(
        id: 6,
        title: "Et",
        price: 60.0,
        imgUrl:
            "https://img.icons8.com/external-icongeek26-flat-icongeek26/64/000000/external-meat-meat-icongeek26-flat-icongeek26-8.png",
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
