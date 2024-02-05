import 'package:ecommerce/utils/index.dart';
import 'package:flutter/services.dart';

class AddressBook extends StatefulWidget {
  const AddressBook({Key? key}) : super(key: key);

  @override
  _AddressBookState createState() => _AddressBookState();
}

class _AddressBookState extends State<AddressBook> {
  String? selectedAddress;
  @override
  Widget build(BuildContext context) {
    List address = [
      {
        "title": "Home",
        "address":
            "Aaron Hawkins 5587 Nunc. Avenue Erie Rhode Island 24975 (660) 663-4518"
      },
      {
        "title": "Office",
        "address":
            "Melvin Porter P.O. Box 132 1599 Curabitur Rd. Bandera South Dakota 45149 (959) 119-8364"
      },
    ];
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        leading: backButton(context, margin: 8),
      ),
      // bottomSheet: Container(
      //   color: Colors.white,
      //   height: 200,
      //   width: 400,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              "Where do you want",
              style: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w500,
                  fontSize: 16),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Select your address.",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: FloatingActionButton(
                backgroundColor: Color(0xffF6C36E),
                onPressed: () {
                  // bottomSheet(context);
                  Navigator.of(context).push(createRoute(AddAddress()));
                },
                child: Icon(Icons.add),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: address.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedAddress = address[index]["title"];
                      });
                    },
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Radio<String>(
                            value: address[index]["title"],
                            groupValue: selectedAddress,
                            onChanged: (value) {
                              setState(() {
                                selectedAddress = value;
                              });
                            }),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                address[index]["title"],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                address[index]["address"],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black54,
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}

class AddAddress extends StatefulWidget {
  const AddAddress({Key? key}) : super(key: key);

  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  String? dropdownValue = 'Home';
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        leading: backButton(context, margin: 8),
        centerTitle: true,
        title: Text(
          "Address Form",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
        // mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Address Type"),
                SizedBox(
                  width: 50,
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: const Icon(Icons.arrow_drop_down),
                  iconSize: 24,
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['Home', 'Office', 'Work', 'Other']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter Home/Apartment no.",
                labelText: "Home/Apartment",
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter Street",
                labelText: "Street",
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter City",
                labelText: "City",
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter Pincode",
                labelText: "Pincode",
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter District",
                labelText: "District",
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter State",
                labelText: "State",
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter Country",
                labelText: "Country",
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: TextFormField(
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Enter Phone number",
                labelText: "Phone",
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("Add Address"),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Color(0xff0000ff))),
          ),
        ],
      ),
    );
  }
}
//
// bottomSheet(context) {
//   Size size = MediaQuery.of(context).size;
//   return showModalBottomSheet(
//       isScrollControlled: true,
//       shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
//       context: context,
//       builder: (context) {
//         return Padding(
//           padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
//           child: SizedBox(
//             height: size.height / 1.2,
//             child: ListView(
//               // mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Container(
//                   height: 2,
//                   width: 50,
//                   color: Colors.black54,
//                   margin: EdgeInsets.symmetric(horizontal: size.width / 3),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(10),
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                   decoration: BoxDecoration(
//                     color: Colors.grey.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: "Enter Home",
//                       labelText: "Home/Apartment",
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(10),
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                   decoration: BoxDecoration(
//                     color: Colors.grey.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: "Enter Street",
//                       labelText: "Street",
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(10),
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                   decoration: BoxDecoration(
//                     color: Colors.grey.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: "Enter City",
//                       labelText: "City",
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(10),
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                   decoration: BoxDecoration(
//                     color: Colors.grey.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: TextFormField(
//                     keyboardType: TextInputType.number,
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: "Enter Pincode",
//                       labelText: "Pincode",
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(10),
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                   decoration: BoxDecoration(
//                     color: Colors.grey.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: "Enter District",
//                       labelText: "District",
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(10),
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                   decoration: BoxDecoration(
//                     color: Colors.grey.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: "Enter State",
//                       labelText: "State",
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(10),
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                   decoration: BoxDecoration(
//                     color: Colors.grey.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: "Enter Country",
//                       labelText: "Country",
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(10),
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                   decoration: BoxDecoration(
//                     color: Colors.grey.withOpacity(0.1),
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: TextFormField(
//                     keyboardType: TextInputType.phone,
//                     decoration: InputDecoration(
//                       border: InputBorder.none,
//                       hintText: "Enter Phone number",
//                       labelText: "Phone",
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         );
//       });
// }
