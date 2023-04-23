import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:testproject/Widgets/LoginInputWidget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.95,
            child: Padding(
              padding: EdgeInsets.all(30),
              child: Column(
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
                              border: Border.all(
                                  width: 1, color: Color(0xFFDDDDDD))),
                          child: SvgPicture.asset(
                              'lib/images/productpageleft.svg'),
                        ),
                      ),
                      const SizedBox(width: 15),
                      SizedBox(
                          width: MediaQuery.of(context).size.width / 1.8,
                          child: Text(
                            'Açar sözi täzele',
                            style: TextStyle(fontSize: 21),
                            overflow: TextOverflow.fade,
                            maxLines: 1,
                          )),
                    ],
                  ),
                  const SizedBox(height: 40),
                  Column(
                    children: [
                      LoginInputWidget(hintText: 'Köne açar sözi'),
                      LoginInputWidget(hintText: 'Täze açar sözi giriziň'),
                      LoginInputWidget(hintText: 'Täze açar sözi giriziň (gaýtadan)'),
                    ],
                  ),
                  Spacer(),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 65,
                    child: ElevatedButton(
                      onPressed: () {},
                      child:
                          Text('Ýatda sakla', style: TextStyle(fontSize: 18)),
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
