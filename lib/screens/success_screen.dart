import "package:ecommerce/utils/index.dart";
import 'package:flutter/cupertino.dart';

class Success extends StatefulWidget {
  const Success({Key? key}) : super(key: key);

  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  @override
  void initState() {
    animate();
    super.initState();
  }

  animate() {
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    )..addListener(() {
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
    return Scaffold(
      backgroundColor: Color(0xffEAE9EE),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.home,
          color: Colors.black,
        ),
        onPressed: () {
          index = 2;
          Navigator.of(context).push(createRoute(BottomNavigation()));
        },
      ),
      // appBar: AppBar(
      //   title: Text("Success"),
      // ),
      body: CustomPaint(
        painter: SuccessPaint(animationController!),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.check_circle_rounded,
                size: 120,
                color: Color(0xff008000),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Order Placed!",
                style: TextStyle(
                  fontSize: 25,
                  color: Color(0xff008000),
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Your order was placed successfully.\nFor more details, check Delivery Status under Profile tab",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Navigator.of(context)
                      //     .pushReplacement(createRoute(MyOrders()));
                      index = 0;
                      Navigator.of(context)
                          .push(createRoute(BottomNavigation()));
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xff0000ff))),
                    child: Row(
                      children: [
                        Text(
                          "Delivery Status",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          CupertinoIcons.chevron_right_square_fill,
                          color: Color(0xffffffff),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SuccessPaint extends CustomPainter {
  final AnimationController animationController;
  SuccessPaint(this.animationController);

  @override
  void paint(Canvas canvas, Size size) {
    // Color color = Color(0xff3A7CEA);
    final paint = Paint()
      ..color = Colors.grey.withOpacity(0.3)
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    double value = animationController.value;
    canvas.drawCircle(Offset(size.width / 3 * value, size.height / 5 * value),
        10 + value * 10, paint);
    canvas.drawCircle(
        Offset(size.width / 1 * (1 - value), size.height / 2.0 * value * 2),
        50 * cos(value * 2 * pi / 1),
        paint);
    canvas.drawCircle(
        Offset(size.width / 1.5 + value * 50, size.height / 1.8 + value * 50),
        20,
        paint);
    canvas.drawCircle(
        Offset(size.width / 5 + (1 - value) * 200,
            size.height / 2.5 + (1 - value) * 50),
        20 * sin(value * 3 * pi),
        paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
