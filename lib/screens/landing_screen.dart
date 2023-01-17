import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:recipe/screens/welcome_screen.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  get w => MediaQuery.of(context).size.width;
  get h => MediaQuery.of(context).size.height;

  @override
  Widget build(BuildContext context) {
    String tData = DateFormat("HH:mm").format(DateTime.now());
    final appbar = AppBar(
      title:Text(tData),
      backgroundColor: Color.fromRGBO(246, 131, 107, 1.0),
      actions: [
        IconButton(
          icon: Image.asset('images/imagerecipe1.png'),
          onPressed: (){
            //code to execute when this button is pressed
          },
          iconSize: 40.0,
        ),
        IconButton(
          icon: Image.asset('images/batteryicon.png'),
          onPressed: (){
            //code to execute when this button is pressed
          },
          iconSize: 55.0,
        ),
      ],
    );
    return Scaffold(
      // resizeToAvoidBottomInset: false,
        appBar: appbar,
        body: SafeArea(
            child:
            SingleChildScrollView(
              child:
              Column(
                  children: <Widget>[Container(
                      width: MediaQuery.of(context).size.width,
                      height: (h- appbar.preferredSize.height)* 0.5 ,
                      // height: 345.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        //shape: BoxShape.circle,
                        border: Border.all(width:1, color: Colors.white),
                        image: DecorationImage(
                            image: AssetImage('images/background_image.png'), fit: BoxFit.cover),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // height:100.0,
                          children: [
                            Image.asset("images/chef_image.png", height: (h- appbar.preferredSize.height)* 0.4 ,),
                          ]
                      )
                  ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width,
                        height: (h - appbar.preferredSize.height) * 0.5,
                        // height: 345.0,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          // shape: BoxShape.circle,
                          border: Border.all(width:1, color: Colors.white),
                          borderRadius: BorderRadius.vertical(top: Radius.circular(50),bottom: Radius.circular(10)),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            RichText(
                              text: TextSpan(
                                children: <TextSpan>[
                                  TextSpan(
                                      text: "It's ", style: TextStyle(fontFamily: 'Muli', color: Colors.black, fontSize: 50)),
                                  TextSpan(
                                      text: 'cooking',
                                      style: TextStyle(fontFamily: 'Muli', color: Color.fromRGBO(246, 131, 107, 1.0), fontSize: 50)),
                                ],
                              ),),
                            Text("Time!",style: TextStyle(fontFamily: 'Muli', color: Colors.black, fontSize: 50)),
                            SizedBox(
                              height: 35.0,
                            ),
                            Text("Your private coach in your lovely kitchen.",style: TextStyle(fontFamily: 'Muli', color: Colors.black, fontSize:15)),

                            const Center(
                            ),
                            Expanded(
                              child: Center(
                                child: RawMaterialButton(
                                  onPressed: () {
                                    //Navigating the the welcome Screen
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => WelcomeScreen(),
                                        ));
                                  },
                                  shape: const StadiumBorder(),
                                  fillColor: Color.fromRGBO(246, 131, 107, 1.0),
                                  child: const Padding(
                                    padding:
                                    EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
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
                        )
                    )]
              ),
            )
        )
    );
  }
}
