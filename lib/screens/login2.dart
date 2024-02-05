import 'package:ecommerce/utils/index.dart';

class Login2 extends StatelessWidget {
  const Login2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final height = size.height;
    // final width = size.width;
    return Scaffold(
      // backgroundColor: backgroundColor,
      body: SingleChildScrollView(
        child: CustomPaint(
          painter: Login2Painter(),
          child: Container(
            height: height,
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: height * 0.2,
                ),
                Text(
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                ),
                Text(
                  "Please sign in to continue.",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.black45),
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Card(
                  elevation: 10,
                  // padding: EdgeInsets.symmetric(horizontal: 5),
                  // decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(5),
                  //     boxShadow: <BoxShadow>[
                  //       BoxShadow(
                  //           color: Colors.grey.withOpacity(0.5),
                  //           blurRadius: 10,
                  //           spreadRadius: 5,
                  //           offset: Offset(5, 5))
                  //     ]),
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.mail_outline),
                        hintText: "user123@gmail.com",
                        labelText: "Email",
                        border: InputBorder.none,
                        disabledBorder: InputBorder.none),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  elevation: 10,
                  // padding: EdgeInsets.symmetric(horizontal: 5),
                  // decoration: BoxDecoration(
                  //     color: Colors.white,
                  //     borderRadius: BorderRadius.circular(5),
                  //     boxShadow: <BoxShadow>[
                  //       BoxShadow(
                  //           color: Colors.grey.withOpacity(0.5),
                  //           blurRadius: 10,
                  //           spreadRadius: 5,
                  //           offset: Offset(5, 5))
                  //     ]),
                  child: TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock_outlined),
                      hintText: "******",
                      labelText: "Password",
                      border: InputBorder.none,
                      disabledBorder: InputBorder.none,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                    height: 70,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "FORGOT PASSWORD",
                        style: TextStyle(color: Color(0xffFB9729)),
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context)
                          .push(createRoute(BottomNavigation()));
                    },
                    borderRadius: BorderRadius.circular(50),
                    child: Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "LOGIN",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                                color: Colors.white),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                          )
                        ],
                      ),
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xffF3C24B), Color(0xffFB9729)])),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.1,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(createRoute(SignUp2()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(color: Colors.grey),
                      ),
                      Text(
                        "Sign Up",
                        style: TextStyle(color: Color(0xffFB9729)),
                      )
                    ],
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

class Login2Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(colors: [
        Color(0xffF1Cf54).withOpacity(0.5),
        Color(0xffFfAF3E).withOpacity(0.5),
      ]).createShader(Rect.fromCircle(center: Offset(-1, -1), radius: 300))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(size.width, 100)
      ..quadraticBezierTo(200, 200, 250, 0)
      ..lineTo(size.width, 0)
      ..close();

    final paint1 = Paint()
      ..shader = LinearGradient(colors: [
        Color(0xffF4C754).withOpacity(0.5),
        Color(0xffF8AF3E).withOpacity(0.5),
      ]).createShader(Rect.fromCircle(center: Offset(-1, -1), radius: 300))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    final path1 = Path()
      ..moveTo(size.width, 60)
      ..quadraticBezierTo(200, 200, 250, 0)
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
    canvas.drawPath(path1, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
