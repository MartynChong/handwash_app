import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_gifimage/flutter_gifimage.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:handwashapp/Credits.dart';
import 'package:handwashapp/infopage.dart';
import 'package:handwashapp/tutorialpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Color myHexColor = Color(0xff46BFD1);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/' : (context) => HomeScreen(),
        'Info' : (context) => InfoPage(),
        'Tutorial' : (context) => TutorialPage(),
        'CreditsPage' : (context) => CreditsPage(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        accentColor: myHexColor,
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();


}

class _HomeScreenState extends State<HomeScreen>
    with TickerProviderStateMixin {
  AnimationController controller;
  GifController _animationCtrl;

  Color myHexColor = Color(0xff46BFD1);
  int gifNumber = 0;
  int songNumber = 0;
  double maxNumber = 199;
  int durationNumber = 20000;

  List<String> songs = [
    "flutter_assets/clap_pop.mp3",
    "flutter_assets/elevator_jazz.mp3",
    "flutter_assets/electrical.mp3",
    "flutter_assets/cheerful_piano.mp3"
  ];


  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState.openDrawer();
  }
  void _closeDrawer() {
    Navigator.of(context).pop();
  }

  final assetsAudioPlayer = AssetsAudioPlayer();

  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60)
        .toString()
        .padLeft(2, '0')}';
  }



  @override
  void initState() {
    super.initState();
    _animationCtrl = new GifController(vsync: this,
        duration: new Duration(milliseconds: 1200));
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20),
    );
  }


  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          title: MaterialButton(
            minWidth: 10,
            height: 60,
            onPressed: () {
                _openDrawer();
                controller.reset();
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 25,
                  height: 2,
                  color: myHexColor,
                ),
                SizedBox(height:7),
                Container(
                  width: 35,
                  height: 2,
                  color: myHexColor,
                ),
                SizedBox(height:7),
                Container(
                  width: 17,
                  height: 2,
                  color: myHexColor,
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Row(
              children: <Widget>[
                MaterialButton(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(0, 3, 0, 0),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white,
                        border: Border.all(
                            width: 5,
                            color: myHexColor,
                        )
                    ),
                    child: Icon(Icons.music_note,color: myHexColor,),
                  ),
                  onPressed: () {
                    controller.reset();
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => Container(
                          decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: new BorderRadius.only(
                                  topLeft: const Radius.circular(20.0),
                                  topRight: const Radius.circular(20.0))),
                          child: Container( //WholeChoiceMenu
                            child: ChoiceMenu(
                              menu: 0,
                              title: "Music",
                              chooseSong: chooseSong,

                            ),
                          ),
                        ));
                  }
                ),
                MaterialButton(
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      padding: EdgeInsets.fromLTRB(0,0,0,0),
                      child: Icon(Icons.info_outline,color: myHexColor,size: 60),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, 'CreditsPage');
                      controller.reset();
                    }
                ),
              ],


            ),
          ],
        ),
      ),
      body: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            return Stack(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 35, 0, 0),
                      child: Text(
                        "Let's wash our hands!",
                        style: TextStyle(
                          color: myHexColor,
                          fontFamily: 'OpenSans',
                          fontSize: MediaQuery.of(context).size.width * 0.06
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(80.0, 100, 80.0, 0),
                  //Affects Circle Size
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Align(
                        alignment: FractionalOffset.center,
                        child: AspectRatio(
                          aspectRatio: 1.0,
                          child: Stack(
                            children: <Widget>[
                              Positioned.fill(
                                child: CustomPaint(
                                    painter: CustomTimerPainter(
                                      animation: controller,
                                      backgroundColor: Colors.grey[200],
                                      color: themeData.indicatorColor,
                                    )),
                              ),
                              Align(
                                alignment: FractionalOffset.center,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment:
                                  CrossAxisAlignment.center,
                                  children: <Widget>[

                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ClipRRect(
                                          borderRadius: BorderRadius.circular(160.0),
                                          child:  GifImage(
                                            image: new AssetImage("lib/AssetImage/gifs/hand_washing.gif"),
                                            controller: _animationCtrl,
                                          ),
                                      ),
                                    ),// Affects circle interior

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        timerString,
                        style: TextStyle(
                            fontFamily: 'Montserrat',
                            fontSize: 70.0,
                            color: myHexColor),
                      ),
                      SizedBox(height: 20.0),
                      AnimatedBuilder(
                          animation: controller,
                          builder: (context, child) {
                            return FloatingActionButton.extended(
                                onPressed: () {
                                  if (controller.isAnimating) {
                                    controller.reset();
                                    // Info: Make gif controller also reset
                                    _animationCtrl.reset();

                                  }
                                  else {
                                    playSongAndGif();
                                    controller.reverse(
                                        from: controller.value == 0.0
                                            ? 1.0
                                            : controller.value);
                                    }
                                    },
                                label: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 0),
                                  child: Text(
                                    controller.isAnimating ? "Reset" : "Start",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Montserrat',
                                      fontSize: 25.0,
                                    ),
                                  ),
                                ),
                            );
                          }),
                    ],
                  ),
                ),
              ],
            );
          }),
      drawer: Container(
      width: 200,
      child: Drawer(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Flexible(
                  flex: 2,
                  child: SizedBox(height:60)),
              Flexible(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10,5,10,0),
                  margin: EdgeInsets.fromLTRB(10,5,5,0),
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: myHexColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: Text(
                    "Hand",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 35,
                      color: myHexColor,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.fromLTRB(10,0,10,10),
                  margin: EdgeInsets.fromLTRB(10,0,5,0),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: myHexColor,
                        width: 2.0,
                      ),
                    ),
                  ),
                  child: Text(
                    "Washing",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 30,
                      color: myHexColor,
                    ),
                  ),
                ),
              ),
              Flexible(
                  flex: 1,
                  child: SizedBox(height:20)),
              Flexible(
                flex: 3,
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container( //Bullet Point
                        padding: EdgeInsets.all(8),
                        child: Text(
                          ".",
                          style: TextStyle(
                            color: myHexColor,
                            fontSize: 10,
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: myHexColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Main",
                        style: TextStyle(
                          color: myHexColor,
                          fontFamily: "OpenSans",
                          fontWeight: FontWeight.w400,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                  onPressed: () {
                    _closeDrawer();
                  },
                ),
              ),
              Flexible(
                flex: 1,
                child: SizedBox(height:8),
              ),
              Flexible(
                flex: 2,
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: 2),
                      Container( //Bullet Point
                        padding: EdgeInsets.all(5),
                        child: Text(
                          ".",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 6,
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: myHexColor,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Info",
                        style: TextStyle(
                          color: myHexColor,
                          fontFamily: "OpenSans",
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  onPressed:() {
                    Navigator.pushNamed(context, 'Info');
                  },
                ),
              ),
              Flexible(
                flex: 1,
                child: SizedBox(height:8),
              ),
              Flexible(
                flex: 2,
                child: FlatButton(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(width: 2),
                      Container( //Bullet Point
                        padding: EdgeInsets.all(5),
                        child: Text(
                          ".",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 6,
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: myHexColor,
                          ),
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Tutorial",
                        style: TextStyle(
                          color: myHexColor,
                          fontFamily: "OpenSans",
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  onPressed:() {
                    Navigator.pushNamed(context, 'Tutorial');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }

  void playSongAndGif() {
    controller.addStatusListener((AnimationStatus status)async {
      if(status == AnimationStatus.completed) {
        assetsAudioPlayer.open(
          Audio(songs[songNumber]),
        );
        assetsAudioPlayer.play();
        _animationCtrl.repeat(
          min: 0.0,
          max: maxNumber,
          reverse: true,
          period: Duration(milliseconds: durationNumber),
        );
      }
      else if (status == AnimationStatus.dismissed) {
        _animationCtrl.reset();
        controller.reset();
        assetsAudioPlayer.stop();
      }
    });

  }

  void chooseSong(itemNumber){
    songNumber = itemNumber;
  }

}

class CustomTimerPainter extends CustomPainter {
  CustomTimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.butt
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(CustomTimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}

class ChoiceMenu extends StatefulWidget {
  var chooseSong;
  var menu;
  var title;
  ChoiceMenu({
    this.chooseSong,
    this.menu,
    this.title,
  });
  @override
  _ChoiceMenuState createState() => _ChoiceMenuState(chooseSong: chooseSong, menu: menu,title: title);
}

class _ChoiceMenuState extends State<ChoiceMenu> {
  Color colorBack = Colors.transparent;
  int groupValue;
  var onSubmit;
  int songChoice;
  int gifChoice;
  double itemMax;
  int itemDuration;
  int menu;
  bool currentMenu;
  Color myHexColor = Color(0xff46BFD1);
  String title;
  Function chooseSong;

  List <String> songTitle = [
    "Pop",
    "Elevator Jazz",
    "Electronic",
    "Cheerful Piano",
  ];

  List <double> maxItem = [23,16,38,59];
  List <int> durationItem = [1000,1600,1250,4500];

  _ChoiceMenuState({
    this.menu,
    this.chooseSong,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w600,
                  color: myHexColor,
                  fontSize: 30,
                ),
              ),
            ),

          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width * 0.80,
              height: 1,
              color: myHexColor,
            ),
          ],
        ),
        Container(
          child: RadioListTile(
            groupValue: groupValue,
            title: Text(
                songTitle[0],
              style: TextStyle(
                fontFamily: 'Montserrat',
                color: (0 == groupValue) ? myHexColor:Colors.black,
                fontSize: 20,
              ),
            ),
            value: 0,
            onChanged: (int value) {
              setState(() {
                groupValue = value;
                colorBack = myHexColor;
              });
            },
          ),
        ),
        RadioListTile(
          groupValue: groupValue,
          value: 1,
          title: Text(
            songTitle[1],
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: (1 == groupValue) ? myHexColor:Colors.black,
              fontSize: 20,
            ),
          ),
          onChanged: (int value) {
            setState(() {
              groupValue = value;
            });
          },
        ),
        RadioListTile(
          groupValue: groupValue,
          value:2,
          title: Text(
            songTitle[2],
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: (2 == groupValue) ? myHexColor:Colors.black,
              fontSize: 20,
            ),
          ),
          onChanged: (int value) {
            setState(() {
              groupValue = value;
            });
          },
        ),
        RadioListTile(
          groupValue: groupValue,
          value:3,
          activeColor: myHexColor,
          title: Text(
            songTitle[3],
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: (3 == groupValue) ? myHexColor:Colors.black,
              fontSize: 20,
            ),
          ),
          onChanged: (int value) {
            setState(() {
              groupValue = value;
            });
          },
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: myHexColor,
              onPressed: () {
                      songChoice = groupValue;
                      chooseSong(songChoice);
                      Navigator.pop(context);
              },
              child: Text(
                'CONFIRM',
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
      ],
    );
  }
}


