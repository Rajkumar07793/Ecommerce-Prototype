import 'package:ecommerce/utils/index.dart';
import 'package:flutter/cupertino.dart';

class Help extends StatelessWidget {
  const Help({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        centerTitle: true,
        elevation: 0,
        leading: backButton(context, margin: 8),
        // title: Text(
        //   'Help Center',
        //   style: TextStyle(color: Colors.black),
        // ),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Text(
            "How can we help you?",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 25,
                color: Color(0xff28283D)),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 10,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            elevation: 50,
            margin: const EdgeInsets.all(20.0),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Start typing to search...",
                  hintStyle: TextStyle(fontSize: 20),
                  prefix: SizedBox(
                    width: 30,
                  ),
                  suffixIcon: Container(
                      decoration: BoxDecoration(
                          color: Color(0xffF9DE7C), shape: BoxShape.circle),
                      child: Icon(Icons.search)),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Or choose an option so that we can help you.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Colors.black45,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.menu_book_rounded,
                  size: 50,
                  color: Color(0xff59CFA4),
                ),
                Text(
                  "Guides",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.question_answer_outlined,
                  size: 50,
                  color: Color(0xff59CFA4),
                ),
                Text(
                  "FAQ",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.connect_without_contact_rounded,
                  size: 50,
                  color: Color(0xff59CFA4),
                ),
                Text(
                  "Community",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
