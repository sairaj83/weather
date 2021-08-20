import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ListLocAnim extends StatefulWidget {
  @override
  _ListLocAnimState createState() => _ListLocAnimState();
}

class _ListLocAnimState extends State<ListLocAnim> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 35,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Shimmer.fromColors(
              baseColor: Colors.grey.shade400,
              highlightColor: Colors.white,
              child: Container(
                color: Colors.white,
                height: 25,
                width: MediaQuery.of(context).size.height * 0.20,
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade400,
              highlightColor: Colors.white,
              child: Container(
                color: Colors.white,
                height: 25,
                width: MediaQuery.of(context).size.height * 0.10,
              ),
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade400,
              highlightColor: Colors.white,
              child: Container(
                color: Colors.white,
                height: 25,
                width: MediaQuery.of(context).size.height * 0.10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
