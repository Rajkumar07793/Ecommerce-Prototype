import 'package:ecommerce/utils/index.dart';
import 'package:get/get.dart';

class SignUp3 extends StatefulWidget {
  @override
  _SignUp3State createState() => _SignUp3State();
}

class _SignUp3State extends State<SignUp3> with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? animation;
  bool? isSecure = true;

  @override
  void initState() {
    animate();
    super.initState();
  }

  animate() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 3),
    );
    animation = Tween<double>(begin: 0, end: 50).animate(animationController!)
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
      body: CustomPaint(
        painter: LoginPainter(animation: animation!),
        child: SingleChildScrollView(
          child: Container(
            child: Container(
              height: size.height,
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  Icon(
                    Icons.lock_outline,
                    size: 52,
                    color: Color.fromRGBO(0, 0, 155, 1),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Register Here!",
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.w600,
                      color: Color.fromRGBO(0, 0, 155, 1),
                    ),
                  ),
                  Text(
                    "Let us know about your self!",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff000000).withOpacity(0.5),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "John Doe",
                        labelText: "Full Name",
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
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "user12@gmail.com",
                        labelText: "Email",
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
                      obscureText: isSecure!,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "******",
                        labelText: "Password",
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isSecure = !isSecure!;
                            });
                          },
                          icon: Icon(Icons.remove_red_eye_outlined),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(0, 0, 155, 1),
                      )),
                      onPressed: () {
                        // Navigator.of(context).push(
                        //   createRoute(Login3()),
                        // );
                        Get.off(() => Login3());
                      },
                      child: Text(
                        "Register",
                        style: TextStyle(
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: () {
                      // Navigator.of(context).push(
                      //   createRoute(Login3()),
                      // );
                      Get.off(() => Login3());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account? ",
                          style: TextStyle(
                            color: Color(0xff000000).withOpacity(0.5),
                          ),
                        ),
                        Text(
                          "Login",
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 155, 1),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SignUp3Painter extends CustomPainter {
  final Animation animation;
  SignUp3Painter({Key? key, required this.animation});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromRGBO(0, 0, 155, 1)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;

    final path = Path()
      ..moveTo(size.width / 2, 65)
      ..lineTo(size.width / 2 - 40, 75)
      ..lineTo(size.width / 2 - 40, 120)
      ..cubicTo(size.width / 2 - 40, 120, size.width / 2, 210,
          size.width / 2 + 40, 120)
      ..lineTo(size.width / 2 + 40, 75)
      ..close();

    canvas.drawPath(path, paint);

    final paint1 = Paint()
      ..color = Colors.grey.withOpacity(0.2)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..strokeWidth = 3;

    canvas.drawCircle(Offset(size.width / 2 - 80 - animation.value, 120),
        (5 + animation.value / 3).toDouble(), paint1);
    canvas.drawCircle(
        Offset(size.width / 2 + 80 + animation.value, 80), 10, paint1);
    canvas.drawCircle(Offset(size.width / 2 + 80 + animation.value, 180),
        (30 + animation.value / 4).toDouble(), paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
