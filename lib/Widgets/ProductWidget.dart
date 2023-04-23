import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testproject/Widgets/ProductPageWidget.dart';

class ProductWidget extends StatelessWidget {
  final title;
  final price;
  final image;
  final product;
  const ProductWidget({super.key, required this.title, required this.price, required this.image, required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => ProductPageWidget(product: product,)
        ));
      },
      child: Container(
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                          color: Color(0xFFF6F6F6),
                          border: Border.all(
                            width: 2,
                            color: Colors.black.withOpacity(0.07)
                          ),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                image: DecorationImage(
                                  image: NetworkImage(image),
                                  fit: BoxFit.cover,
                                )
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 7, horizontal: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('$title', style: TextStyle(fontSize: 17), maxLines: 1),
                                  Row(
                                    children: [
                                      Text('$price', style: TextStyle(color: Color(0xFF003686), fontWeight: FontWeight.bold, fontSize: 20)),
                                      const SizedBox(width: 10),
                                      Container(
                                        padding: EdgeInsets.symmetric(horizontal: 5, vertical: 3),
                                        decoration: BoxDecoration(
                                          color: Color(0xFFD4E5FF),
                                          borderRadius: BorderRadius.circular(3)
                                        ),
                                        child: Text('TMT', style: TextStyle(color: Color(0xFF003686), fontWeight: FontWeight.bold, fontSize: 10)),
                                      )
                                    ],
                                  ),
                                  const SizedBox(height: 20),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          for(int i = 0; i < 5; i++)
                                          Container(
                                            margin: EdgeInsets.only(right: 3),
                                            child: SvgPicture.asset('lib/images/fillstar.svg', width: 9)
                                          )
                                        ],
                                      ),
                                      Flexible(child: Text('1 year warranty', style: TextStyle(fontSize: 11), maxLines: 1,))
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
    );;
  }
}