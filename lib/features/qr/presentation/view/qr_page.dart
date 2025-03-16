// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:lighthouse_web_app/core/resources/colors.dart';
import 'package:lighthouse_web_app/core/utils/responsive.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeScreen extends StatelessWidget {
  final String data;
  const QRCodeScreen({
    Key? key,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      body: Center(
        child: Column(
          children: [
            Spacer(flex: 1,),
           SvgPicture.asset(
                'assets/svg/dark-en-logo.svg',
                width: 250,
              ),
            Spacer(flex: 1,),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
              ),
              child: QrImageView(
                data: data,
                version: QrVersions.auto,
                size:Responsive.isDesktop(context)? 350.0: 300,
                backgroundColor: Colors.white,
                foregroundColor: darkNavy,
              ),
            ),
            Spacer(flex: 2,),
          ],
        ),
      ),
    );
  }
}
