import 'dart:ui';
import 'package:ecommerce/models/product_model.dart';
import 'package:ecommerce/utils/index.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class Detail extends StatefulWidget {
  final Map product;

  const Detail({Key? key, required this.product}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  int quantity = 1;
  Alignment align = Alignment.center;

  List<bool> selected = List.generate(10, (index) => false);
  @override
  Widget build(BuildContext context) {
    const double opacity = 0.1;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Color(0xffEAE9EE),
      // backgroundColor: Color(0xff303030),
      body: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 80, sigmaY: 80),
            child: SizedBox(
              height: 350,
              width: size.width,
              child: Image.network(
                widget.product["image"],
                // fit: BoxFit.fill,
              ),
            ),
          ),
          // GestureDetector(
          //   onTap: () {
          //     Navigator.of(context).push(createRoute(ImageView(
          //       image: image,
          //     )));
          //   },
          //   child: Hero(
          //     tag: image,
          //     child: Image.network(image),
          //   ),
          // ),
          ListView(
            physics: BouncingScrollPhysics(),
            // padding: EdgeInsets.only(top: 400),
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    createRoute(
                      ImageView(
                        image: widget.product["image"],
                      ),
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     image: NetworkImage(image),
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  child: Hero(
                    tag: widget.product["image"],
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 50, sigmaY: 50),
                      child: SizedBox(
                        height: 300,
                        child: Image.network(widget.product["image"]),
                      ),
                    ),
                  ),
                  // child: Hero(
                  //   tag: image,
                  //   child: SizedBox(
                  //     height: 300,
                  //     child: Image.network(image),
                  //   ),
                  // ),
                ),
              ),
              // Stack(
              //   children: [
              //     // Hero(tag: image, child: Image.network(image)),
              //     // SizedBox(height: 400,),
              //     Card(
              //       margin: EdgeInsets.only(top: 30, left: 5),
              //       shape: RoundedRectangleBorder(
              //           borderRadius: BorderRadius.circular(100)),
              //       color: Colors.transparent,
              //       child: BackButton(
              //         color: Colors.white,
              //       ),
              //     )
              //   ],
              // ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))
                    // border: Border.fromBorderSide(
                    //   BorderSide(),
                    // ),
                    ),
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.product["name"],
                                style: TextStyle(
                                    color: Color(0xff000060),
                                    fontSize: 25,
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                'by Seto',
                                style: TextStyle(
                                    color: Color(0xff767387),
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.ideographic,
                          children: [
                            Text(
                              '₹${widget.product["price"].toStringAsFixed(2).toString().split(".")[0]}',
                              style: TextStyle(
                                  color: Color(0xffC8848E),
                                  fontSize: 25,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "." +
                                  widget.product["price"]
                                      .toStringAsFixed(2)
                                      .toString()
                                      .split(".")[1],
                              style: TextStyle(
                                  color: Color(0xffC8848E),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '''Show the others how you roll with this olive shirt featuring a silhouetted print of the famous T-34-85 tank and "That's How I Roll" writing. The print is very soft and blends into the T-shirt.
* Material: 100% cotton
* Base color: Olive
* Black print on front
* Made in Portugal
* Machine washable at 30°C, Iron inside out.''',
                      style: TextStyle(
                          color: Color(0xff767387),
                          fontSize: 13,
                          fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Color",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Color(0xff3D3755),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selected = selected
                                      .asMap()
                                      .entries
                                      .map((entries) =>
                                          entries.key == 0 ? true : false)
                                      .toList();
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2,
                                        color: Colors.grey.withOpacity(
                                            selected[0] ? 1 : opacity))),
                                child: Card(
                                  // elevation: 1,
                                  shadowColor: Colors.brown,
                                  color: Colors.brown,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  child: SizedBox(
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selected = selected
                                      .asMap()
                                      .entries
                                      .map((entries) =>
                                          entries.key == 1 ? true : false)
                                      .toList();
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2,
                                        color: Colors.grey.withOpacity(
                                            selected[1] ? 1 : opacity))),
                                child: Card(
                                  // elevation: 2,
                                  shadowColor: Colors.cyan,
                                  color: Colors.cyan,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  child: SizedBox(
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  selected = selected
                                      .asMap()
                                      .entries
                                      .map((entries) =>
                                          entries.key == 2 ? true : false)
                                      .toList();
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 2,
                                        color: Colors.grey.withOpacity(
                                            selected[2] ? 1 : opacity))),
                                child: Card(
                                  // elevation: 3,
                                  shadowColor: Colors.amber,
                                  color: Colors.amber,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                  child: SizedBox(
                                    height: 20,
                                    width: 20,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // SizedBox(
                        //   width: 30,
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Qty",
                              style: TextStyle(
                                  color: Color(0xff767387).withOpacity(0.8),
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.keyboard_arrow_left_rounded,
                                  size: 30,
                                ),
                                onPressed: (quantity > 1)
                                    ? () {
                                        setState(() {
                                          quantity--;
                                          // widget.data.sum = widget.data.sum -
                                          //     widget.data.cart[index].price;
                                        });
                                      }
                                    : null),
                            Text(
                              quantity.toString(),
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.keyboard_arrow_right_rounded,
                                  size: 30,
                                ),
                                onPressed: () {
                                  setState(() {
                                    quantity++;
                                    // widget.data.sum = widget.data.sum +
                                    //     widget.data.cart[index].price;
                                  });
                                })
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AnimatedAlign(
                      duration: Duration(seconds: 1),
                      alignment: align,
                      child: ElevatedButton.icon(
                        style: ButtonStyle(
                            padding:
                                MaterialStateProperty.all(EdgeInsets.all(15)),
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xff000000)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)))),
                        onPressed: () {
                          setState(() {
                            align = Alignment.centerLeft;
                          });
                          Provider.of<ProductModel>(context, listen: false)
                              .addProduct(
                                  widget.product["name"],
                                  widget.product["image"],
                                  widget.product["price"],
                                  quantity,
                                  context);
                        },
                        icon: Icon(Icons.shopping_cart),
                        label: Text("ADD TO CART"),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Card(
          //   margin: EdgeInsets.only(top: 30, left: 5),
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(100),
          //   ),
          //   elevation: 5,
          //   color: Colors.white,
          //   child: BackButton(
          //     color: Colors.black,
          //   ),
          // )
          Positioned(
            top: 30,
            left: 10,
            child: backButton(context, padding: 8),
          ),
        ],
      ),
    );
  }
}

class ImageView extends StatelessWidget {
  final image;
  ImageView({Key? key, this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          InteractiveViewer(
            minScale: 0.5,
            maxScale: 10.0,
            child: Center(
              child: Hero(
                tag: image,
                child: Image.network(image),
              ),
            ),
          ),
          Positioned(
            top: 30,
            left: 10,
            child: backButton(context, padding: 8),
          ),
        ],
      ),
    );
  }
}
