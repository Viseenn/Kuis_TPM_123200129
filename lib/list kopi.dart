import 'package:flutter/material.dart';
import 'package:quiz_c_129/detail%20kopi.dart';
import 'coffee_menu.dart';

class ListKopi extends StatefulWidget {
  const ListKopi({Key? key}) : super(key: key);

  @override
  State<ListKopi> createState() => _ListKopiState();
}

class _ListKopiState extends State<ListKopi> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Menu Kopi"),
            centerTitle: true,
          ),
          body: ListView.builder(
            itemBuilder: (context, index) {
              final CoffeeMenu dataKopi = coffeeList[index];
              return Card(
                margin: EdgeInsets.only(left: 10, top: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return DetailKopi(detailKopi: dataKopi);
                    }));
                  },
                  child: Row(
                    children: [
                      Image.network(
                        dataKopi.imageUrls[0],
                        width: 180,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(dataKopi.name,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15),
                        child: Text(dataKopi.price,
                            style: TextStyle(fontSize: 15)),
                      ),
                    ],
                  ),
                ),
              );
            },
            itemCount: coffeeList.length,
          )),
    );
  }
}
