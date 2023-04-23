import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

class ProductSortWidget extends StatelessWidget {
  final title;
  final image;
  final sizes;
  const ProductSortWidget({super.key, required this.title, required this.image, required this.sizes});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 70,
                height: 40,
                alignment: Alignment.center,
                padding: EdgeInsets.only(top: 7),
                decoration: BoxDecoration(
                    color: Color(0xFFCBE5F8),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    )),
                child: Column(
                  children: [
                    SvgPicture.asset(
                      '$image',
                      width: sizes,
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 15),
              Text(
                '$title',
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.normal),
              )
            ],
          ),
          SvgPicture.asset('lib/images/topproductsright.svg', width: 22)
        ],
      ),
    );
  }
}
