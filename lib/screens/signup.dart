import 'package:ecommerce/utils/index.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: CustomPaint(
            painter: CustomPainter2(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    "Register Now",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 80,
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
                        hintText: "Enter your username",
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
                          width: 30,
                          child: Row(
                            children: [
                              Icon(
                                Icons.alternate_email,
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
                        labelText: "Email",
                        hintText: "Enter your Email Address",
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
                          .pushReplacement(createRoute(Login2()));
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(color: Colors.white, fontSize: 25),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .pushReplacement(createRoute(Login2()));
                      },
                      child: Text("Already have an account? Login"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Route _createRoute() {
  //   return PageRouteBuilder(
  //     barrierColor: Color(0xff3333ff),
  //     transitionDuration: Duration(milliseconds: 1500),
  //     pageBuilder: (context, animation, secondaryAnimation) => Login(),
  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
  //       var begin = Offset(-1.0, 0.0);
  //       var end = Offset.zero;
  //       var curve = Curves.ease;
  //
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

class CustomPainter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(
        colors: [
          Color(0xffFFA958).withOpacity(0.9),
          Color(0xffcc4958).withOpacity(0.9),
        ],
      ).createShader(Rect.fromLTRB(size.width, 10, 10, 10))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    final paint1 = Paint()
      ..shader = LinearGradient(
        colors: [
          Color(0xff3333ff).withOpacity(0.8),
          Color(0xff2381ff).withOpacity(0.8),
        ],
      ).createShader(Rect.fromLTRB(size.width / 2, 400, 0, 10))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..cubicTo(size.width / 2, size.height / 1.5, 300, size.height / 10,
          size.width, size.height / 3)
      ..lineTo(size.width, 0)
      ..close();

    final path1 = Path()
      ..moveTo(0, size.height / 3)
      ..cubicTo(size.width / 3, size.height / 4, 270, size.height / 3 + 30,
          size.width, size.height / 3 + 30)
      ..cubicTo(0, 600, 0, size.height * 1.2, size.width, size.height * 1.0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width / 3 * 0, 0)
      ..close();

    canvas.drawPath(path1, paint1);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
