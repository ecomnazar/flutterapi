import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginInputWidget extends StatefulWidget {
  final hintText;
  LoginInputWidget({super.key, required this.hintText});

  @override
  State<LoginInputWidget> createState() => _LoginInputWidgetState();
}

class _LoginInputWidgetState extends State<LoginInputWidget> {
  bool clickEye = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 30),
      child: TextField(
        cursorColor: Color(0xFF595959),
        obscureText: clickEye,
        decoration: InputDecoration(
            suffixIcon: IconButton(
              padding: EdgeInsets.only(right: 20),
              icon: SvgPicture.asset('lib/images/${clickEye ? "closeeye" : "openeye"}.svg', width: 31, height: 31),
                onPressed: (){
                  setState(() {
                    clickEye = !clickEye;
                  });
                },
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 25, horizontal: 20),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Color(0xFFDDDDDD))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Color(0xFFDDDDDD),
                  width: 2.0,
                )),
            labelText: '${widget.hintText}',
            labelStyle: TextStyle(color: Color(0xFF595959))),
      ),
    );
  }
}
