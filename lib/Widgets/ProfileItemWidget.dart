import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';

class ProfileItemWidget extends StatelessWidget {
  final image;
  final title;
  final bool borderState;
  final String link;
  const ProfileItemWidget({super.key, required this.image, required this.title, required this.borderState, required this.link});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, '$link');
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(width: 2, color: borderState ? Color(0xFF003686) : Color(0xFFD4E5FF))),
        child: Row(
          children: [
            SvgPicture.asset(
              '$image',
              color: Color(0xFF003686),
              width: 30,
            ),
            const SizedBox(width: 20),
            Text(
              '$title',
              style: TextStyle(
                  color: Color(0xFF003686),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
