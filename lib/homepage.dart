import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:responsive_ui/videoScreen.dart';


class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,

        child: Stack(
          children: <Widget>[
            //make curves for desgining

            ClipPath(
              child: Container(
                color: Colors.blue[400],
                height: 140,
                width: screenSize.width,
              ),
              clipper: WaveClipperOne(),
            ),

            ClipPath(
              child: Container(
                color: Colors.blue[600],
                height: 120,
                width: screenSize.width,
              ),
              clipper: WaveClipperTwo(),
            ),

            //curves for bottom
            Positioned(
              child: ClipPath(
                child: Container(
                  color: Colors.blue[400],
                  height: 80,
                  width: screenSize.width,
                ),
                clipper: WaveClipperOne(reverse: true),
              ),
              bottom: 0,
              left: 0,
            ),
            Positioned(
              child: ClipPath(
                child: Container(
                  color: Colors.blue[600],
                  height: 90,
                  width: screenSize.width,
                ),
                clipper: WaveClipperTwo(reverse: true),
              ),
              bottom: 0,
              left: 0,
            ),

            //lets make content
            //lets first make content for small screens that is less than 580

            screenSize.width < 580 ?
            Container(
              //for small
              width: screenSize.width,
              height: screenSize.height,
              child: Column(
                children: <Widget>[
                  //Lets make container for picture

                  Container(
                    margin: EdgeInsets.only(top: 64),
                    height: 240,
                    child: Image.asset("assets/web.png", fit: BoxFit.contain,),
                  ),

                  SizedBox(height: 16,),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 64),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Bhumika Chaplot", style: TextStyle(fontSize: kIsWeb ? 64 : 32, fontWeight: FontWeight.w700, color: Colors.lightBlue),),
                          SizedBox(height: 8,),
                          Text("Hey!!! Here is Your trainer Bhumika Chaplot "
                              "Lets make it Large together", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, letterSpacing: 1.0, color: Colors.grey[800]),),
                          SizedBox(height: 16,),

                          TextButton.icon(
                            onPressed: (){
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => VideoScreen()
                              ));
                            },
                            icon: Icon(Icons.video_library),
                            label: Text("See all Videos"),

                          )
                        ],
                      ),
                    ),
                  )


                ],
              ),

            ) :

            Container(
              //for large screens
              height: screenSize.height,
              width: screenSize.width,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 64),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                Text("Bhumika Chaplot", style: TextStyle(fontSize: 64, fontWeight: FontWeight.w700, color: Colors.lightBlue),),
                                SizedBox(height: 8,),
                                Text("Hey!!! Here is Your trainer Bhumika Chaplot "
                                    "Lets make it Large together", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, letterSpacing: 1.0, color: Colors.grey[800]),),
                                SizedBox(height: 16,),

                                TextButton.icon(
                                  onPressed: (){

                                  },
                                  icon: Icon(Icons.video_library),
                                  label: Text("See all Videos"),

                                  ),

                              ],
                            ),
                          ),
                        ),

                        Expanded(
                          child: Container(
                            child: Image.asset("assets/web.png", fit: BoxFit.contain,),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )



          ],
        ),

      ),
    );
  }
}
