import 'package:ecommerce/utils/index.dart';

class SilverCard extends StatefulWidget {
  const SilverCard({Key? key}) : super(key: key);

  @override
  _SilverCardState createState() => _SilverCardState();
}

class _SilverCardState extends State<SilverCard> {
  GlobalKey<SliverAnimatedListState> globalKey =
      GlobalKey<SliverAnimatedListState>();

  @override
  Widget build(BuildContext context) {
    var data = context.watch<ProductModel>();

    _pay() {
      final snackBar = SnackBar(
          content: Text('Your cart is Empty!, please add some items...'));
      (data.cart.isEmpty)
          ? ScaffoldMessenger.of(context).showSnackBar(snackBar)
          : Navigator.of(context).push(createRoute(MyCards()));
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            floating: true,
            pinned: true, automaticallyImplyLeading: true,
            expandedHeight: 100,
            backgroundColor: Colors.white,
            elevation: 10,
            leading: backButton(context, margin: 8),
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
                onTap: () {
                  // data.addProduct("name", "image", 199, 1, context);
                  // globalKey.currentState
                  //     .insertItem(0, duration: Duration(seconds: 2));
                  // setState(() {});
                },
                borderRadius: BorderRadius.circular(15),
                child: Container(
                  width: 40,
                  margin: EdgeInsets.all(8),
                  // padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.black12,
                      )),
                  child: Icon(
                    Icons.search,
                    color: Color(0xff261F5A),
                  ),
                ),
              ),
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(50),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.ideographic,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Text(
                        "Total Price: ",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xff3C3C3C),
                          // color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        "₹" +
                            data.sum
                                .toStringAsFixed(2)
                                .toString()
                                .split(".")[0],
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            color: Color(0xff009b00)),
                      ),
                      Text(
                        "." +
                            data.sum
                                .toStringAsFixed(2)
                                .toString()
                                .split(".")[1],
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff009b00)),
                      ),
                    ],
                  ),
                  payButton(onTap: _pay, text: "Pay")
                ],
              ),
            ),
          ),
          // (data.cart.isEmpty)
          //     ? SliverAnimatedList(
          //         key: globalKey,
          //         initialItemCount: 1,
          //         itemBuilder: (context, i, animation) {
          //           print(animation.value);
          //           return SizedBox(height: 500, child: emptyCart());
          //         },
          //       )
          //     :
          SliverPadding(
            padding: EdgeInsets.only(bottom: 50.0),
            sliver: SliverAnimatedList(
              key: globalKey,
              initialItemCount: (data.cart.isEmpty) ? 1 : data.cart.length,
              itemBuilder: (context, index, animation) {
                animation.addListener(() {
                  setState(() {});
                });
                if (data.cart.isEmpty && data.cart.length == 0) {
                  return SizedBox(height: 500, child: emptyCart());
                }
                return Transform(
                  // scale: animation.value,
                  // duration: Duration(seconds: 1),
                  // opacity: animation.value,
                  transform: Matrix4.identity()
                    ..rotateX(1 - animation.value)
                    ..rotateY(1 - animation.value)
                    ..rotateZ(1 - animation.value)
                    ..translate(
                        (1 - animation.value) * 0.0,
                        (1 - animation.value) * 500.0,
                        (1 - animation.value) *
                            500.0) //remove translate to see other effect
                    ..scale(animation.value, animation.value, animation.value),
                  // scale: animation.value,
                  child: Dismissible(
                    key: UniqueKey(),
                    onDismissed: (direction) {
                      globalKey.currentState!.removeItem(index,
                          (context, animation) {
                        animation.addListener(() {
                          setState(() {});
                        });
                        return SizedBox();
                        // return Icon(
                        //   Icons.delete,
                        //   color: Colors.red[300],
                        //   size: 80 * animation.value,
                        // );
                      }, duration: Duration(seconds: 0));
                      setState(() {
                        data.removeProduct(index, data.cart[index].quantity,
                            data.cart[index].price);
                      });
                    },
                    background: Container(
                      color: Colors.red,
                    ),
                    child: Card(
                      elevation: 0,
                      margin: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
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
                                data.cart[index].image,
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          data.cart[index].name,
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: TextStyle(
                                              color: Color(0xff4C4762),
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.baseline,
                                        textBaseline: TextBaseline.ideographic,
                                        children: [
                                          Text(
                                            "₹" +
                                                data.cart[index].price
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
                                                data.cart[index].price
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
                                        color:
                                            Color(0xff767387).withOpacity(0.7),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Qty",
                                        style: TextStyle(
                                            color: Color(0xff767387)
                                                .withOpacity(0.8),
                                            fontSize: 13,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_left_rounded,
                                                size: 30,
                                              ),
                                              onPressed: (data.cart[index]
                                                          .quantity >
                                                      1)
                                                  ? () {
                                                      setState(() {
                                                        // if (data.cart[index]
                                                        //         .quantity >
                                                        //     1)
                                                        data.cart[index]
                                                            .quantity--;
                                                        data.sum = data.sum -
                                                            data.cart[index]
                                                                .price;
                                                      });
                                                    }
                                                  : null),
                                          Text(
                                            data.cart[index].quantity
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          IconButton(
                                              icon: Icon(
                                                Icons
                                                    .keyboard_arrow_right_rounded,
                                                size: 30,
                                              ),
                                              onPressed: () {
                                                setState(() {
                                                  data.cart[index].quantity++;
                                                  data.sum = data.sum +
                                                      data.cart[index].price;
                                                });
                                              })
                                        ],
                                      ),
                                      Card(
                                        elevation: 5,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        // color: Colors.transparent,
                                        child: IconButton(
                                          visualDensity: VisualDensity.compact,
                                          icon: Icon(
                                            Icons.delete,
                                            size: 20,
                                            color: Colors.red[300],
                                          ),
                                          onPressed: () {
                                            data.removeProduct(
                                                index,
                                                data.cart[index].quantity,
                                                data.cart[index].price);
                                            globalKey.currentState!.removeItem(
                                                index, (context, animation) {
                                              animation.addListener(() {
                                                setState(() {});
                                              });
                                              return Icon(
                                                Icons.delete,
                                                color: Colors.red[300],
                                                size: 80 * animation.value,
                                              );
                                            },
                                                duration: Duration(
                                                    milliseconds: 1000));
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
                    ),
                  ),
                );
              },
            ),
          ),
          // (data.cart.isEmpty)
          //     ? emptyCart()
          //     : Cart1(
          //         data: data,
          //       ),
          // SliverAnimatedList(
          //     initialItemCount: 1,
          //     itemBuilder: (context, index, animation) {
          //       return SizedBox(
          //         height: 10,
          //       );
          //     })
        ],
      ),
    );
  }
}
