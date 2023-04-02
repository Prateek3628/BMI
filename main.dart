import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
var wtcnt = TextEditingController();
var ftcnt = TextEditingController();
var inchcnt = TextEditingController();
var rs = "";
var bgcolor ;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors:[
                  Colors.orange,
                Colors.blue,
                  Colors.red
                ],
              begin: FractionalOffset(1.0,0.0),
              end: FractionalOffset(0.0,1.0)
            )
          ),
        child: Center(

          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI',style: TextStyle(
                    fontSize: 34,fontWeight: FontWeight.bold),),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: wtcnt,
                  decoration: InputDecoration(
                    label: Text('Enter your weight in kgs'),
                    prefixIcon: Icon(Icons.line_weight)
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: ftcnt,
                  decoration: InputDecoration(
                      label: Text('Enter your height in feet'),
                      prefixIcon: Icon(Icons.height)
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: inchcnt,
                  decoration: InputDecoration(
                      label: Text('Enter your height(inches)'),
                      prefixIcon: Icon(Icons.height)
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                ElevatedButton(onPressed: (){
                  var wt = wtcnt.text.toString();
                  var ft = ftcnt.text.toString();
                  var ic = inchcnt.text.toString();
                  if(wt!="" && ft!="" && ic!=""){
                    //Calculation
                    var iwt = int.parse(wt);
                    var ift = int.parse(ft);
                    var icn = int.parse(ic);

                    var inch = (ift*12) +icn;

                    var cm = inch*2.45;

                    var mt = cm/100;

                    var bmi = iwt/(mt*mt);
                  var msg = "";
                    if(bmi>25){
                 msg = "Your are over weight";
                 bgcolor = Colors.orange.shade200;
                    }else if(bmi<18){
                      msg = "Your are under weight";
                      bgcolor = Colors.red.shade200;
                    }else{
                      msg = "Your are healthy";
                      bgcolor = Colors.green.shade200;
                    }
                    setState(() {
                      rs = "$msg \n Your BMI is ${bmi.toStringAsFixed(2)}";

                    });

                  }
                  else{
                    setState(() {
                      rs = "Please fill all the required data!!";
                    });
                  }
                }, child: Text('Calculate')),
                Text(rs,style: TextStyle(fontSize: 16),)
              ],
            ),
          ),
        ),
      )// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
