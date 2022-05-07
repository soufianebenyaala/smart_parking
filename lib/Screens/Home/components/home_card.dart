import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../constants.dart';

class HomeCard extends StatelessWidget {
  final String svgSrc;
  final String title;
  final Function press;
  const HomeCard({
    Key? key,
    required this.svgSrc,
    required this.title,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        elevation: 5.0,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(13),
          child: Container(
            // padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              //color: Colors.b,
              borderRadius: BorderRadius.circular(13),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 17),
                  blurRadius: 30,
                  spreadRadius: -50,
                  color: kPrimaryLightColor,
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: () => press(context),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: <Widget>[
                      Spacer(),
                      SvgPicture.asset(svgSrc,width: 80),
                      Spacer(),
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        //style: Theme.of(context)
                        //.textTheme
                        //.title
                        //.copyWith(fontSize: 15),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
