import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/screens/all_products_grid.dart';
import 'package:ecommerce/utils/index.dart';
import 'package:faker/faker.dart';

import 'components/product_name_and_price.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List categories = [
    for (int i = 0; i < 50; i++)
      {
        "name": Faker().lorem.word(),
        "price": 299.00,
        "image": Faker()
            .image
            .image(random: true, keywords: ["products", "wearing", "t-shirts"])
      },
    {
      "name": "Mobiles",
      "price": 299.00,
      "image":
          "https://i2.wp.com/maplestore.in/wp-content/uploads/2020/10/IN_r1309_Graphite_PDP_Image_Position_2.jpg?fit=2048%2C2048&ssl=1"
    },
    {
      "name": "Bag",
      "price": 299.00,
      "image":
          "https://image.shutterstock.com/image-photo/red-elegant-female-bag-two-260nw-1032419707.jpg"
    },
    {
      "name": "Flat Shoes",
      "price": 299.00,
      "image":
          "https://in.ecco.com/dw/image/v2/BCNL_PRD/on/demandware.static/-/Sites-ecco/default/dw2ab02d0a/productimages/208043-01378-outside.jpg"
    },
    {
      "name": "Watches",
      "price": 299.00,
      "image":
          "https://img.pngio.com/smart-watches-png-image-digital-wrist-watch-png-1063_1160.png"
    },
  ];

  List tShirt = [
    for (int i = 0; i < 50; i++)
      {
        "id": 0,
        "name": Faker().food.dish(),
        "price": 599.00,
        "image": Faker().image.image(
            random: true,
            keywords: ["products", "wearing", "t-shirts", "transparent"],
            height: 600,
            width: 600)
      },
    {
      "id": 1,
      "name": "Irul T-shirt",
      "price": 199.00,
      "image":
          "https://rukminim1.flixcart.com/image/800/960/kj4m0sw0-0/t-shirt/a/k/6/m-tsrt-301-reya-original-imafyrjpggzfz4gy.jpeg?q=50",
    },
    {
      "id": 2,
      "name": "Round Neck T-shirt",
      "price": 299.00,
      "image":
          "https://rukminim1.flixcart.com/image/800/960/jt4olu80/t-shirt/v/7/v/xl-t-shirt-0068-eg-original-imafejrfpzjkxvkq.jpeg?q=50",
    },
    {
      "id": 3,
      "name": "Striped T-shirt",
      "price": 299.00,
      "image":
          "https://rukminim1.flixcart.com/image/800/960/jwmfcsw0/t-shirt/p/f/d/xxl-awt1020ol-aelomart-original-imaf7qdtbzggxbpu.jpeg?q=50",
    },
    {
      "id": 4,
      "name": "Black striped rounded neck stylish T-shirt",
      "price": 499.00,
      "image":
          "https://rukminim1.flixcart.com/image/800/960/kh80vww0-0/t-shirt/f/l/f/s-11-v-neck-try-this-original-imafxa2dgyhmqqwy.jpeg?q=50",
    },
    {
      "id": 5,
      "name": "Marval T-shirt",
      "price": 399.00,
      "image": "https://sc02.alicdn.com/kf/HTB1v0IPJVXXXXbDXFXXq6xXFXXXe.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var data = context.watch<ProductModel>();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/images/Rknew.jpg"),
              ),
              Stack(
                children: [
                  IconButton(
                      icon: Icon(
                        Icons.shopping_cart_outlined,
                        size: 30,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        index = 3;
                        Navigator.of(context)
                            .pushReplacement(createRoute(BottomNavigation()));
                      }),
                  Positioned(
                    right: 0,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: Color(0xffF17C7D),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                          child: Text(
                        data.cart.length.toString(),
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Trending Shop",
            style: TextStyle(
                color: Colors.black, fontSize: 22, fontWeight: FontWeight.w500),
          ),
          Text(
            "Get popular fashion from home",
            style: TextStyle(
                color: Colors.black, fontSize: 14, fontWeight: FontWeight.w400),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                // color: Color(0xff3F3F3F),
                borderRadius: BorderRadius.circular(10)),
            child: TextFormField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Color(0xffF49297),
                  ),
                  hintText: "Search anything you like",
                  hintStyle: TextStyle(color: Color(0xffC1C1C1))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Categories',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(createRoute(AllProductsGrid(
                    products: categories,
                  )));
                },
                child: Text(
                  'See all',
                  style: TextStyle(
                      color: Color(0xffC8848E),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 150,
            child: CarouselSlider(
              options: CarouselOptions(
                  disableCenter: true,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  scrollPhysics: BouncingScrollPhysics(),
                  // enlargeStrategy: CenterPageEnlargeStrategy.scale,
                  height: 150,
                  // aspectRatio: 1.5,
                  viewportFraction: 0.36),
              items: [
                for (int i = 0; i < categories.length; i++)
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(createRoute(Detail(product: categories[i])));
                    },
                    child: Container(
                      height: 50,
                      width: 120,
                      margin: EdgeInsets.all(5),
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // color: Color(0xff424242),
                          borderRadius: BorderRadius.circular(20)),
                      child: Stack(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Icon(
                          //   Icons.shopping_bag,
                          //   color: Color(0xffCB9495),
                          //   size: 50,
                          // ),
                          Align(
                            alignment: Alignment.topCenter,
                            child: SizedBox(
                                height: 100,
                                width: 100,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      categories[i]["image"],
                                      fit: BoxFit.cover,
                                      loadingBuilder: (BuildContext? context,
                                          Widget? child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null)
                                          return Center(child: child);
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                : null,
                                          ),
                                        );
                                      },
                                    ))),
                          ),
                          Align(
                            // bottom:0,
                            alignment: Alignment.bottomCenter,
                            child: Text(
                              categories[i]["name"],
                              style: TextStyle(
                                  // backgroundColor: Colors.white24,
                                  // color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Products',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(createRoute(AllProductsGrid(
                    products: tShirt,
                  )));
                },
                child: Text(
                  'See all',
                  style: TextStyle(
                      color: Color(0xffC8848E),
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 150,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tShirt.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(createRoute(Detail(
                        product: tShirt[index],
                      )));
                    },
                    child: Hero(
                      tag: tShirt[index]["image"],
                      child: Container(
                        height: 150,
                        width: 130,
                        margin: EdgeInsets.all(5),
                        // padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            // color: Color(0xff424242),
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                                image: NetworkImage(tShirt[index]["image"]),
                                fit: BoxFit.cover)),
                        child: productNameAndPrice(
                            name: tShirt[index]["name"].toString(),
                            price: tShirt[index]["price"].toString()),
                        // child: ClipRRect(
                        //   borderRadius: BorderRadius.circular(20),
                        //   child: Image.network(
                        //     tShirt[index]["image"],
                        //     fit: BoxFit.cover,
                        //     loadingBuilder: (BuildContext? context,
                        //         Widget? child,
                        //         ImageChunkEvent? loadingProgress) {
                        //       if (loadingProgress == null)
                        //         return Center(child: child);
                        //       return Center(
                        //         child: CircularProgressIndicator(
                        //           value: loadingProgress.expectedTotalBytes !=
                        //                   null
                        //               ? loadingProgress.cumulativeBytesLoaded /
                        //                   loadingProgress.expectedTotalBytes!
                        //               : null,
                        //         ),
                        //       );
                        //     },
                        //   ),
                        // ),
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }

// Route _createRoute(Widget widget) {
//   return PageRouteBuilder(
//     barrierColor: Colors.white,
//     // barrierColor: Color(0xffFFA958),
//     transitionDuration: Duration(milliseconds: 1500),
//     pageBuilder: (context, animation, secondaryAnimation) => widget,
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       var begin = Offset(1.0, 0.0);
//       var end = Offset.zero;
//       var curve = Curves.ease;
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
