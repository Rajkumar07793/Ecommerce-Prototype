import 'package:ecommerce/utils/index.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    // final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: Colors.transparent,
      //   elevation: 0,
      //   title: Text("My Account",style: TextStyle(color: Colors.black),),
      // ),
      body: CustomPaint(
        painter: CustomPaint1(),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topRight,
              child: PopupMenuButton(
                onSelected: (selected) {
                  print(selected);
                  switch (selected) {
                    case "logout":
                      Navigator.of(context).push(createRoute(Login2()));
                      break;
                    case "cart":
                      index = 3;
                      Navigator.of(context)
                          .pushReplacement(createRoute(BottomNavigation()));
                      break;
                  }
                },
                // color: Color(0xffff9e70),
                itemBuilder: (context) {
                  return <PopupMenuEntry>[
                    PopupMenuItem(
                      value: "logout",
                      child: Row(
                        children: [
                          Icon(Icons.logout),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Logout'),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: "cart",
                      child: Row(
                        children: [
                          Icon(Icons.shopping_cart),
                          SizedBox(
                            width: 10,
                          ),
                          Text('Cart'),
                        ],
                      ),
                    ),
                  ];
                },
              ),
            ),
            SizedBox(
              height: height * 0.08,
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration:
                  BoxDecoration(color: backgroundColor, shape: BoxShape.circle),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 60,
                backgroundImage: AssetImage("assets/images/Rknew.jpg"),
              ),
            ),
            Text(
              "Raj kumar Patel",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 22),
            ),
            Text(
              "raj.impetrosys.gmail.com",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 40,
              child: Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: EdgeInsets.only(right: 5),
                  // padding: EdgeInsets.all(0),
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.edit,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20)),
                    // elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Phone: ",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "Address: ",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "DOB: ",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "9977783414",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "vijaynagar, Indore",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                "19/11/1995",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Navigator.of(context).push(createRoute(MyCards()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.credit_card_rounded,
                                color: Color(0xff077FFF),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "My Cards",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          Icon(Icons.keyboard_arrow_right_rounded),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(createRoute(AddressBook()));
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.contact_phone_outlined,
                                color: Color(0xff077FFF),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Address Book",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          Icon(Icons.keyboard_arrow_right_rounded),
                        ],
                      ),
                    ),
                  ),
                  // Container(
                  //   padding: EdgeInsets.all(20),
                  //   margin: EdgeInsets.all(10),
                  //   decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(10)),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Row(
                  //         children: [
                  //           Icon(
                  //             Icons.history,
                  //             color: Color(0xff009F00),
                  //           ),
                  //           SizedBox(
                  //             width: 10,
                  //           ),
                  //           Text(
                  //             "Transaction History",
                  //             style: TextStyle(
                  //                 fontSize: 16, fontWeight: FontWeight.w500),
                  //           )
                  //         ],
                  //       ),
                  //       Icon(Icons.keyboard_arrow_right_rounded),
                  //     ],
                  //   ),
                  // ),
                  // Container(
                  //   // padding: EdgeInsets.all(20),
                  //   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  //   decoration: BoxDecoration(
                  //       color: Colors.white,
                  //       borderRadius: BorderRadius.circular(20)),
                  //   child: ExpansionTile(
                  //     tilePadding: EdgeInsets.symmetric(horizontal: 20),
                  //     // backgroundColor: Color(0xffffffff),
                  //     // collapsedBackgroundColor: Color(0xffffffff),
                  //     title: Text(
                  //       "My Orders",
                  //       style: TextStyle(fontWeight: FontWeight.w500),
                  //     ),
                  //     leading: Icon(Icons.list),
                  //     children: [
                  //       for (int i = 0; i < 5; i++) ...[
                  //         Row(
                  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //           children: [
                  //             Text("$i. "),
                  //             Text("Order $i"),
                  //           ],
                  //         ),
                  //         Padding(
                  //           padding: const EdgeInsets.symmetric(
                  //               horizontal: 30, vertical: 5),
                  //           child: Divider(
                  //             thickness: 1,
                  //           ),
                  //         )
                  //       ]
                  //     ],
                  //   ),
                  // ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      Navigator.of(context).push(createRoute(MyOrders()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              // Icon(
                              //   Icons.bookmark_border,
                              //   color: Color(0xff0006ff),
                              // ),
                              Icon(
                                Icons.history,
                                color: Color(0xff009F00),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "My Orders",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          Icon(Icons.keyboard_arrow_right_rounded),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(createRoute(Help()));
                    },
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: EdgeInsets.all(20),
                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.headset_mic_rounded,
                                color: Color(0xff0006ff),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Help Center",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          Icon(Icons.keyboard_arrow_right_rounded),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.policy_outlined,
                              color: Color(0xffd0402f),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Privacy Policy",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        Icon(Icons.keyboard_arrow_right_rounded),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(20),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.logout,
                              color: Color(0xffd00000),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Logout",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        Icon(Icons.keyboard_arrow_right_rounded),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomPaint1 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = LinearGradient(colors: [
        Color(0xffff9e40),
        Color(0xffff9e50),
        Color(0xffff9e60),
        Color(0xffff9e70),
      ]).createShader(Rect.fromCircle(
          center: Offset(size.width / 2, size.height / 2), radius: 100))
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height / 3)
      //
      // ..lineTo(size.width/1.5, size.height)
      // ..lineTo(size.width/1.5, size.height/2)
      // ..lineTo(size.width/3, size.height/2)
      // ..lineTo(size.width/3, size.height)
      // ..cubicTo(size.width/1.8, size.height/3, size.width/1.5, 0, size.width/8, size.height/3)

      ..quadraticBezierTo(size.width, size.height / 2, 0, size.height * 0.2)
      // ..lineTo(0, size.height / 5)
      ..close();

    canvas.drawPath(path, paint);

    // final paint1 = Paint()
    //   ..color = Color(0xffEAE9EE)
    //   // ..shader = LinearGradient(colors: [
    //   //   Color(0xff00897b),
    //   //   Color(0xff00695c),
    //   // ]).createShader(Rect.fromCircle(center: Offset(size.width/2, size.height/2), radius: 100))
    //   ..strokeCap = StrokeCap.round
    //   ..style = PaintingStyle.fill;

    // Offset center = Offset(size.width / 2, size.height / 3.5);
    // RRect roundRectangle = RRect.fromRectAndRadius(
    //     Rect.fromCenter(center: center, width: 140.0, height: 140.0),
    //     Radius.circular(100.0));
    // canvas.drawRRect(roundRectangle, paint1);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
