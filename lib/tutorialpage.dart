import 'package:flutter/material.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';

class TutorialPage extends StatefulWidget {
  @override
  _TutorialPageState createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage>
    with TickerProviderStateMixin {
  GifController _animationCtrl ;

  PageController _pageController;

  Color myHexColor = Color(0xff46BFD1);


  @override
  void initState() {
    super.initState();
    _animationCtrl = new GifController(vsync: this,
        duration: new Duration(milliseconds: 3480));
    _animationCtrl.repeat(
      min: 0.0,
      max: 8.0,
      reverse: false,
      period: Duration(milliseconds: 600),
    );
    _pageController = PageController();
  }


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageView(
          controller: _pageController,
          children: [
            Scaffold(
              body: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width * 0.03, vertical: MediaQuery.of(context).size.height * 0.06),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back_ios),
                          color: myHexColor,
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
                          },
                        ),
                      ),
                    ],
                  ),
                  CircleAvatar(
                    radius: MediaQuery.of(context).size.width * 0.312,
                    backgroundColor: Colors.black,
                    child: CircleAvatar(
                      radius: MediaQuery.of(context).size.width * 0.31,
                      child: ClipOval(
                        child: Image(
                          image: AssetImage('lib/AssetImage/dirty_hands.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 35, 0, 20),
                    child: Text(
                      'How do I wash my hands?',
                      style: TextStyle(
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600,
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.65,
                        height: 1,
                        color: Colors.black,
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                        child: Text(
                          'The step-by-step tutorial to',
                          style: TextStyle(
                            color:Colors.grey[700],
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w600,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 0, 0, 35),
                        child: Text(
                          'washing your hands properly',
                          style: TextStyle(
                            color: Colors.grey[700],
                            fontFamily: 'OpenSans',
                            fontWeight: FontWeight.w600,
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                          ),
                        ),
                      ),
                    ],
                  ),
                  RaisedButton(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    onPressed: () {
                      if (_pageController.hasClients) {
                        _pageController.animateToPage(
                          1,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: myHexColor,
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'OpenSans',
                        fontWeight: FontWeight.w600,
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            pageCreate(
              pageNumber: 1,
              image: 'lib/AssetImage/tutorial/hand1.png'
            ),
            pageCreate(
              pageNumber: 2,
                image: 'lib/AssetImage/tutorial/hand2.png'
            ),
            pageCreate(
              pageNumber: 3,
                image: 'lib/AssetImage/tutorial/hand3.png'
            ),
            pageCreate(
              pageNumber: 4,
                image: 'lib/AssetImage/tutorial/hand4.png'
            ),
            pageCreate(
              pageNumber: 5,
                image: 'lib/AssetImage/tutorial/hand5.png'
            ),
            pageCreate(
              pageNumber: 6,
                image: 'lib/AssetImage/tutorial/hand1.png'
            ),
            pageCreate(
              pageNumber: 7,
                image: 'lib/AssetImage/tutorial/hand7.png'
            ),
            Scaffold(
              body:Column(
            children: <Widget>[

            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: MediaQuery
                      .of(context)
                      .size
                      .width * 0.03, vertical: MediaQuery
                      .of(context)
                      .size
                      .height * 0.06),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: myHexColor,
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                  ),
                ),
              ],
            ),
              CircleAvatar(
                radius: MediaQuery
                    .of(context)
                    .size
                    .width * 0.3115,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: MediaQuery
                      .of(context)
                      .size
                      .width * 0.31,
                  child: ClipOval(
                    child: Image(
                      image: AssetImage('lib/AssetImage/grandma.jpg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),

            Container(
              margin: EdgeInsets.fromLTRB(0, 35, 0, 20),
              child: Text(
                'Congratulations!',
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery
                      .of(context)
                      .size
                      .width * 0.06,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.65,
                  height: 1,
                  color: Colors.black,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Text(
                    "You've completed the tutorial.",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery
                          .of(context)
                          .size
                          .width * 0.04,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
                  child: Text(
                    "Now let's wash our hands!",
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Row(
                    children: <Widget>[
                      for (var i = 1; i < 8; i++)
                        Container(
                            margin: EdgeInsets.all(7.5),
                            child: CircleAvatar(
                            backgroundColor: Colors.grey[400],
                            radius: 6
                        ),
                      ),
                        Container(
                          margin: EdgeInsets.all(7.5),
                          child: CircleAvatar(
                          backgroundColor: myHexColor,
                          radius: 6
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),

    ]
            ),
    ),

          ],
        ),
      ),
    );

  }
}


class pageCreate extends StatelessWidget {
  int pageNumber;
  int i;
  String image;
  List<String> tutorialList1 = [
    "Wet your hands with warm or",
    'Lather your hands with soap',
    'Rub the back of your hands',
    'Rub the soap between',
    'Rub and clean under your',
    'Rinse your hand under',
    'Dry thoroughly with a dry and',
  ];

  List<String> tutorialList2 = [
    'cold running water',
    'and rub your palms together',
    'together',
    'your fingers',
    'nails (preferably with a brush)',
    'running water',
    'clean towel',
  ];
  Color myHexColor = Color(0xff46BFD1);

  pageCreate({
    this.pageNumber,
    this.image,
  });

  Widget createCircles() {
    return Row(
      children: <Widget>[
      for (i = 1; i < 9; i++)
        circle(),
      ]
    );
  }

  Widget circle() {
    if (pageNumber == i) {
      return Container(
        margin: EdgeInsets.all(7.5),
        child: CircleAvatar(
            backgroundColor: myHexColor,
            radius: 6
        ),
      );
    }
    else {
      return Container(
        margin: EdgeInsets.all(7.5),
        child: CircleAvatar(
            backgroundColor: Colors.grey[400],
            radius: 6
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(horizontal: MediaQuery
                      .of(context)
                      .size
                      .width * 0.03, vertical: MediaQuery
                      .of(context)
                      .size
                      .height * 0.06),
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: myHexColor,
                    onPressed: () {
                      Navigator.pushNamed(context, '/');
                    },
                  ),
                ),
              ],
            ),
            CircleAvatar(
              radius: MediaQuery
                  .of(context)
                  .size
                  .width * 0.3115,
              backgroundColor: Colors.black,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: MediaQuery
                    .of(context)
                    .size
                    .width * 0.31,
                child: ClipOval(
                  child: Image(
                    image: AssetImage(image),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(0, 35, 0, 20),
              child: Text(
                'Step $pageNumber',
                style: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                  fontSize: MediaQuery
                      .of(context)
                      .size
                      .width * 0.06,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width * 0.65,
                  height: 1,
                  color: Colors.black,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 0),
                  child: Text(
                    tutorialList1[pageNumber-1],
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery
                          .of(context)
                          .size
                          .width * 0.04,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(0, 0, 0, 50),
                  child: Text(
                    tutorialList2[pageNumber-1],
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontFamily: 'OpenSans',
                      fontWeight: FontWeight.w600,
                      fontSize: MediaQuery.of(context).size.width * 0.04,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: createCircles(
                  ),
                ),
              ],
            ),
          ],
        ),
      );
  }
}

