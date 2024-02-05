import 'package:ecommerce/utils/index.dart';

class Cart extends StatelessWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = context.watch<ProductModel>();
    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: Color(0xffEAE9EE),
      // backgroundColor: Color(0xff303030),
      appBar: AppBar(
        // backgroundColor: Color(0xffEAE9EE),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          borderRadius: BorderRadius.circular(15),
          child: Container(
            // padding: EdgeInsets.all(10),
            margin: EdgeInsets.all(8),
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
        ),
        // leading: BackButton(
        //   color: Color(0xffC8848E),
        // ),
        title: Text(
          "Cart",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(15),
            child: Container(
              margin: EdgeInsets.all(8),
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: Colors.black12,
                  )),
              child: Center(
                child: Icon(
                  Icons.search,
                  color: Color(0xff261F5A),
                ),
              ),
            ),
          ),
        ],
      ),
      body: (data.cart.isEmpty)
          ? emptyCart()
          : Cart1(
              data: data,
            ),
    );
  }
}

Widget emptyCart() {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(
          Icons.shopping_bag_outlined,
          color: Color(0xffC8848E),
          size: 100,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Shopping Bag is Empty",
          style: TextStyle(color: Colors.black, fontSize: 22),
        ),
        // SizedBox(
        //   height: 10,
        // ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            "Looks like you haven't added any item to your cart yet",
            style: TextStyle(color: Colors.black54, fontSize: 16),
            textAlign: TextAlign.center,
          ),
        )
      ],
    ),
  );
}

class Cart1 extends StatefulWidget {
  final data;

  const Cart1({Key? key, this.data}) : super(key: key);

  @override
  _Cart1State createState() => _Cart1State();
}

class _Cart1State extends State<Cart1> {
  double width = 60;
  bool isOpen = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Align(
        alignment: Alignment(1.1, 0.85),
        child: AnimatedContainer(
          // height: 50,
          width: width,
          // alignment: Alignment(200,0.85),
          duration: Duration(seconds: 1),
          // height: 80,
          // width: 80,
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(createRoute(Success()));
            },
            child: Card(
              elevation: 10,
              margin: EdgeInsets.only(left: (width == 500) ? 40 : 10),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 0,
                ),
                child: (isOpen)
                    ? IconButton(
                        icon: Icon(Icons.arrow_back_ios),
                        onPressed: () {
                          setState(() {
                            width = 500;
                            isOpen = false;
                          });
                        },
                      )
                    : FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Row(
                          children: [
                            IconButton(
                              icon: Icon(Icons.arrow_forward_ios),
                              onPressed: () {
                                setState(() {
                                  width = 60;
                                  isOpen = true;
                                });
                              },
                            ),
                            Text(
                              "Subtotal: ",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              "₹" + widget.data.sum.toString(),
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.red),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Checkout",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.green),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
      // bottomNavigationBar: Container(
      //     child: Text(
      //   "Total Price: ₹${widget.data.sum}",
      //   style: TextStyle(
      //       color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),
      //   textAlign: TextAlign.center,
      // )),
      backgroundColor: Colors.transparent,
      body: ListView.builder(
        padding: EdgeInsets.only(bottom: 120),
        itemCount: widget.data.cart.length,
        itemBuilder: (context, index) {
          return Card(
            elevation: 0,
            margin: EdgeInsets.all(10),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      // color: Color(0xff424242),
                      borderRadius: BorderRadius.circular(10)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(
                      widget.data.cart[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.data.cart[index].name,
                              style: TextStyle(
                                  color: Color(0xff4C4762),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.ideographic,
                              children: [
                                Text(
                                  "₹" +
                                      widget.data.cart[index].price
                                          .toStringAsFixed(2)
                                          .toString()
                                          .split(".")[0],
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff403B58)),
                                ),
                                Text(
                                  "." +
                                      widget.data.cart[index].price
                                          .toStringAsFixed(2)
                                          .toString()
                                          .split(".")[1],
                                  style: TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff403B58)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Text(
                          'by Seto',
                          style: TextStyle(
                              color: Color(0xff767387),
                              fontSize: 11,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Extra comfy t-shirt with body rest',
                          style: TextStyle(
                              color: Color(0xff767387).withOpacity(0.7),
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     Text(
                        //       "Price: ",
                        //       style: TextStyle(
                        //           fontSize: 14, fontWeight: FontWeight.w600),
                        //     ),
                        //     Row(
                        //       crossAxisAlignment: CrossAxisAlignment.baseline,
                        //       textBaseline: TextBaseline.ideographic,
                        //       children: [
                        //         Text(
                        //           "₹" +
                        //               widget.data.cart[index].price
                        //                   .toStringAsFixed(2)
                        //                   .toString()
                        //                   .split(".")[0],
                        //           style: TextStyle(
                        //               fontSize: 20,
                        //               fontWeight: FontWeight.w600,
                        //               color: Color(0xff403B58)),
                        //         ),
                        //         Text(
                        //           "." +
                        //               widget.data.cart[index].price
                        //                   .toStringAsFixed(2)
                        //                   .toString()
                        //                   .split(".")[1],
                        //           style: TextStyle(
                        //               fontSize: 10,
                        //               fontWeight: FontWeight.w600,
                        //               color: Color(0xff403B58)),
                        //         ),
                        //       ],
                        //     ),
                        //   ],
                        // ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    icon: Icon(
                                      Icons.arrow_left,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (widget.data.cart[index].quantity >
                                            1) {
                                          widget.data.cart[index].quantity--;
                                          widget.data.sum = widget.data.sum -
                                              widget.data.cart[index].price;
                                        }
                                      });
                                    }),
                                Text(
                                  widget.data.cart[index].quantity.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.arrow_right,
                                      size: 30,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        widget.data.cart[index].quantity++;
                                        widget.data.sum = widget.data.sum +
                                            widget.data.cart[index].price;
                                      });
                                    })
                              ],
                            ),
                            Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100)),
                              // color: Colors.transparent,
                              child: IconButton(
                                visualDensity: VisualDensity.compact,
                                icon: Icon(
                                  Icons.delete,
                                  size: 20,
                                  color: Colors.red[300],
                                ),
                                onPressed: () {
                                  Provider.of<ProductModel>(context,
                                          listen: false)
                                      .removeProduct(
                                          index,
                                          widget.data.cart[index].quantity,
                                          widget.data.cart[index].price);
                                },
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
