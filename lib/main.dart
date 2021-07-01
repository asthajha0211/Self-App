import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vc_astha/widgets/info_item.dart';
import 'package:vc_astha/widgets/rand_joke.dart';


void main() =>
    runApp(MaterialApp(
      home: VisitingCard(),
    ));

class VisitingCard extends StatefulWidget {

  @override
  _VisitingCardState createState() => _VisitingCardState();
}

class _VisitingCardState extends State<VisitingCard> {
  JokeResponse response;

  @override
  void initState() {
    super.initState();
    getJoke().then((value) =>
    {
      if(value != null){
        setState(() {
          response = value;
        })
      }else{
        setState((){
          response= new JokeResponse(setup:'Sorry', punchline:'Joke not available!');
        })
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff16161a),
        elevation: 0,
        title: Center(
          child: Text(
            'Astha Jha',
            style: GoogleFonts.rubik(
              textStyle: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
      body: response == null ? Center(child: CircularProgressIndicator()) : Padding(
        padding: EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 82,
                  backgroundColor: Color(0xff6b4cff),
                  child: CircleAvatar(
                    radius: 80,
                    backgroundImage: AssetImage('assets/img.jpg'),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      icon: Icon(Icons.phone),
                      iconSize: 40.0,
                      color: Colors.white,
                      onPressed: () async {
                        const url = 'tel:8797322163';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      }),
                  IconButton(
                      icon: Icon(Icons.email),
                      iconSize: 40.0,
                      color: Colors.white,
                      onPressed: () async {
                        const url = 'mailto:asthajha05@gmail.com';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      }),
                  IconButton(
                      icon: Image.asset('assets/ig.png'),
                      iconSize: 35.0,
                      color: Colors.white,
                      onPressed: () async {
                        const url = 'https://www.instagram.com/astha0211/';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      }),
                  IconButton(
                      icon: Image.asset('assets/li.png'),
                      iconSize: 35.0,
                      color: Colors.white,
                      onPressed: () async {
                        const url =
                            'https://www.linkedin.com/in/astha-jha-495b221b6/';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      }),
                  IconButton(
                      icon: Image.asset('assets/gh.png'),
                      iconSize: 40.0,
                      color: Colors.white,
                      onPressed: () async {
                        const url = 'https://github.com/asthajha0211';
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      }),
                ],
              ),
              SizedBox(height: 8),
              InfoItem(
                title: 'Hobbies: ',
                bodyText: 'Badminton, Dance, Reading, Public Speaking',
              ),
              InfoItem(
                title: 'Random Joke',
                bodyText: '${response.setup}\n${response.punchline}',
              ),
              InfoItem(
                title: 'Languages: ',
                bodyText: 'HTML, CSS, Python, Dart, GW BASIC, LOGO ',
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color(0xff16161a),
    );
  }
}
