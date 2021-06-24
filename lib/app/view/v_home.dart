import 'package:flutter/material.dart';
import 'package:teus_controle_lite/app/my_app.dart';

class VHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teus Controle')
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red[800],
              ),
              child: Text(
                'Teus Controle',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Perfil'),
              onTap: () {
                Navigator.of(context).pushNamed(MyApp.PROFILE);
              },
            ),
            ListTile(
              leading: Icon(Icons.shopping_basket),
              title: Text('Produtos'),
              onTap: () {
                Navigator.of(context).pushNamed(MyApp.PRODUCTS);
              },
            ),
          ],
        ),
      ),
      body: ListView(),
    );
  }
}