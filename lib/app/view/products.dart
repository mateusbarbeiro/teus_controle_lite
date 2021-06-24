import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:teus_controle_lite/app/database/sqlite/connection.dart';

class Products extends StatelessWidget {
  Future<List<Map<String,dynamic>>> _buscar() async{
    Database? db = await Connection.get();
    return db!.query('products');
  }
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _buscar(),
      builder: (context, f) {
        if (f.hasData) {
          var list = (f.data! as List<Map<String,dynamic>>);
          return Scaffold(
            appBar: AppBar(
              title: Text('Produtos')
            ),
            body: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                var product = list[index];
                return Center(
                  child: Card(
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          Image.network(product['thumbnail'], height: 250),
                          ListTile(
                            title: Text( "R\$" + product['price'].toStringAsFixed(2), style: TextStyle(fontSize: 25)),
                            subtitle: Text(
                              product['description'],
                              style: TextStyle(color: Colors.black.withOpacity(0.6), fontSize: 17),
                            ),
                          ),
                        ]
                      ),
                    ),
                  ),
                );
              }
            ),
          ); 
        } else {
          return Scaffold();
        }
      },
    );
  }
}