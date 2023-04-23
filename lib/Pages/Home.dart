import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'package:testproject/Widgets/NewProductWidget.dart';
import 'package:testproject/Widgets/ProductPageWidget.dart';
import 'package:testproject/Widgets/ProductSortWidget.dart';
import 'package:testproject/Widgets/ProductWidget.dart';

import '../Widgets/SalesProductWidget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List products = [];
  List actionProducts = [];
  List newProducts = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTopProducts();
    getActionProducts();
    getNewProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: RefreshIndicator(
              onRefresh: () => _refreshPage(),
              child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    showSearch(
                        context: context,
                        delegate: CustomSearchDelegate(pro: products));
                  },
                  child: Container(
                      padding: EdgeInsets.only(right: 10, left: 20),
                      margin: EdgeInsets.only(top: 25),
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35),
                        color: Colors.white,
                      ),
                      child: Row(
                        children: [
                          Container(
                              width:
                                  MediaQuery.of(context).size.width * 0.75 - 40,
                              child: Text('Search')),
                          Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.25 - 30,
                            child: SvgPicture.asset(
                              'lib/images/searchicon.svg',
                              width: 27,
                            ),
                          ),
                        ],
                      )),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 110,
                      width: MediaQuery.of(context).size.width * 0.6 - 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(colors: [
                            Color(0xFF096AFC),
                            Color(0xFF2478F5),
                            Color(0xFF3B7EF2),
                            Color(0xFF5F6AF7),
                          ])),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'lib/images/categories.svg',
                            width: 42,
                          ),
                          const SizedBox(width: 10),
                          Flexible(
                              child: Text('All Categories',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20)))
                        ],
                      ),
                    ),
                    Container(
                      height: 110,
                      width: MediaQuery.of(context).size.width * 0.37 - 20,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(width: 2, color: Color(0xFF096AFC))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '%',
                            style: TextStyle(
                                color: Color(0xFF096AFC),
                                fontSize: 43,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Sales',
                            style: TextStyle(
                                color: Color(0xFF096AFC),
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
                      ),
                    ),
                    const SizedBox(height: 50),
                    ProductSortWidget(
                      title: 'Top Products',
                      image: 'lib/images/topproductsleft.svg',
                      sizes: 27.0,
                    ),
                    const SizedBox(height: 20),
                    Padding(
              padding: EdgeInsets.only(left: 20),
              child: Container(
                height: 260,
                child: Visibility(
                  visible: products.isNotEmpty,
                  replacement: Center(child: CircularProgressIndicator()),
                  child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: products.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1, childAspectRatio: 1.35),
                      itemBuilder: (context, index) {
                        return NewProductImage(
                          title: products[index]["name_tm"],
                          price: products[index]["price"],
                          image: 'http://216.250.9.29:5003/${products[index]["images"][0]["image"]}',
                          product: products[index],
                          newBool: products[index]["isNew"],
                          actionBool: products[index]["isAction"],
                        );
                      }),
                ),
              )),
                    const SizedBox(height: 50),
                    ProductSortWidget(
                      title: 'Sales',
                      image: 'lib/images/saleslefticon.svg',
                      sizes: 24.0,
                    ),
                    const SizedBox(height: 20),
                    Padding(
              padding: EdgeInsets.only(left: 20),
              child: Container(
                height: 260,
                child: Visibility(
                  visible: actionProducts.isNotEmpty,
                  replacement: Center(
                    child: CircularProgressIndicator(),
                  ),
                  child: GridView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: actionProducts.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1, childAspectRatio: 1.35),
                      itemBuilder: (context, index) {
                        return NewProductImage(
                          title: actionProducts[index]["name_tm"],
                          price: actionProducts[index]["price"],
                          image:
                              'http://216.250.9.29:5003/${actionProducts[index]["images"][0]["image"]}',
                          product: actionProducts[index],
                          newBool: actionProducts[index]["isNew"],
                          actionBool: actionProducts[index]["isAction"],
                        );
                      }),
                ),
              )),
                    const SizedBox(height: 50),
                    ProductSortWidget(
                      title: 'New Products',
                      image: 'lib/images/topproductsleft.svg',
                      sizes: 27.0,
                    ),
                    const SizedBox(height: 20),
                    Padding(
              padding: EdgeInsets.only(left: 20, right: 5),
              child: Visibility(
                visible: newProducts.isNotEmpty,
                replacement: Center(
                    child: CircularProgressIndicator(),
                  ),
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.vertical,
                    itemCount: newProducts.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.75,
                        mainAxisSpacing: 10),
                    itemBuilder: (context, index) {
                      return NewProductImage(
                        title: newProducts[index]["name_tm"],
                        price: newProducts[index]["price"],
                        image:
                            'http://216.250.9.29:5003/${newProducts[index]["images"][0]["image"]}',
                        product: newProducts[index], 
                        newBool: newProducts[index]["isNew"],
                        actionBool: newProducts[index]["isAction"],
                      );
                    }),
              )),
                  ],
                ),
            )));
  }

  Future<void> getTopProducts() async {
    final response = await http
        .get(Uri.parse('http://216.250.9.29:5003/public/products/top'));
    if (response.statusCode == 200) {
      final res = jsonDecode(response.body) as Map;
      final json = res['rows'] as List;
      setState(() {
        products = json;
      });
    } else {
      print('error');
    }
  }

  Future<void> getActionProducts() async {
    final response = await http
        .get(Uri.parse('http://216.250.9.29:5003/public/products/action'));
    if (response.statusCode == 200) {
      final res = jsonDecode(response.body) as Map;
      final json = res['action_products'] as Map;
      final json2 = json['rows'] as List;
      setState(() {
        actionProducts = json2;
      });
    }
  }

  Future<void> getNewProducts() async {
    final response = await http
        .get(Uri.parse('http://216.250.9.29:5003/public/products/new'));
    if (response.statusCode == 200) {
      final res = jsonDecode(response.body) as Map;
      final json = res['new_products'] as List;
      setState(() {
        newProducts = json;
      });
    }
  }
  Future _refreshPage() async {
    await getTopProducts();
    await getActionProducts();
    await getNewProducts();
  }
}

class CustomSearchDelegate extends SearchDelegate {
  final pro;
  List<String> searchTerms = [];

  CustomSearchDelegate({required this.pro});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List matchQuery = [];
    for (var fruit in pro) {
      if (fruit['name_tm'].toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return GestureDetector(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => ProductPageWidget(product: result)
              ));
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 5),
              decoration: BoxDecoration(
                  color: Color(0xFFF9F9F9),
                  border: Border(
                    top: BorderSide(width: 2, color: Color(0xFFEDEDED)),
                    bottom: BorderSide(width: 2, color: Color(0xFFEDEDED)),
                  )),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CachedNetworkImage(
                    imageUrl:
                        'http://216.250.9.29:5003/${result["images"][0]["image"]}',
                    width: 130,
                    height: 130,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 130,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 15),
                              Text('${result["name_tm"]}', style: TextStyle(fontSize: 20),),
                              const SizedBox(height: 5),
                              Row(
                                children: [
                                  Text('${result["price"]}',
                                      style: TextStyle(
                                          color: Color(0xFF003686),
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                  const SizedBox(width: 10),
                                  Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5, vertical: 3),
                                    margin: EdgeInsets.only(bottom: 2),
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
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 7),
                          decoration: BoxDecoration(
                            color: Color(0xFFD4E5FF),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5)
                            )
                          ),
                          child: Text('1 year warranty', style: TextStyle(fontSize: 11, color: Color(0xFF595959)),),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List matchQuery = [];
    for (var fruit in pro) {
      if (fruit['name_tm'].toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(fruit);
      }
    }
    return ListView.builder(
        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ProductPageWidget(product: result)));
            },
            child: ListTile(
              title: Text('${result["name_tm"]}'),
            ),
          );
        });
  }
}
