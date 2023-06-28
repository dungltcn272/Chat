import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool isPlaying =false;
  double value=0;
  bool isComplete=false;

  final player = AudioPlayer();
  Duration? duration =Duration(seconds: 0) ;


  void initPlayer() async {
    await player.setSource(AssetSource("nothingonme.mp3"));
    duration = await player.getDuration();
    player.onPlayerStateChanged.listen((PlayerState state) {
      if(state == PlayerState.completed){
        setState(() {
          isComplete=true;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    initPlayer();
  }

  @override
  void dispose(){
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 70, left: 30, right: 30, bottom: 10),
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.purple.shade800,
            Colors.deepPurple.shade900,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        )),
        child: Column(
          children: [
            Row(
              children: [
                Icon(
                  Icons.menu,
                  size: 40,
                  color: Colors.white,
                ),
                Expanded(child: Container()),
                Container(
                  padding: EdgeInsets.all(3),
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.white, width: 2)),
                  child: Container(
                    margin: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      image: DecorationImage(
                        image: AssetImage("assets/avatar.jpg"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 70,
            ),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hello Dung',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        // decoration: TextDecoration.none),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Wellcome back!!',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          // decoration: TextDecoration.none),
                        ))
                  ],
                ),
                Expanded(child: Container()),
                Icon(
                  Icons.adjust,
                  size: 30,
                  color: Colors.white,
                )
              ],
            ),
            SizedBox(
              height: 70,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      height: 180,
                      width: (MediaQuery.of(context).size.width - 80) / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFF25eae7),
                      ),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("assets/avata1.jpg"),
                            radius: 40,
                          ),
                          SizedBox(
                            height: 3,
                          ),
                          Text(
                            "Nothin' on me",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 5),
                            width: 150,
                            height: 13,
                            child: SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                  trackHeight: 2,
                                  thumbShape: const RoundSliderThumbShape(
                                    disabledThumbRadius: 2,
                                    enabledThumbRadius: 4,
                                  )),
                              child: Slider(
                                activeColor: Colors.white,
                                value: value,
                                min: 0.0,
                                max: duration!.inSeconds.toDouble(),
                                onChanged: (v) {
                                  if (v < 0) {
                                    v = 0;
                                  } else if (v > duration!.inSeconds.toDouble()) {
                                    v = duration!.inSeconds.toDouble();
                                  }
                                  value=v;
                                },
                                onChangeEnd: (newValue) async {
                                  setState(() {
                                    if (newValue < 0) {
                                      newValue = 0;
                                    } else if (newValue > duration!.inSeconds.toDouble()) {
                                      newValue = duration!.inSeconds.toDouble();
                                    }
                                    value=newValue;
                                    if(isPlaying==false) isPlaying=true;
                                  });
                                  if(isComplete){
                                    setState(() {
                                      value=0;
                                      isComplete=false;
                                    });
                                  }
                                  player.pause();
                                  await player.seek(Duration(seconds: newValue.toInt()));
                                  player.resume();
                                },
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${(value/60).floor()} : ${(value % 60).floor()}',
                                style: TextStyle(color: Colors.white, fontSize: 12),
                              ),
                              SizedBox(width: 10,),
                              Text(
                                '${duration!.inMinutes} : ${duration!.inSeconds % 60}',
                                style: TextStyle(color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.white.withOpacity(0.3),
                              border: Border.all(color: Colors.white, width: 1),
                            ),
                            child: InkWell(
                              onTap: () async{
                                if(isPlaying){
                                  await player.pause();
                                  setState(() {
                                    isPlaying=false;
                                  });
                                }
                                else{
                                  await player.resume();
                                  setState(() {
                                    isPlaying=true;
                                  });
                                }
                                player.onPositionChanged.listen((position) {
                                  setState(() {
                                    value= position.inSeconds.toDouble();
                                  });
                                });
                              },
                              child: Icon(
                                isPlaying? Icons.pause: Icons.play_arrow,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 220,
                      width: (MediaQuery.of(context).size.width - 80) / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFedc9aa),
                      ),
                    ),
                  ],
                ),
                Expanded(child: Container()),
                Column(
                  children: [
                    Container(
                      height: 220,
                      width: (MediaQuery.of(context).size.width - 80) / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFd6b9fc),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 180,
                      width: (MediaQuery.of(context).size.width - 80) / 2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xFFffadae),
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
