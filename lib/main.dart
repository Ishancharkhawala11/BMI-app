import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'BMI app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // var arr=[
  //   "ishan1",
  //   "ishan2",
  //   "ishan3",
  //   "ishan4",
  //   "ishan5",
  //   "ishan6",
  //   "ishan7",
  //
  // ];
  var wtController = TextEditingController();
  var ftcontrollert = TextEditingController();
  var Incontroller = TextEditingController();
  var result= " ";
  var Color=Colors.indigo.shade200;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.title)),
      ),
      body: Container(
        color: Color,
        child: Center(
          child: Container(
            width: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "BMI",
                  style: TextStyle(fontSize: 34, fontWeight: FontWeight.w700),
                ),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                      label: Text("enter your weight in KG"),
                      prefixIcon: Icon(Icons.line_weight)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: ftcontrollert,
                  decoration: InputDecoration(
                    label: Text("enter your height in FEET"),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: Incontroller,
                  decoration: InputDecoration(
                    label: Text("enter your height in INCH"),
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: (){
                   var wt=wtController.text.toString();
                   var ft=ftcontrollert.text.toString();
                   var inch=Incontroller.text.toString();
                   if(wt!="" && ft!="" && inch!="")
                     {
                         var iwt=int.parse(wt);
                         var  ift=int.parse(ft);
                         var Iinch=int.parse(inch);
                         var toatlInch=(ift*12)+Iinch;
                         var tcm=toatlInch*2.54;
                         var tM=tcm/100;
                         var bmi=iwt/(tM*tM);
                         var msg="";
                         if(bmi>25){
                            msg="you are overweight";
                            Color=Colors.orange.shade200;
                         }
                         else if(bmi<18){
                           msg="you are underweight";
                           Color=Colors.red.shade200;
                         }
                         else
                           {
                             msg="you are healthy";
                             Color=Colors.green.shade200;
                           }
                         setState((){
                           result="$msg \nYour BMI is ${bmi.toStringAsFixed(3)}";
                         });

                     }
                   else
                     {
                        setState(()
                        {
                          result="please fill all required fields ";
                        });
                     }

                }, child: Text("Calculate")),
                Text(result,style: TextStyle(fontSize: 20),),
              ],
            ),
          ),
        ),
      ),

      //   Container(
      //     child: ListView(
      //       children: arr.map((value) {
      //         return Container(
      //           child: Text(value),
      //         );
      //       }).toList()
      //     ),
      //   ),
    );
  }
}
