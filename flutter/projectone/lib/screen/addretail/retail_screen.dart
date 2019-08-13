import 'package:flutter/material.dart';

class Retail {
  final String name;

  const Retail(this.name);
}

class RetailScreen extends StatelessWidget {
  final data = <Retail>[
    Retail('Tesco Lotus'),
    Retail('Big C'),
    Retail('Makro'),
    Retail('Tops'),
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
                  onTap: () {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Clicked ${data[index].name}'),
                    ));
                  },
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
