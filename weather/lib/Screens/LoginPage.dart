import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather/Screens/Homepage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoading = false;
  loginToHome() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setInt('loginin', 1);
    Navigator.pop(context);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => HomePage()));
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "Weather",
              style: GoogleFonts.roboto(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                  fontStyle: FontStyle.italic),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              // controller: txtApartmentRvillaName,
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: 16,
              ),
              decoration: InputDecoration(
                  border: new OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.teal)),
                  contentPadding: EdgeInsets.only(left: 10),
                  labelStyle: GoogleFonts.montserrat(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 16,
                  ),
                  labelText: "Enter Email"),
              textCapitalization: TextCapitalization.words,
              keyboardType: TextInputType.emailAddress,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              // controller: txtApartmentRvillaName,
              style: GoogleFonts.montserrat(
                color: Colors.black,
                fontWeight: FontWeight.w300,
                fontSize: 16,
              ),
              decoration: InputDecoration(
                border: new OutlineInputBorder(
                    borderSide: new BorderSide(color: Colors.teal)),
                contentPadding: EdgeInsets.only(left: 10),
                prefixStyle: GoogleFonts.montserrat(color: Colors.black),
                labelStyle: GoogleFonts.montserrat(
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
                labelText: 'Enter Password',
              ),
              obscureText: true,
              textCapitalization: TextCapitalization.words,
            ),
          ),
          Center(
              child: !isLoading
                  ? TextButton(
                      onPressed: () {
                        setState(() {
                          isLoading = true;
                        });
                        Future.delayed(Duration(milliseconds: 2000))
                            .then((value) {
                          loginToHome();
                        });
                      },
                      child: Text(
                        'Login',
                        style: GoogleFonts.montserrat(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ))
                  : CircularProgressIndicator())
        ],
      )),
    );
  }
}
