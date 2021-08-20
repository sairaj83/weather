import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CurrentLocationAnim extends StatefulWidget {
  @override
  _CurrentLocationAnimState createState() => _CurrentLocationAnimState();
}

class _CurrentLocationAnimState extends State<CurrentLocationAnim> {
  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade400,
                  highlightColor: Colors.white,
                  child: Container(
                    color: Colors.white,
                    height: 40,
                    width: MediaQuery.of(context).size.height * 0.25,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade400,
                  highlightColor: Colors.white,
                  child: Container(
                    color: Colors.white,
                    height: 30,
                    width: MediaQuery.of(context).size.height * 0.25,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Shimmer.fromColors(
                  baseColor: Colors.grey.shade400,
                  highlightColor: Colors.white,
                  child: Container(
                    color: Colors.white,
                    height: 25,
                    width: MediaQuery.of(context).size.height * 0.25,
                  ),
                ),
              ],
            ),
            Shimmer.fromColors(
              baseColor: Colors.grey.shade400,
              highlightColor: Colors.white,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                height: 100,
                width: MediaQuery.of(context).size.height * 0.15,
              ),
            )
          ],
        ),

//Temperature
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 0.5,
              width: MediaQuery.of(context).size.height * 0.30,
              color: Colors.black,
            ),
            Text('Temperature')
          ],
        ),

        Column(
          children: [
            Row(
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
                    width: MediaQuery.of(context).size.height * 0.20,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
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
                    width: MediaQuery.of(context).size.height * 0.20,
                  ),
                ),
              ],
            )
          ],
        ),

        SizedBox(
          height: 5,
        ),
        //Pressure,Humidity
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 0.5,
              width: MediaQuery.of(context).size.height * 0.45,
              color: Colors.black,
            ),
          ],
        ),

        SizedBox(
          height: 5,
        ),
        Row(
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
                width: MediaQuery.of(context).size.height * 0.20,
              ),
            ),
          ],
        ),

        SizedBox(
          height: 5,
        ),

        //Levels
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 0.5,
              width: MediaQuery.of(context).size.height * 0.35,
              color: Colors.black,
            ),
            Text('Levels')
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
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
                width: MediaQuery.of(context).size.height * 0.20,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),

        //Wind
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Wind'),
            Container(
              height: 0.5,
              width: MediaQuery.of(context).size.height * 0.35,
              color: Colors.black,
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
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
                width: MediaQuery.of(context).size.height * 0.20,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        //Day light
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Day Light'),
            Container(
              height: 0.5,
              width: MediaQuery.of(context).size.height * 0.35,
              color: Colors.black,
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        Row(
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
                width: MediaQuery.of(context).size.height * 0.20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
