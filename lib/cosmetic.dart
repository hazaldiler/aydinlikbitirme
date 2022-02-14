import 'package:flutter/material.dart';
import 'package:listac/cartmodel.dart';
import 'package:scoped_model/scoped_model.dart';
//import 'package:scoped_model/scoped_rtmodel.dart';

class CosmeticPage extends StatelessWidget {
  List<Product> _products = [
    Product(
        id: 1,
        title: "Şampuan",
        price: 35.0,
        imgUrl:
            "https://img.icons8.com/external-bearicons-flat-bearicons/64/000000/external-Powder-beauty-and-hygiene-bearicons-flat-bearicons.png",
        qty: 1),
    Product(
        id: 2,
        title: "Saç Fırçası",
        price: 12.0,
        imgUrl: "https://img.icons8.com/color/96/000000/hair-brush.png",
        qty: 1),
    Product(
        id: 3,
        title: "Toka",
        price: 8.0,
        imgUrl: "https://img.icons8.com/office/80/000000/hair-clip.png",
        qty: 1),
    Product(
        id: 4,
        title: "Makyaj Fırçası",
        price: 15.0,
        imgUrl: "https://img.icons8.com/color/96/000000/cosmetic-brush.png",
        qty: 1),
    Product(
        id: 5,
        title: "Ruj",
        price: 22.5,
        imgUrl:
            "https://img.icons8.com/external-flatart-icons-flat-flatarticons/64/000000/external-cosmetic-supermarket-flatart-icons-flat-flatarticons.png",
        qty: 1),
    Product(
        id: 6,
        title: "Pudra",
        price: 15.5,
        imgUrl:
            "https://img.icons8.com/external-bearicons-flat-bearicons/64/000000/external-Powder-beauty-and-hygiene-bearicons-flat-bearicons.png",
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
