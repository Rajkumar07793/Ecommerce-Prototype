import 'package:flutter/material.dart';

Widget productNameAndPrice({required String? name, required String? price}) =>
    Align(
      alignment: Alignment.bottomRight,
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.black54,
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                name!,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  // backgroundColor: Colors.black54,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
            ),
            Text(
              "₹" + price!,
              style: TextStyle(
                  // backgroundColor: Colors.black54,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 13),
            ),
          ],
        ),
      ),
    );
