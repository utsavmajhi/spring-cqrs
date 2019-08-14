import 'package:flutter/material.dart';
import 'package:projectone/screen/addretail/retail_application_screen.dart';

class Store {
  final int id;
  final String name;

  const Store(this.id, this.name);
}

class RetailScreen extends StatelessWidget {
  final data = <Store>[
    Store(1, 'Tesco Lotus'),
    Store(2, 'Big C'),
    Store(3, 'Makro'),
    Store(4, 'Tops'),
  ];

  @override
  Widget build(BuildContext context) => SafeArea(
      minimum: const EdgeInsets.all(10),
      child: GridView.count(
        // Create a grid with 2 columns. If you change the scrollDirection to
        // horizontal, this produces 2 rows.
        crossAxisCount: 4,
        mainAxisSpacing: 25.0,
        crossAxisSpacing: 25.0,
        // Generate 100 widgets that display their index in the List.
        children: List.generate(
            data.length,
            (index) => GestureDetector(
              onTap: () =>
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              RetailApplicationScreen(
                                storeId: data[index].id,
                              ))),
                  child: Container(
                    child: Card(
                      elevation: 1,
                      child: Center(
                        child: GridTile(
                          child: Container(
                              child: Icon(
                            Icons.store,
                            size: 35,
                            color: Colors.blueAccent,
                          )),
                          footer: Container(
                            color: Colors.grey.withOpacity(0.5),
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                data[index].name,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
//              color: Colors.blue[400],
//              margin: EdgeInsets.all(30.0),
                  ),
                )),
      ));
}
