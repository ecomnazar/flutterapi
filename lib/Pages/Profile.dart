import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:testproject/Widgets/ProfileItemWidget.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 30),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Profil Sahypam', style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold)),
                      SvgPicture.asset('lib/images/productpagemenu.svg')
                    ],
                  ),
                ),
                const SizedBox(height: 35),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      ProfileItemWidget(title: 'Ulgama gir', image: 'lib/images/profile1.svg', borderState: true, link: '/LoginPage',),
                      ProfileItemWidget(title: 'Hasaba al', image: 'lib/images/profile2.svg', borderState: true, link: '/LoginPage',),
                      ProfileItemWidget(title: 'Halanlarym', image: 'lib/images/profile3.svg', borderState: false, link: '/LoginPage',),
                      ProfileItemWidget(title: 'Adreslarym', image: 'lib/images/profile4.svg', borderState: false, link: '/LoginPage',),
                      ProfileItemWidget(title: 'Interfeýs dili', image: 'lib/images/profile5.svg', borderState: false, link: '/LoginPage',),
                      ProfileItemWidget(title: 'Profil sazlamalar', image: 'lib/images/profile6.svg', borderState: false, link: '/LoginPage',),
                      ProfileItemWidget(title: 'Admin bilen habarlaşmak', image: 'lib/images/profile7.svg', borderState: false, link: '/LoginPage',),
                      ProfileItemWidget(title: 'Eltip bermek hyzmaty', image: 'lib/images/profile8.svg', borderState: false, link: '/LoginPage',),
                      ProfileItemWidget(title: 'Biz barada', image: 'lib/images/profile9.svg', borderState: false, link: '/LoginPage',),
                    ],
                  ),
                )
              ],
            )
          ],
        )
      ),
    );
  }
}