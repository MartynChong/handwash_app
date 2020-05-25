import 'package:flutter/material.dart';

class CreditsPage extends StatefulWidget {
  @override
  _CreditsPageState createState() => _CreditsPageState();
}

class _CreditsPageState extends State<CreditsPage> {
  Color myHexColor = Color(0xff46BFD1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height * 0.3),
        child: Container(
          color: myHexColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal:MediaQuery.of(context).size.width * 0.03, vertical: MediaQuery.of(context).size.height * 0.06),
                    child: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20,30,0,0),
                child: Text(
                  'Credits to:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.09,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                width: MediaQuery.of(context).size.width * 0.45,
                height: 3,
                color: Colors.white,
              ),
            ],
          ),
        ),

      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10),
              child:Text(
                '''Research and Info - 
https://www.medicalnewstoday.com/articles/proper-hand-washing#summary
https://www.unicef.org/coronavirus/covid-19
https://www.cdc.gov/handwashing/when-how-handwashing.html
                ''',
                style: TextStyle(
                  color: Colors.black45,
                  fontSize: MediaQuery.of(context).size.width * 0.04,
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                ),
              )
            ),
            Container(
                padding: EdgeInsets.all(10),
                child:Text(
                  '''Music - 
All royalty free music obtained from Bensound.''',
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                  ),
                )
            ),
            Container(
                padding: EdgeInsets.all(10),
                child:Text(
                  '''Images & Gifs- 
Hand washing Tutorial: www.medicalnewstoday.com
Washing Gif: www.motionelements.com
Icon: www.flaticon.com by Gregor Cresnar
                      ''',
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: MediaQuery.of(context).size.width * 0.04,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.w600,
                  ),
                )

            ),
          ],
        ),
      ),
    );
  }
}
