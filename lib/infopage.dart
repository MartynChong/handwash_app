import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: InfoPage(title: 'Flutter Demo Home Page'),
    );
  }
}

class InfoPage extends StatefulWidget {
  InfoPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage>
    with TickerProviderStateMixin {
  GifController _animationCtrl ;
  Color myHexColor = Color(0xff46BFD1);

  @override
  void initState() {
    super.initState();
    _animationCtrl = new GifController(vsync: this,
        duration: new Duration(milliseconds: 1200));
    _animationCtrl.repeat(
      min: 0.0,
      max: 23.0,
      reverse: true,
      period: Duration(seconds: 1),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.white,
                onPressed: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
              pinned: false,
              expandedHeight: MediaQuery.of(context).size.height * 0.5,
              flexibleSpace: Stack(
                children: [
                  Positioned(
                      child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage("lib/AssetImage/melissa_jeanty_handwash.jpg"),
                      ),
                      top: 0,
                      left: 0,
                      right: 0,
                      bottom: 0),
                  Positioned(
                    child: Container(
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30),
                        ),
                      ),
                    ),
                    bottom: -1,
                    left: 0,
                    right: 0,
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate( [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 5),
                  child: Text(
                    'The Importance of',
                    style: TextStyle(
                      color: myHexColor,
                      fontSize: MediaQuery.of(context).size.width * 0.08,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30,5,22,15),
                  child: Text(
                    'Hand Washing',
                    style: TextStyle(
                      color: myHexColor,
                      fontSize: 35,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 1,
                      color: myHexColor,
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                  child: Text(
                    'Why do we need to wash our hands?',
                    style: TextStyle(
                      color: myHexColor,
                      fontSize: 22,
                      fontFamily: 'Lato',
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                      child: Text(
                        'Respiratory viruses like coronavirus disease (COVID-19) spread when mucus or droplets containing the virus get into your body through your eyes, nose or throat. Most often, this happens through your hands. Hands are also one of the most common ways that the virus spreads from one person to the next.',
                        style: TextStyle(
                          color: myHexColor,
                          fontSize: 18,
                          fontFamily: 'Lato',
                          height: 1.5,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                      child: Text(
                        'During a global pandemic, one of the cheapest, easiest, and most important ways to prevent the spread of a virus is to wash your hands frequently with soap and water.',
                        style: TextStyle(
                          color: myHexColor,
                          fontSize: 18,
                          fontFamily: 'Lato',
                          height: 1.5,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal:0,vertical:30),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(40.0),
                        child: Image(
                          image: AssetImage('lib/AssetImage/sneeze.jpg'),
                          width: MediaQuery.of(context).size.width * 0.8,
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(30, 30,30,10),
                  child: Text(
                    'When do we need to wash our hands?',
                    style: TextStyle(
                      color: myHexColor,
                      fontSize: 22,
                      fontFamily: 'Lato',
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(35, 10, 40, 15),
                        child: Text(
                          'In general, you should always wash your hands at the following times:',
                          style: TextStyle(
                            color: myHexColor,
                            fontSize: 18,
                            fontFamily: 'Lato',
                            height: 1.5,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 1),
                        child: Text(
                          '• After using the toilet',
                          style: TextStyle(
                            color: myHexColor,
                            fontSize: 18,
                            fontFamily: 'Lato',
                            height: 1.5,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 1),
                        child: Text(
                          '• Before and after eating',
                          style: TextStyle(
                            color: myHexColor,
                            fontSize: 18,
                            fontFamily: 'Lato',
                            height: 1.5,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 1),
                        child: Text(
                          '• After handling garbage',
                          style: TextStyle(
                            color: myHexColor,
                            fontSize: 18,
                            fontFamily: 'Lato',
                            height: 1.5,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 1),
                        child: Text(
                          '• After touching animals and pets',
                          style: TextStyle(
                            color: myHexColor,
                            fontSize: 18,
                            fontFamily: 'Lato',
                            height: 1.5,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 1),
                        child: Text(
                          "• After changing babies' diapers or ",
                          style: TextStyle(
                            color: myHexColor,
                            fontSize: 18,
                            fontFamily: 'Lato',
                            height: 1.5,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 48,vertical: 1),
                        child: Text(
                          " helping children use the toilet",
                          style: TextStyle(
                            color: myHexColor,
                            fontSize: 18,
                            fontFamily: 'Lato',
                            height: 1.5,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 1),
                        child: Text(
                          "• Before and after eating",
                          style: TextStyle(
                            color: myHexColor,
                            fontSize: 18,
                            fontFamily: 'Lato',
                            height: 1.5,
                          ),
                        ),
                      ),
                    ]
                ),
                SizedBox(height:30),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 25,vertical: 0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 10, 20, 15),
                        child: Text(
                          'In the context of COVID-19 prevention, you should also wash at these times:',
                          style: TextStyle(
                            color: myHexColor,
                            fontSize: 18,
                            fontFamily: 'Lato',
                            height: 1.5,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 1),
                        child: Text(
                          '• After blowing your nose, coughing or sneezing',
                          style: TextStyle(
                            color: myHexColor,
                            fontSize: 18,
                            fontFamily: 'Lato',
                            height: 1.5,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 1),
                        child: Text(
                          '• After visiting a public space, including public transportation, markets and places of worship',
                          style: TextStyle(
                            color: myHexColor,
                            fontSize: 18,
                            fontFamily: 'Lato',
                            height: 1.5,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 1),
                        child: Text(
                          '• After touching surfaces outside of the home, including money',
                          style: TextStyle(
                            color: myHexColor,
                            fontSize: 18,
                            fontFamily: 'Lato',
                            height: 1.5,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 1),
                        child: Text(
                          '• Before, during and after caring for a sick person',
                          style: TextStyle(
                            color: myHexColor,
                            fontSize: 18,
                            fontFamily: 'Lato',
                            height: 1.5,
                          ),
                        ),
                      ),
                      SizedBox(height:20),
                    ],
                  ),
                ),
                Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.fromLTRB(20,20,20,30),
                          child: Text(
                            'Stay Safe!',
                            style: TextStyle(
                              fontFamily: 'Lato',
                              fontSize: 15,
                              color: myHexColor,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ]
                  ),
                ),
              ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
