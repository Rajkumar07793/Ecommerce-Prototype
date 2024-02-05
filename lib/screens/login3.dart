import 'package:ecommerce/utils/index.dart';
import 'package:get/get.dart';

class Login3 extends StatefulWidget {
  const Login3({Key? key}) : super(key: key);

  @override
  _Login3State createState() => _Login3State();
}

class _Login3State extends State<Login3> with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? animation;
  bool isSecure = true;

  @override
  void initState() {
    animate();
    super.initState();
  }

  animate() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(
        seconds: 3,
      ),
    );
    CurvedAnimation curve =
        CurvedAnimation(parent: animationController!, curve: Curves.linear);
    animation = Tween<double>(begin: 0, end: 50).animate(curve)
      ..addListener(() {
        setState(() {});
      });
    animationController!.repeat(reverse: true);
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: CustomPaint(
          painter: LoginPainter(animation: animation!),
          child: Container(
            height: size.height,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  height: 60,
                ),
                Icon(
                  Icons.lock_outlined,
                  size: 50,
                  color: Color.fromRGBO(0, 0, 155, 1),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  "Welcome to Saifty!",
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(0, 0, 155, 1),
                  ),
                ),
                Text(
                  "Keep your data safe!",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff000000).withOpacity(0.5),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: "Email",
                      hintText: "user12@gmail.com",
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    obscureText: isSecure,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: "Password",
                        hintText: "******",
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isSecure = !isSecure;
                              });
                            },
                            icon: Icon(Icons.remove_red_eye_outlined))),
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(0, 0, 155, 1),
                      ),
                      visualDensity: VisualDensity.adaptivePlatformDensity,
                    ),
                    onPressed: () {
                      // Navigator.of(context).push(
                      //   createRoute(
                      //     BottomNavigation(),
                      //   ),
                      // );
                      Get.off(() => BottomNavigation());
                    },
                    child: Text(
                      "Login",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(
                      color: Color.fromRGBO(0, 0, 155, 1),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    // Navigator.of(context).push(createRoute(SignUp3()));
                    Get.off(() => SignUp3());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(
                            color: Color(0xff000000).withOpacity(0.5)),
                      ),
                      Text(
                        "Register!",
                        style: TextStyle(color: Color.fromRGBO(0, 0, 155, 1)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginPainter extends CustomPainter {
  final Animation animation;
  LoginPainter({Key? key, required this.animation});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4
      ..shader = LinearGradient(
        colors: [
          Color.fromRGBO(0, 0, 155, 1),
          Color.fromRGBO(0, 0, 155, 1),
        ],
      ).createShader(
        Rect.fromCircle(
          center: Offset(0, 0),
          radius: 100,
        ),
      );

    final path = Path()
      ..moveTo(size.width / 2, 68)
      ..lineTo(size.width / 2.45, 75)
      ..lineTo(size.width / 2.45, 120)
      // ..quadraticBezierTo(size.width / 2.5, 160, size.width / 1.7, 120)
      ..cubicTo(size.width / 2.45, 165, size.width - size.width / 2.45, 165,
          size.width - size.width / 2.45, 120)
      ..lineTo(size.width - size.width / 2.45, 75)
      ..close();

    canvas.drawPath(path, paint);

    final paint1 = Paint()
      ..style = PaintingStyle.fill
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 4
      ..shader = LinearGradient(
        colors: [
          Colors.grey.withOpacity(0.2),
          Colors.grey.withOpacity(0.2),
          // Color(0xffE8E0EF),
        ],
      ).createShader(
        Rect.fromCircle(
          center: Offset(0, 0),
          radius: 100,
        ),
      );

    canvas.drawCircle(
        Offset(size.width / 3 - animation.value,
            (100 - animation.value / 5).toDouble()),
        (3 + animation.value / 6).toDouble(),
        paint1);
    canvas.drawCircle(
        Offset(size.width - size.width / 3 + animation.value,
            (80 - animation.value / 2).toDouble()),
        (2 + animation.value / 7).toDouble(),
        paint1);
    canvas.drawCircle(
        Offset(size.width - size.width / 3 + animation.value / 2,
            (140 + animation.value / 2).toDouble()),
        (5 + animation.value / 5).toDouble(),
        paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
