import 'package:ecommerce/utils/index.dart';
import 'package:flutter/cupertino.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var data = context.watch<OrderedModel>();
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: backgroundColor,
        leading: backButton(context, margin: 8),
        title: Text(
          "My Orders",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Container(
            margin: EdgeInsets.all(8),
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black12),
            ),
            child: Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: (data.orders.isEmpty)
          ? emptyOrders(context)
          : ListView.builder(
              itemCount: data.orders.length,
              itemBuilder: (context, index) {
                return Container(
                  // height: 300,
                  margin: EdgeInsets.only(top: 20, left: 50),
                  padding: EdgeInsets.only(top: 20, left: 30, bottom: 20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    // color: Color(0xff253598),
                    borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      for (int j = 0; j < data.orders[index].length; j++)
                        Column(
                          children: [
                            if (j == 0) ...[
                              Text(
                                "Order Id: " +
                                    "RKISS" +
                                    data.orders[index][j].sum
                                        .round()
                                        .toString(),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text("Date: " + DateTime.now().toString()),
                              Divider(
                                thickness: 2,
                                height: 30,
                                color: Colors.black,
                              ),
                              SizedBox(
                                height: 10,
                              )
                            ],
                            Table(
                              columnWidths: {
                                0: FixedColumnWidth(40),
                                1: FixedColumnWidth(160),
                              },
                              children: <TableRow>[
                                TableRow(
                                  children: [
                                    Text(
                                      "$j.",
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      data.orders[index][j].name.toString(),
                                    ),
                                    Text(
                                      data.orders[index][j].qty.toString() +
                                          " x " +
                                          data.orders[index][j].price
                                              .toString(),
                                    ),
                                    Text(
                                      (data.orders[index][j].qty *
                                              data.orders[index][j].price)
                                          .toString(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Divider(
                              thickness: 1,
                            ),
                            if (j == data.orders[index].length - 1)
                              Text(
                                "Total: " +
                                    data.orders[index][j].sum
                                        .toStringAsFixed(2),
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                          ],
                        ),
                    ],
                  ),
                  // child: ListView.builder(
                  //   physics: NeverScrollableScrollPhysics(),
                  //   itemCount: data.orders[index].length,
                  //   itemBuilder: (context, j) {
                  //     return Column(
                  //       children: [
                  //         if (j == 0) ...[
                  //           Text(
                  //             "Order Id: " +
                  //                 "RKISS" +
                  //                 data.orders[index][j].sum.round().toString(),
                  //             style: TextStyle(
                  //               fontSize: 20,
                  //               fontWeight: FontWeight.w600,
                  //             ),
                  //           ),
                  //           SizedBox(
                  //             height: 10,
                  //           )
                  //         ],
                  //         Table(
                  //           columnWidths: {
                  //             0: FixedColumnWidth(40),
                  //             1: FixedColumnWidth(160),
                  //           },
                  //           children: <TableRow>[
                  //             TableRow(
                  //               children: [
                  //                 Text(
                  //                   "$j.",
                  //                   textAlign: TextAlign.center,
                  //                 ),
                  //                 Text(
                  //                   data.orders[index][j].name.toString(),
                  //                 ),
                  //                 Text(
                  //                   data.orders[index][j].qty.toString() +
                  //                       " x " +
                  //                       data.orders[index][j].price.toString(),
                  //                 ),
                  //                 Text(
                  //                   (data.orders[index][j].qty *
                  //                           data.orders[index][j].price)
                  //                       .toString(),
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         ),
                  //         Divider(
                  //           thickness: 1,
                  //         ),
                  //         if (j == data.orders[index].length - 1)
                  //           Text(
                  //             "Total: " +
                  //                 data.orders[index][j].sum.toStringAsFixed(2),
                  //             style: TextStyle(
                  //               fontSize: 20,
                  //               fontWeight: FontWeight.w600,
                  //             ),
                  //           ),
                  //       ],
                  //     );
                  //   },
                  // ),
                );
              },
            ),
    );
  }
}

Widget emptyOrders(context) {
  return SizedBox.expand(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          CupertinoIcons.cart,
          size: 100,
          color: Color(0xffff0000),
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          "You have not yet ordered anything",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20,
        ),
        ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xff0000ff))),
            onPressed: () {
              index = 2;
              Navigator.of(context).push(createRoute(BottomNavigation()));
            },
            child: Text("Order Something"))
      ],
    ),
  );
}
