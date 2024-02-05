import 'package:ecommerce/utils/index.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
              // color: Color(0xff004D40),
              color: Colors.white
              // boxShadow: [
              //   BoxShadow(
              //     color: Colors.white,
              //     spreadRadius: 2,
              //     blurRadius: 20,
              //   ),
              // ],
              ),
          child: CustomPaint(
            painter: CustomPainter1(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    "Welcome",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Impetrosys System Software",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: SizedBox(
                          width: 30,
                          child: Row(
                            children: [
                              Icon(
                                Icons.person_outline_rounded,
                                color: Colors.black54,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Container(
                                color: Colors.black54,
                                width: 1,
                                height: 40,
                              )
                            ],
                          ),
                        ),
                        labelText: "Username",
                        hintText: "Enter your username/email",
                        hintStyle:
                            TextStyle(color: Colors.black.withOpacity(0.4)),
                        labelStyle:
                            TextStyle(color: Colors.brown, fontSize: 22)),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      prefixIcon: SizedBox(
                        width: 50,
                        child: Row(
                          children: [
                            Icon(
                              Icons.remove_red_eye_outlined,
                              color: Colors.black54,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Container(
                              color: Colors.black54,
                              width: 1,
                              height: 40,
                            )
                          ],
                        ),
                      ),
                      labelText: "Password",
                      hintText: "Enter your password",
                      hintStyle:
                          TextStyle(color: Colors.black.withOpacity(0.4)),
                      labelStyle: TextStyle(color: Colors.brown, fontSize: 22),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  RawMaterialButton(
                    padding: EdgeInsets.symmetric(horizontal: 60, vertical: 8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    fillColor: Colors.red,
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacement(createRoute(BottomNavigation()));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacement(createRoute(SignUp()));
                      },
                      child: Text("Don't have an account? Sign Up"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Route _createRoute(Widget widget) {
  //   return PageRouteBuilder(
  //     barrierColor: Color(0xffFFA958),
  //     transitionDuration: Duration(milliseconds: 1500),
  //     pageBuilder: (context, animation, secondaryAnimation) => widget,
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       var begin = Offset(1.0, 0.0);
  //       var end = Offset.zero;
  //       var curve = Curves.ease;
  //       var tween =
  //           Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  //
  //       return SlideTransition(
  //         position: animation.drive(tween),
  //         child: child,
  //       );
  //     },
  //   );
  // }
}

class CustomPainter1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      // ..color = Color(0xff123456).withOpacity(0.9)
      ..shader = RadialGradient(colors: [
        Color(0xffFE4182).withOpacity(0.9),
        Color(0xffFFA958).withOpacity(0.9)
      ]).createShader(Rect.fromCircle(center: Offset.zero, radius: 300))
      ..style = PaintingStyle.fill
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    Paint paint2 = Paint()
      // ..color = Color(0xff1B5E20).withOpacity(0.9)
      ..shader = RadialGradient(colors: [
        Color(0xffFF8958).withOpacity(0.9),
        Color(0xffFFA958).withOpacity(0.9)
      ]).createShader(
          Rect.fromCircle(center: Offset(0, size.height), radius: 200))
      ..style = PaintingStyle.fill
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    Paint paint3 = Paint()
      // ..color = Colors.brown[900].withOpacity(0.9)
      ..shader = RadialGradient(colors: [
        Color(0xffE847BA).withOpacity(0.9),
        Color(0xff642A7B).withOpacity(0.9)
      ]).createShader(Rect.fromCircle(center: Offset.zero, radius: 300))
      ..style = PaintingStyle.fill
      ..strokeWidth = 2
      ..strokeCap = StrokeCap.round;

    // Path path = Path()
    //   ..moveTo(0, 0)
    //   ..lineTo(size.width, size.height)
    //   ..lineTo(0, size.height)
    //   ..close();

    // Path path2 = Path()
    //   ..moveTo(0, size.height)
    //   ..lineTo(size.width, 0)
    //   ..lineTo(size.width, size.height)
    //   ..close();

    Path path3 = Path()
      ..moveTo(0, size.height / 3)
      ..cubicTo(0, 0, size.width, size.height, size.width, size.height / 10)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();

    Path path4 = Path()
      ..moveTo(0, size.height / 3)
      ..cubicTo(
          0, 300, size.width / 4, size.height, size.width, size.height / 10)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();

    Path path5 = Path()
      ..moveTo(0, size.height - 200)
      ..cubicTo(0, size.height - 100, size.width / 4, size.height, size.width,
          size.height)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    // canvas.drawPath(path, paint);
    // canvas.drawPath(path2, paint2);
    canvas.drawPath(path3, paint3);
    canvas.drawPath(path4, paint);
    canvas.drawPath(path5, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
