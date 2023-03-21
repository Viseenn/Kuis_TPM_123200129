import 'package:flutter/material.dart';
import 'package:quiz_c_129/coffee_menu.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailKopi extends StatefulWidget {
  final CoffeeMenu detailKopi;

  const DetailKopi({Key? key, required this.detailKopi}) : super(key: key);

  @override
  State<DetailKopi> createState() => _DetailKopiState();
}

class _DetailKopiState extends State<DetailKopi> {
  @override
  bool toggle = true;

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.detailKopi.name),
          centerTitle: true,
          //fitur tambahan favorite ketika diklik akan menjadi menu favorite
          actions: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              //fitur tambahan favorit
              child: IconButton(
                icon:
                toggle ? Icon(Icons.favorite_border) : Icon(Icons.favorite),
                onPressed: () {
                  setState(() {
                    toggle = !toggle;
                  });
                },
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 15),
                //bisa di slide
                child: Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        child:
                            Image.network(widget.detailKopi.imageUrls[index]),
                      );
                    },
                    pageSnapping: true,
                    itemCount: widget.detailKopi.imageUrls.length,
                  ),
                ),
              ),
              Container(
                child: Text(widget.detailKopi.name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.90,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 3, top: 5),
                      child:
                        Text("Ingredients :  ${widget.detailKopi.ingredients[0]}, ${widget.detailKopi.ingredients[1]}"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 3),
                      child:
                          Text("Nutrition :  ${widget.detailKopi.nutrition}"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 3),
                      child: Text(
                          "Review Average :  ${widget.detailKopi.reviewAverage}"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 3),
                      child: Text(
                          "Review Count :  ${widget.detailKopi.reviewCount}"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 3),
                      child: Text("Price :  ${widget.detailKopi.price}"),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 3),
                      child: Text(
                        "Description : ",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(widget.detailKopi.description),
                    Padding(
                      padding: EdgeInsets.only(top: 30),
                      child: ElevatedButton(onPressed: (){
                        _launchURL(widget.detailKopi.linkStore);
                      }, child: Text("Lihat Store"))
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
