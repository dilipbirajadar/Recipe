import 'package:flutter/material.dart';
import 'package:recipe/screens/explore_screen.dart';
import 'package:recipe/screens/welcome_screen.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('12:00'),
          backgroundColor: Color.fromRGBO(246, 131, 107, 1.0),
          actions: [
            IconButton(
              icon: Image.asset('images/imagerecipe1.png'),
              onPressed: () {
                //code to execute when this button is pressed
              },
              iconSize: 40.0,
            ),
            IconButton(
              icon: Image.asset('images/batteryicon.png'),
              onPressed: () {
                //code to execute when this button is pressed
              },
              iconSize: 55.0,
            ),

            //more widgets to place here
          ],
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.5,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    //shape: BoxShape.circle,
                    border: Border.all(width: 1, color: Colors.white),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(-200),
                        bottomRight: Radius.circular(-200)),
                    image: DecorationImage(
                        image: AssetImage('images/background_image.png'),
                        fit: BoxFit.cover)),
                child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset("images/chef_image.png"),
                    ])),
            SizedBox(
              height: 20.0,
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.3,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  // shape: BoxShape.circle,
                  border: Border.all(width: 1, color: Colors.white),
                  borderRadius: BorderRadius.vertical(
                      top: Radius.circular(50), bottom: Radius.circular(10)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: "It's ",
                              style: TextStyle(
                                  fontFamily: 'Muli',
                                  color: Colors.black,
                                  fontSize: 30)),
                          TextSpan(
                              text: 'cooking',
                              style: TextStyle(
                                  fontFamily: 'Muli',
                                  color: Color.fromRGBO(246, 131, 107, 1.0),
                                  fontSize: 30)),
                        ],
                      ),
                    ),
                    // Text("It's",style: TextStyle(fontFamily: 'Muli', color: Colors.black, fontSize: 30)),
                    //  Text("cooking",style: TextStyle(fontFamily: 'Muli', color: Color.fromRGBO(246, 131, 107, 1.0), fontSize: 30)),
                    Text("Time!",
                        style: TextStyle(
                            fontFamily: 'Muli',
                            color: Colors.black,
                            fontSize: 30)),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text("Your private coach in your lovely kitchen.",
                        style: TextStyle(
                            fontFamily: 'Muli',
                            color: Colors.black,
                            fontSize: 10)),

                    const Center(),
                    SizedBox(
                      height: 30.0,
                    ),
                    Expanded(
                      child: Center(
                        child: RawMaterialButton(
                          onPressed: () {
                            //Navigating the the Quiz Screen
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ExploreScreen(),
                                ));
                          },
                          shape: const StadiumBorder(),
                          fillColor: Color.fromRGBO(246, 131, 107, 1.0),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 12.0, horizontal: 24.0),
                            child: Text(
                              "Explore the Recipes",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontFamily: 'Muli',
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
          ]),
        )));
  }
}
