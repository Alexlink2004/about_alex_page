import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webpage/constants.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioItemWidget extends StatelessWidget {
  PortfolioItemWidget(
      {this.image,
      this.title,
      this.subtitle,
      this.icon2,
      this.icon1,
      this.isLarge = false,
      this.description,
      this.constraints,
      this.isAppStore,
      this.linkAppStore,
      this.linkGooglePlay});

  final String title;
  final String description;
  final Image image;
  final String subtitle;
  final IconData icon1;
  final IconData icon2;
  final bool isLarge;
  final constraints;
  final bool isAppStore;
  final String linkAppStore;
  final String linkGooglePlay;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: isLarge ? const EdgeInsets.all(15.0) : EdgeInsets.all(0.0),
      child: GestureDetector(
        onTap: () => !isLarge
            ? showModalBottomSheet(
                context: context,
                builder: (context) {
                  return Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.blue,
                        Colors.green,
                      ],
                    )),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Center(
                            child: ClipOval(
                              child:
                                  Container(color: Colors.white, child: image),
                            ),
                          ),
                          AutoSizeText(
                            title,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: 40,
                              color: Colors.white,
                            ),
                          ),
                          Card(
                            color: Color(0x66ffffff),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: AutoSizeText(
                                description,
                                maxLines: 5,
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
//                        ListTile(
//                          title: Text(title),
//                          trailing: Icon(icon1),
//                          leading: image,
//                        ),
                        ],
                      ),
                    ),
                  );
                })
            : Alert(
                context: context,
                title: title,
              ).show(),
        child: ClipPath(
          clipper: !isLarge ? ObjectClipper() : null,
          child: Container(
            decoration: BoxDecoration(
              color: Color(0x66000000),
              borderRadius: isLarge
                  ? BorderRadius.circular(30)
                  : BorderRadius.circular(0),
            ),
            child: !isLarge
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: constraints.maxWidth,
                        height: size.height / 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                ClipOval(child: image),
                                SizedBox(
                                  width: 20.0,
                                ),
                                AutoSizeText(
                                  title,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontSize: size.width * 0.06,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                isAppStore
                                    ? GestureDetector(
                                        onTap: () => launch(linkAppStore),
                                        child: Image.asset(
                                          'assets/images/icon_App Store [inverse].png',
                                          scale: 8,
                                          color: Colors.white,
                                        ),
                                      )
                                    : SizedBox(),
                                SizedBox(
                                  width: 10.0,
                                  height: 100,
                                ),
                                GestureDetector(
                                  onTap: () => launch(linkGooglePlay),
                                  child: Image.asset(
                                    'assets/images/icon_Google Play (monochrome) [inverse].png',
                                    scale: 8,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
//          ListTile(
//                  leading: ClipOval(child: image),
//                  title: Text(
//                    title,
//                    style:
//                        kColorTextStyle.copyWith(fontSize: size.width * 0.04),
//                  ),
//                  subtitle: Text(
//                    subtitle,
//                    style: TextStyle(color: Colors.grey),
//                  ),
//                  trailing: !isLarge
//                      ? Icon(
//                          icon1,
//                        )
//                      : Material(),
//                )
                : Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xd000000),
                            borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(30),
                            ),
                          ),
                          child: Center(child: ClipOval(child: image)),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Material(),
                              AutoSizeText(
                                title,
                                style: kColorTextStyle.copyWith(
                                    fontSize: size.width * 0.04),
                                maxLines: 1,
                              ),
                              Text(
                                subtitle,
                                style: kColorTextStyle.copyWith(
                                    fontSize: size.width * 0.02),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}

class ObjectClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, size.height * .88)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width, size.height * .13);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}

//class ObjectPainter extends CustomPainter {
//  @override
//  void paint(Canvas canvas, Size size) {
//    Paint paint = Paint()
//      ..color = Colors.white
//      ..strokeWidth = 20
//      ..style = PaintingStyle.fill
//      ..strokeJoin = StrokeJoin.bevel;
//
//    Offset topLeft = Offset(0, 0);
//    Offset topRight = Offset(size.width, 0);
//    Offset bottomLeft = Offset(0, size.height);
//    Offset bottomRight = Offset(size.width, size.height);
//
//    canvas.drawLine(topLeft, bottomRight, paint);
////    canvas.drawLine(topLeft, topRight, paint);
////    canvas.drawLine(topRight, bottomRight, paint);
//  }
//
//  @override
//  bool shouldRepaint(CustomPainter oldDelegate) {
//    return false;
//  }
//}
