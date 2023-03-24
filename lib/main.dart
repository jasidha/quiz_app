import 'package:flutter/material.dart';
import 'package:projectofquizapp/modelclass.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false, home: const Projectquizapp()),
  );
}

class Projectquizapp extends StatefulWidget {
  const Projectquizapp({Key? key}) : super(key: key);

  @override
  State<Projectquizapp> createState() => _ProjectquizappState();
}

class _ProjectquizappState extends State<Projectquizapp> {
  List questions = [
    Quiz(question: "7 days in a week", ans: true),
    Quiz(question: "28 hours in a day", ans: false),
    Quiz(question: "English Alphabet has 26 Letters", ans: true),
    Quiz(question: "365 Days in a Year", ans: true),
    Quiz(question: "The car has 5 wheels", ans: false),
    Quiz(question: "Apple Is a vegetable", ans: false),
    Quiz(question: "orange is a fruit", ans: true),
    Quiz(question: "Black pink has 4 members", ans: true),
    Quiz(question: "Bts has 10 members", ans: false),
    Quiz(question: "BaseBall Originated in the USA", ans: true)
  ];
  List<Icon> answers=[];
  int index=0;
  void nextQuestion(){
    if(index<questions.length-1){
      index++;
    }
  }
  String getQuestion(){
    return questions[index].question;
  }
  bool nextAnswer(){
    return questions[index].ans;
  }
  bool finished(){
    if(index>=questions.length-1){
      return true;
    }
    else{
      return false;
    }
  }
  int reset(){
    return index=0;
  }


  void lastwork(bool useranswer){
    bool correctanswer=nextAnswer();
    setState(() {
      if(finished()==true){

        print("finished");
        Alert(context: context, title: "FINISHED", desc: "RESTART AGAIN").show();
        reset();
        answers=[];
      }
      else{
        if(useranswer==correctanswer){
          answers.add(Icon(Icons.check,color: Colors.green,));
        }
        else{

          answers.add(Icon(Icons.close,color: Colors.red,));
        }
        nextQuestion();
      }
    });

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff805E34),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                 getQuestion() ,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 250,
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      lastwork(true);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.white60),
                    ),
                    child: Text("True",style: TextStyle(
                      color: Colors.black54,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),))),
            SizedBox(
              height: 12,
            ),
            SizedBox(
                height: 60,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      lastwork(false);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.white60),
                    ),
                    child: Text("False",style: TextStyle(
                      color: Colors.black45,
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    ),))),
            Row(children:
              answers,
            ),
          ],
        ),
      ),
    );
  }
}
