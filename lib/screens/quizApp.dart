import 'package:flutter/material.dart';
import 'package:q_score/shared/shared_widgets.dart';

class quizApp extends StatefulWidget {


  @override
  State<quizApp> createState() => _quizAppState();
}

class _quizAppState extends State<quizApp> {
  int ct=0, score=0;
  bool finish=false;
  @override
  Widget build(BuildContext context) {

    ////////////////////////////////////


    /////////////////////////////////////
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    Map<String,String> questions ={
      "Q1":"Do I look lovely  ?",
      "Q2":"Does the char have five legs?",
      "Q3":"is it true that there is four letters in five ?",
      "Q4":"Racism is Good ?",
      "Q5":"Do I look Hot XD?",
      "Q6":"do you smoke weed ?"
    };

    Map<String,bool> ans={
      "Q1": true,
      "Q2": true,
      "Q3": true,
      "Q4": true,
      "Q5": true,
      "Q6": true
    };

    return Scaffold(
      backgroundColor: const Color.fromRGBO(37, 44, 74, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(54, 64, 108, 1),
        title: const Center(child: Text("Quiz",style: TextStyle(fontSize: 30),)),
      ),
        body: Container(
          height: height,
          width: width,
          child: Column(

             children:  [
               SizedBox(
                 height: height *0.05,
               ),
           Padding(
             padding: EdgeInsets.symmetric(vertical: height*0.05),
             child: finish==false?
             Text("Question ${ct+1}",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 50
                ),
              ):
             Text("Finish",
               style: TextStyle(
                   color: Colors.white,
                   fontSize: 50
               ),),
           ),
               Padding(
                 padding:  EdgeInsets.only(bottom: height*0.05),
                 child: Card(
                   shape: RoundedRectangleBorder(
                     side: const BorderSide(
                       color: Colors.white,
                       width: 2
                     ),
                     borderRadius: BorderRadius.circular(20)
                   ),
                   color: Colors.transparent,
                   child: Container(
                     height: height*0.17,
                     width: width*0.85,
                     child: Center(
                       child:

                       finish==false?
                       Text(
                           questions["Q${ct+1}"] ?? "null",
                           textAlign: TextAlign.center,
                         style: TextStyle(
                           fontSize: 30,
                           color: Colors.white
                         ),
                       ):Text("Score= $score/6",  textAlign: TextAlign.center,
                         style: TextStyle(
                             fontSize: 30,
                             color: Colors.white
                         ),) ,
                     ),
                   ),
                 ),
               ),


               finish ==false? Column(children: [
                 ElevatedButton(
                   onPressed: (){
                     setState(() {

                       if(true==ans["Q${ct+1}"]){
                        score++;
                       }
                       ct++;
                       print("score : $score");
                       if(ct>=6){
                         finish=true;
                       }
                     });
                   },
                   child: Text("True"),
                   style: ElevatedButton.styleFrom(
                       shape: RoundedRectangleBorder(
                           side: BorderSide(
                             width: 2,
                             color: Colors.white,
                           ),
                           borderRadius: BorderRadius.circular(10)
                       ),
                       backgroundColor: Colors.transparent,
                       fixedSize: Size(width*0.65, height*0.09),
                       textStyle: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)
                   ),
                 ),
                 SizedBox(height: height*0.03,),
                 ElevatedButton(
                   onPressed: (){
                     setState(() {
                       if(false ==ans["Q${ct+1}"]){
                         score++;
                       }
                       print("score");
                       ct++;
                       if(ct==6){
                         finish=true;
                       }
                     });
                   },
                   child: Text("false"),
                   style: ElevatedButton.styleFrom(
                       shape: RoundedRectangleBorder(
                           side: BorderSide(
                             width: 2,
                             color: Colors.white,
                           ),
                           borderRadius: BorderRadius.circular(10)
                       ),
                       backgroundColor: Colors.transparent,
                       fixedSize: Size(width*0.65, height*0.09),
                       textStyle: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)
                   ),
                 ),
               ],):ElevatedButton(
                 style: ElevatedButton.styleFrom(
                     shape: RoundedRectangleBorder(
                         side: BorderSide(
                           width: 2,
                           color: Colors.white,
                         ),
                         borderRadius: BorderRadius.circular(10)
                     ),
                     backgroundColor: Colors.transparent,
                     fixedSize: Size(width*0.65, height*0.09),
                     textStyle: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)
                 ),
                   onPressed: (){

                     setState(() {
                       ct=0;
                       finish=false;
                       score=0;
                     });

               },
                   child: Text("Reset"))





            ],
          ),
        ),
    );
  }
}
