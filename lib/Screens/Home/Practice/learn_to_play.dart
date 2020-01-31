import 'package:flutter/material.dart';
import 'package:pocket_piano/Screens/Home/Practice/Songs/WeWishUMerryXmas/we_wish_you_merry_xmas.dart';

class Practice extends StatefulWidget {
  @override
  _PracticeState createState() => _PracticeState();
}

class _PracticeState extends State<Practice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const SliverAppBar(
            backgroundColor: Color(0xff8B16FF),
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "Learn To Play",
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 26.5,
                ),
              ),
              background: Image(
                fit: BoxFit.cover,
                image: AssetImage('assets/Practice.png')
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  height: 180.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "We Wish You a Merry Christmas",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      Text(
                        "Complete: 20 %",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w400
                        )
                      ),
                      RaisedButton(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19.0),
                        ),
                        color: Color(0xff8B16FF),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Practice",
                            style: TextStyle(
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            )
                          ),
                        ),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => WeWishYouMerryXmas()),
                          );
                        },

                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  height: 180.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "We Wish You a Merry Christmas",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      Text(
                        "Complete: 20 %",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w400
                        )
                      ),
                      RaisedButton(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19.0),
                        ),
                        color: Color(0xff8B16FF),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Practice",
                            style: TextStyle(
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            )
                          ),
                        ),
                        onPressed: (){},

                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  height: 180.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "We Wish You a Merry Christmas",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      Text(
                        "Complete: 20 %",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w400
                        )
                      ),
                      RaisedButton(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19.0),
                        ),
                        color: Color(0xff8B16FF),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Practice",
                            style: TextStyle(
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            )
                          ),
                        ),
                        onPressed: (){},

                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  height: 180.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "We Wish You a Merry Christmas",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      Text(
                        "Complete: 20 %",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w400
                        )
                      ),
                      RaisedButton(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19.0),
                        ),
                        color: Color(0xff8B16FF),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Practice",
                            style: TextStyle(
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            )
                          ),
                        ),
                        onPressed: (){},

                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  height: 180.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        "We Wish You a Merry Christmas",
                        style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      Text(
                        "Complete: 20 %",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.w400
                        )
                      ),
                      RaisedButton(
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(19.0),
                        ),
                        color: Color(0xff8B16FF),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Practice",
                            style: TextStyle(
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            )
                          ),
                        ),
                        onPressed: (){},

                      )
                    ],
                  ),
                ),
              ]
            )
          )
        ],
      )
    );
  }
}