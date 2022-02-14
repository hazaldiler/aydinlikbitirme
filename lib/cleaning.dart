import 'package:flutter/material.dart';
import 'package:listac/cartmodel.dart';
import 'package:scoped_model/scoped_model.dart';
//import 'package:scoped_model/scoped_rtmodel.dart';

class CleanPage extends StatelessWidget {
  List<Product> _products = [
    Product(
        id: 1,
        title: "Bulaşık Eldiveni",
        price: 25.0,
        imgUrl:
            "https://img.icons8.com/external-kiranshastry-lineal-color-kiranshastry/64/000000/external-cleaning-hygiene-kiranshastry-lineal-color-kiranshastry.png",
        qty: 1),
    Product(
        id: 2,
        title: "Camsil",
        price: 50.0,
        imgUrl:
            "https://img.icons8.com/external-becris-flat-becris/64/000000/external-cleaning-coronavirus-becris-flat-becris.png",
        qty: 1),
    Product(
        id: 3,
        title: "Vileda",
        price: 1800.0,
        imgUrl:
            "https://img.icons8.com/external-flatart-icons-flat-flatarticons/64/000000/external-cleaning-stay-at-home-flatart-icons-flat-flatarticons.png",
        qty: 1),
    Product(
        id: 4,
        title: "Süpürge",
        price: 85.0,
        imgUrl: "https://img.icons8.com/color/100/000000/broom.png",
        qty: 1),
    Product(
        id: 5,
        title: "Çamaşır Suyu",
        price: 1250.0,
        imgUrl:
            "https://img.icons8.com/external-flatart-icons-flat-flatarticons/64/000000/external-cleaning-spray-wash-hands-flatart-icons-flat-flatarticons-1.png",
        qty: 1),
    Product(
        id: 6,
        title: "Toz Bezi",
        price: 8.5,
        imgUrl:
            "https://img.icons8.com/external-wanicon-lineal-color-wanicon/64/000000/external-glass-cleaning-labour-day-wanicon-lineal-color-wanicon.png",
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
