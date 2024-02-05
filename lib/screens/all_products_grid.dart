import 'package:ecommerce/utils/index.dart';

import 'components/product_name_and_price.dart';

class AllProductsGrid extends StatelessWidget {
  final List? products;
  const AllProductsGrid({Key? key, this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: products!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context)
                        .push(createRoute(Detail(product: products![index])));
                  },
                  child: Hero(
                    tag: products![index]["image"],
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
                              image: NetworkImage(products![index]["image"]),
                              fit: BoxFit.cover),
                        ),
                        child: productNameAndPrice(
                            name: products![index]["name"].toString(),
                            price: products![index]["price"].toString())),
                  ),
                );
              }),
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
