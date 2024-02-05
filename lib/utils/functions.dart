import 'package:ecommerce/utils/index.dart';

Future<bool> onBackButtonPressed(context) async {
  return await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      // title: Text("Alert",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 25),),
      title: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Do you really want to exit the app?',
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 5,
              ),
              GestureDetector(
                  onTap: () {
                    // Navigator.pop(context, true);
                    exit(0);
                  },
                  child: Text(
                    "Yes",
                    style: TextStyle(color: Colors.blue),
                  )),
              Container(
                color: Colors.grey,
                width: 1,
                height: 30,
              ),
              GestureDetector(
                  onTap: () => Navigator.pop(context, false),
                  child: Text(
                    "No",
                    style: TextStyle(color: Colors.blue),
                  )),
              SizedBox(
                width: 5,
              ),
            ],
          )
        ],
      ),
      // actions: <Widget>[
      //   // Text("Yes"),
      //   // VerticalDivider(),
      //   // Text("No")
      //   // GestureDetector(
      //   //   onTap: () => Navigator.pop(context, false),
      //   //   child: Container(
      //   //     height: height * 0.0433,
      //   //     width: width * 0.166,
      //   //     child: Center(
      //   //         child: Text(
      //   //           'No',
      //   //           style: TextStyle(color: Colors.white),
      //   //         )),
      //   //     decoration: BoxDecoration(
      //   //       color: Colors.red,
      //   //       borderRadius: BorderRadius.circular(width * 0.055),),
      //   //   ),
      //   // ),
      //   // GestureDetector(
      //   //   onTap: () {
      //   //     // Navigator.pop(context, true);
      //   //     exit(0);
      //   //   },
      //   //   child: Container(
      //   //     height: height * 0.0433,
      //   //     width: width * 0.166,
      //   //     child: Center(
      //   //         child: Text(
      //   //           'Yes',
      //   //           style: TextStyle(color: Colors.white),
      //   //         )),
      //   //     decoration: BoxDecoration(
      //   //         color: Colors.red,
      //   //         borderRadius: BorderRadius.circular(width * 0.055)),
      //   //   ),
      //   // ),
      // ],
    ),
  );
}

Route createRoute(Widget widget) {
  // return PageRouteBuilder(
  //   barrierColor: Colors.white,
  //   // barrierColor: Color(0xffFFA958),
  //   transitionDuration: Duration(milliseconds: 500),
  //   pageBuilder: (context, animation, secondaryAnimation) => widget,
  //   transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //     var begin = Offset(0.0, 1.0);
  //     var end = Offset.zero;
  //     var curve = Curves.elasticInOut;
  //     var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

  //     return SlideTransition(
  //       position: animation.drive(tween),
  //       child: child,
  //     );
  //   },
  // );

  return MaterialPageRoute(builder: (context) => widget);
}

Widget backButton(context, {double? margin, double? padding}) {
  return InkWell(
    onTap: () {
      Navigator.pop(context);
    },
    borderRadius: BorderRadius.circular(15),
    child: Container(
      padding: EdgeInsets.all(padding ?? 0),
      margin: EdgeInsets.all(margin ?? 0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.black12,
          )),
      child: Icon(
        Icons.arrow_back_ios_rounded,
        color: Color(0xff261F5A),
      ),
    ),
  );
}

Widget payButton(
    {required void onTap(),
    double? margin,
    double? padding,
    MainAxisAlignment? align,
    String? text}) {
  return InkWell(
    borderRadius: BorderRadius.circular(50),
    onTap: onTap,
    child: Container(
      // width: 100,
      margin: EdgeInsets.all(margin ?? 4),
      padding: EdgeInsets.symmetric(vertical: padding ?? 5, horizontal: 15),
      decoration: BoxDecoration(
          color: Color(0xff009000),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.yellowAccent,
              Colors.yellow[900]!
              // Color(0xff008000),
              // Color(0xff00c000),
            ],
          ),
          borderRadius: BorderRadius.circular(50)),
      child: Row(
        mainAxisAlignment: align ?? MainAxisAlignment.spaceBetween,
        children: [
          AnimatedTextKit(
              onTap: onTap,
              // isRepeatingAnimation: true,
              repeatForever: true,
              animatedTexts: [
                ColorizeAnimatedText(text ?? "Pay",
                    speed: Duration(seconds: 1),
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors)
              ]),
          // Text(
          //   "Pay",
          //   style: TextStyle(
          //     color: Colors.white,
          //     fontWeight: FontWeight.w600,
          //     fontSize: 17,
          //   ),
          // ),
          Icon(
            Icons.arrow_forward,
            color: Colors.white,
          ),
        ],
      ),
    ),
  );
}
