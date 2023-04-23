import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;

import 'NewProductWidget.dart';

class ProductPageWidget extends StatefulWidget {
  final product;
  const ProductPageWidget({super.key, required this.product});

  @override
  State<ProductPageWidget> createState() => _ProductPageWidgetState();
}

class _ProductPageWidgetState extends State<ProductPageWidget> {
  List recommends = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getRecommendation();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 45,
                        height: 45,
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border:
                                Border.all(width: 1, color: Color(0xFFDDDDDD))),
                        child:
                            SvgPicture.asset('lib/images/productpageleft.svg'),
                      ),
                    ),
                    const SizedBox(width: 15),
                    SizedBox(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Text(
                          '${widget.product["name_tm"]}',
                          style: TextStyle(fontSize: 21),
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                        )),
                  ],
                ),
                Row(
                  children: [
                    SvgPicture.asset('lib/images/productpagelike.svg',
                        width: 25),
                    const SizedBox(width: 20),
                    SvgPicture.asset('lib/images/productpagemenu.svg',
                        width: 5),
                  ],
                )
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.25),
                        spreadRadius: 1,
                        blurRadius: 15)
                  ],
                  image: DecorationImage(
                      image: NetworkImage(
                          'http://216.250.9.29:5003/${widget.product["images"][0]["image"]}'),
                      fit: BoxFit.cover)),
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.product["images"].length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1, childAspectRatio: 0.9),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                    'http://216.250.9.29:5003/${widget.product["images"][0]["image"]}'),
                                fit: BoxFit.cover,
                              ),
                              border: Border.all(
                                  width: 3, color: Color(0xFF6E62F9))),
                        );
                      }),
                ),
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text('${widget.product["price"]}',
                        style: TextStyle(
                            color: Color(0xFF003686),
                            fontSize: 34,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                      margin: EdgeInsets.only(bottom: 7),
                      decoration: BoxDecoration(
                          color: Color(0xFFD4E5FF),
                          borderRadius: BorderRadius.circular(3)),
                      child: Text('TMT',
                          style: TextStyle(
                              color: Color(0xFF003686),
                              fontWeight: FontWeight.bold,
                              fontSize: 10)),
                    )
                  ],
                ),
                const SizedBox(height: 15),
                Text('${widget.product["body_tm"]}',
                    style: TextStyle(fontSize: 18)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    for (int i = 0; i < 5; i++)
                      Container(
                          margin: EdgeInsets.only(right: 3),
                          child: SvgPicture.asset('lib/images/fillstar.svg',
                              width: 9))
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 15),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            decoration: BoxDecoration(
                border: Border(
              top: BorderSide(color: Color(0xFFDDDDDD), width: 2),
              bottom: BorderSide(color: Color(0xFFDDDDDD), width: 2),
            )),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Variations'),
                    Row(
                      children: [
                        Text('6 var',
                            style: TextStyle(color: Color(0xFF0367FF))),
                        const SizedBox(width: 10),
                        SvgPicture.asset('lib/images/variationsright.svg')
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 100,
                  child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: recommends.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1, childAspectRatio: 0.9),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (context) => ProductPageWidget(product: recommends[index])
                            ));
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                  image: NetworkImage('http://216.250.9.29:5003/${recommends[index]["images"][0]["image"]}'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
          Container(
            height: 80,
            padding: EdgeInsets.only(left: 20),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 2, color: Color(0xFFDDDDDD)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Warranty time', style: TextStyle(fontSize: 18)),
                Stack(
                  alignment: Alignment.center,
                  children: [
                  Image.asset('lib/images/varrantytime.png',
                      fit: BoxFit.cover, height: 80),
                      Positioned(
                        right: 35,
                        child: Text('6 aý', style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),)
                      )
                ])
              ],
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20),
                  height: 75,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/images/warrantytime.png'),
                      fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(width: 1, color: Color(0xFFDDDDDD))
                  ),
                  child: Row(
                    children: [
                      Text('Rate this product', style: TextStyle(fontSize: 21))
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                Text('Recomendation', style: TextStyle(fontSize: 18)),
                const SizedBox(height: 15),
                GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: recommends.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.72,
                        mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return NewProductImage(
                        title: recommends[index]["name_tm"],
                        price: recommends[index]["price"],
                        image:
                            'http://216.250.9.29:5003/${recommends[index]["images"][0]["image"]}',
                        product: recommends[index], 
                        newBool: recommends[index]["isNew"],
                        actionBool: recommends[index]["isAction"],
                      );
                    }),
              ],
            ),
          ),
          const SizedBox(height: 50)
        ],
      )),
    );
  }

  Future<void> getRecommendation() async {
    final response = await http.get(Uri.parse('http://216.250.9.29:5003/public/products/${widget.product["product_id"]}'));
    if(response.statusCode == 200){
      final res = jsonDecode(response.body) as Map;
      final json = res['product'] as Map;
      final json2 = json['recommenendations'] as List;
      setState(() {
        recommends = json2;
      });
    }
  }
}
