import 'package:flutter/material.dart';
import 'package:listac/cartmodel.dart';
import 'package:scoped_model/scoped_model.dart';
//import 'package:scoped_model/scoped_rtmodel.dart';

class StationeryPage extends StatelessWidget {
  List<Product> _products = [
    Product(
        id: 1,
        title: "Kalem",
        price: 25.0,
        imgUrl: "https://img.icons8.com/office/80/000000/broken-pencil.png",
        qty: 1),
    Product(
        id: 2,
        title: "Defter",
        price: 50.0,
        imgUrl:
            "https://img.icons8.com/external-justicon-flat-justicon/64/000000/external-notebook-elearning-and-education-justicon-flat-justicon.png",
        qty: 1),
    Product(
        id: 3,
        title: "Silgi",
        price: 8.0,
        imgUrl:
            "https://img.icons8.com/external-konkapp-flat-konkapp/64/000000/external-eraser-back-to-school-konkapp-flat-konkapp.png",
        qty: 1),
    Product(
        id: 4,
        title: "Yapıştırıcı",
        price: 8.0,
        imgUrl:
            "https://img.icons8.com/external-justicon-flat-justicon/64/000000/external-glue-sewing-justicon-flat-justicon.png",
        qty: 1),
    Product(
        id: 5,
        title: "Boya Fırçası",
        price: 12.0,
        imgUrl: "https://img.icons8.com/office/80/000000/paint.png",
        qty: 1),
    Product(
        id: 6,
        title: "Bant",
        price: 8.0,
        imgUrl: "https://img.icons8.com/office/80/000000/micropore-tape.png",
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
