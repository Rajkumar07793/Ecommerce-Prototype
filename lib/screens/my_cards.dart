// @dart=2.12

import 'package:ecommerce/utils/index.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';

class MyCards extends StatefulWidget {
  const MyCards({Key? key}) : super(key: key);

  @override
  _MyCardsState createState() => _MyCardsState();
}

class _MyCardsState extends State<MyCards> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isBackView = false;
  String cardNumber = "5254258641479444";
  String expiryDate = "12/24";
  // bool isCvvFocused = false;
  String cardHolderName = "John Doe";
  String cvvCode = "123";

  @override
  Widget build(BuildContext context) {
    var data = context.watch<ProductModel>();
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: backButton(context, margin: 8),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Your Cards",
                style: TextStyle(
                  color: Color(0xff2C365A),
                  fontWeight: FontWeight.w600,
                  fontSize: 22,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // Container(
              //   height: 200,
              //   decoration: BoxDecoration(
              //     color: Color(0xff2C365A),
              //     borderRadius: BorderRadius.circular(20),
              //   ),
              //   child: Row(
              //     children: [],
              //   ),
              // ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isBackView = !isBackView;
                  });
                },
                // alignment: Alignment.center,
                // transform: Matrix4.identity()..rotateX(pi),
                child: CreditCardWidget(
                  // cardBgColor: Colors.red,
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  showBackView: isBackView,
                  onCreditCardWidgetChange: (creditCardBrand) {},
                ),
              ),
              CreditCardForm(
                onCreditCardModelChange: (model) {
                  setState(() {
                    cardNumber = model.cardNumber;
                    expiryDate = model.expiryDate;
                    cvvCode = model.cvvCode;
                    cardHolderName = model.cardHolderName;
                    isBackView = model.isCvvFocused;
                    print("CVV focused " + isBackView.toString());
                  });
                },
                cardHolderName: '',
                cardNumber: cardNumber,
                cvvCode: cvvCode,
                expiryDate: expiryDate,
                formKey: formKey,
                themeColor: Colors.indigo[900]!,
              ),
              SizedBox(
                height: 10,
              ),
              payButton(
                onTap: () {
                  Navigator.of(context).pushReplacement(
                    createRoute(
                      Success(),
                    ),
                  );
                  var _order =
                      Provider.of<OrderedModel>(context, listen: false);
                  _order.addOrder(data.cart, data.sum, context);
                  // _order.products.clear();
                  data.cart.clear();
                  data.sum = 0;
                },
                align: MainAxisAlignment.center,
                margin: 10,
                padding: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
