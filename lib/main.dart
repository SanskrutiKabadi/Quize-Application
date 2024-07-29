import 'Package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget{
  const MyApp({super.key});
  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      home:QuizeClass1(),
      debugShowCheckedModeBanner: false,
    );




  }

}
class QuizeClass1 extends StatefulWidget{ 
  const QuizeClass1({super.key});
  @override
  State<QuizeClass1> createState(){
    return _QizeApp2();
  }


}
class _QizeApp2 extends State<QuizeClass1>{

  int questionIndex=0;
  int selectedAnswerIndex=-1;
  bool flag=true;
  int correctQuestionCount=0;
  List<Map> allQuestions=[
    {
      "question":"Which of the following language is platform indepent?",
      "options":["C","C++","Python","Java"],
       "answer":3,

    },
    {
      "question":"Which language is server side programming language?",
      "options":["C","C++","Python","Java"],
       "answer":2,
    },
    {
      "question":"Which of the following language is not object oriented?",
      "options":["C","C++","Python","Java"],
       "answer":0,

    },
    {
      "question":"which of following class is imuttable?",
      "options":["stringBuilder","stringBuffer","String","None"],
       "answer":2,

    },
    {
      "question":"Which keyword is used to throw user defined exceptions?",
      "options":["catch","try","throws","throw"],
       "answer":3,

    },
    



  ];
  MaterialStateProperty<Color?> checkAnswer(int buttonIndex){
    if(selectedAnswerIndex !=-1){
      if(buttonIndex == allQuestions[questionIndex]["answer"]){
          return const MaterialStatePropertyAll(Colors.green);
      }
      else if(buttonIndex==selectedAnswerIndex){
        return const MaterialStatePropertyAll(Colors.red);
      }
      else{
        return const MaterialStatePropertyAll(null);
      }


    }
    else{
       return const MaterialStatePropertyAll(null);
    }
  } 
  void validateCurrentpage(){
    if(selectedAnswerIndex==-1){
      return;
    } 
    if( selectedAnswerIndex==allQuestions[questionIndex]["answer"]){
      correctQuestionCount++;
      
    }
      
    
    if(selectedAnswerIndex!=-1){
      if(questionIndex==allQuestions.length-1){
         flag=false;   
      }
        selectedAnswerIndex = -1;
        setState(() {
          questionIndex+=1;
        });

    }

    }

  
 
    Scaffold questionScreen(){
      if(flag==true){
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 213, 148, 224),
          appBar:AppBar(
            backgroundColor: Colors.purple,
            leading: const Icon(Icons.lock_clock_rounded),
            centerTitle: true,
            title:const Text("QUIZ APP",
              style:TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          body:Column(
            
            children: [
              const SizedBox(
                height:20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Questions : ",
                    style: TextStyle(
                      fontSize:25,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text("${questionIndex+1}/${allQuestions.length}",
                    style:const TextStyle(
                      fontSize:25 ,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height:20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("${allQuestions[questionIndex]["question"]}",
                    style: const TextStyle(
                      fontSize:15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Column(
               
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width:200,
                    height:50,
                    child:
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: checkAnswer(0),
                        ),
                        onPressed:(){
                          setState(() {
                           selectedAnswerIndex=0; 
                          });
                        
                    },
                    child:
                      Text("A. ${allQuestions[questionIndex]["options"][0]}",style:const TextStyle(
                        fontSize:20 ,
                        fontWeight: FontWeight.bold,
                      ),),
                  ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width:200,
                    height:50,
                    child:
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: checkAnswer(1),
                    ),
                    onPressed:(){
                      setState(() {
                         selectedAnswerIndex=1; 
                      });
                     
                    },
                    child:
                    Text("B. ${allQuestions[questionIndex]["options"][1]}",style:const TextStyle(
                        fontSize:20 ,
                        fontWeight: FontWeight.bold,
                      ),),
                  ),
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                   SizedBox(
                    width:200,
                    height:50,
                    child:
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: checkAnswer(2),
                    ),
                    onPressed:(){
                      setState(() {
                      selectedAnswerIndex=2;  
                      });
                      
                    },
                    child:
                      Text("C. ${allQuestions[questionIndex]["options"][2]}",style:const TextStyle(
                        fontSize:20 ,
                        fontWeight: FontWeight.bold,
                      ),),
                  ),
                   ),
                  const SizedBox(
                    height: 20,
                  ),
                   SizedBox(
                    width:200,
                    height:50,
                    child:
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: checkAnswer(3),
                      
                    ),
                    onPressed:(){
                      setState(() {
                        selectedAnswerIndex=3;
                      });
                     
                    },
                    child:
                      Text("D. ${allQuestions[questionIndex]["options"][3]}",style:const TextStyle(
                        fontSize:20 ,
                        fontWeight: FontWeight.bold,
                      ),),
                  ),
                   ),
                ],
              ),
            ],
          
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              validateCurrentpage();
            },
            backgroundColor: Colors.purple,
            child: const Icon(Icons.forward),
       
          ),

        );
      }   
      else{
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 213, 148, 224),
        
          appBar:AppBar(
            backgroundColor: Colors.purple,
            leading: const Icon(Icons.lock_clock_rounded),
            centerTitle: true,
            title:const Text("QUIZ APP",
              style:TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          body: Column(
            children:[
              const SizedBox(
                  height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container(
                  
                    color: const Color.fromARGB(255, 237, 225, 111),
                    width: 300,
                    height: 50,
                    child:
                    Center(
                      child: 
                        Text("Total Questions  :  ${allQuestions.length}", style:const TextStyle(
                        fontSize: 15,
                            fontWeight: FontWeight.bold,
                           
                          ) ,
                        ),
                      
                    ),
                  ),
                  ],
              ),
              const SizedBox(
                  height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container(
                    color: const Color.fromARGB(255, 237, 225, 111),
                    width: 300,
                    height: 50,
                    child:
                    Center(
                      child: 
                        Text("Correct Answers  :  ${correctQuestionCount}/${allQuestions.length}", style:const TextStyle(
                        fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ) ,
                        ),
                      
                    ),
                  ),
                  ],
                  

              ),
              
              const SizedBox(
                  height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container(
                    color: const Color.fromARGB(255, 237, 225, 111),
                    width: 300,
                    height: 50,
                    child:
                    Center(
                      child: 
                        Text("Incorrect Answers  :  ${(allQuestions.length)-correctQuestionCount}/${allQuestions.length}", style:const TextStyle(
                        fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ) ,
                        ),
                      
                    ),
                  ),
                  ],
                  

              ),
              
              const SizedBox(
                  height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container(
                    color: const Color.fromARGB(255, 237, 225, 111),
                    width: 300,
                    height: 50,
                    child:
                    Center(
                      child: 
                        Text("Final Score  :  ${correctQuestionCount*20}%", style:const TextStyle(
                        fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ) ,
                        ),
                      
                    ),
                  ),
                  ],
                  
              ),
              const SizedBox(
                  height: 20,
              ),
              const Text("Congratulations!",
                      style:TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: checkAnswer(3),
                      
                    ),
                    onPressed:(){
                      setState(() {
                        setState(() {
                          questionIndex=0;
                          selectedAnswerIndex=-1;
                          correctQuestionCount=0;

                          flag = true;
                        });
                      });
                     
                    },
                    child:
                      const Text("Reset"),
                  ),
                  const SizedBox(
                    height: 15,
                    ),

                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: checkAnswer(3),
                      
                    ),
                    onPressed:(){},
                    child:
                      const Text("Exit"),
                  ),

              
          ],
              ),
              
          
          
          
        );
      } 
 }
Widget build(BuildContext context){
  return questionScreen();
 }
}