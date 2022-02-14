import 'package:flutter/material.dart';
import 'package:listac/cartmodel.dart';
import 'package:scoped_model/scoped_model.dart';
//import 'package:scoped_model/scoped_rtmodel.dart';

class TechnologyPage extends StatelessWidget {
  List<Product> _products = [
    Product(
        id: 1,
        title: "Kulaklık",
        price: 625.0,
        imgUrl: "https://img.icons8.com/emoji/96/000000/headphone-emoji.png",
        qty: 1),
    Product(
        id: 2,
        title: "Şarj Aleti",
        price: 750.0,
        imgUrl:
            "https://img.icons8.com/external-others-justicon/96/000000/external-charger-photography-others-justicon-1.png",
        qty: 1),
    Product(
        id: 3,
        title: "TV Kumandası",
        price: 180.0,
        imgUrl:
            "https://img.icons8.com/ios-filled/100/000000/remote-control.png",
        qty: 1),
    Product(
        id: 4,
        title: "Laptop",
        price: 18500.0,
        imgUrl: "https://img.icons8.com/fluency/96/000000/laptop-metrics.png",
        qty: 1),
    Product(
        id: 5,
        title: "TV",
        price: 9500.0,
        imgUrl: "https://img.icons8.com/plasticine/100/000000/retro-tv.png",
        qty: 1),
    Product(
        id: 6,
        title: "Telefon",
        price: 8000.0,
        imgUrl:
            "https://img.icons8.com/external-itim2101-lineal-color-itim2101/64/000000/external-mobile-phone-retro-device-itim2101-lineal-color-itim2101-2.png",
        qty: 1),
    Product(
        id: 7,
        title: "Harddisk",
        price: 200.5,
        imgUrl: "https://img.icons8.com/bubbles/100/000000/hdd.png",
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
