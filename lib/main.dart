import 'package:calculator_bmi/circle_button.dart';
import 'package:calculator_bmi/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<BmiProvider>(
      create: (BuildContext context) => BmiProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterApp(),
    );
  }
}

class CounterApp extends StatefulWidget {
  CounterApp({Key? key}) : super(key: key);

  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {

  @override
  Widget build(BuildContext context) {
    BmiProvider provider=Provider.of<BmiProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF090F1D),
        title: Text("BMI CALCULATOR"),
        centerTitle: true,
      ),
      body: Container(
        color: Color(0xFF090F1D),
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      Provider.of<BmiProvider>(context,listen: false).toggleMaleOrFemale(true);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      height: 180,
                      decoration: BoxDecoration(
                          color:provider.isMale?  Color(0xFFE8134A):Color(0xFF101322),
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.male,
                            color: Colors.white,
                            size: 120,
                          ),
                          Text("Male".toUpperCase(),
                              style: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: (){
                      Provider.of<BmiProvider>(context,listen: false).toggleMaleOrFemale(false);
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.43,
                      height: 180,
                      decoration: BoxDecoration(
                        color:provider.isMale?Color(0xFF101322):Color(0xFFE8134A),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.female,
                            color: Colors.white,
                            size: 120,
                          ),
                          Text("Female".toUpperCase(),
                              style: TextStyle(
                                  color: Colors.grey.shade700, fontSize: 20)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.2,
                decoration: BoxDecoration(
                  color: Color(0xFF1A1A2C),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("height".toUpperCase(),
                        style: TextStyle(
                            color: Colors.grey.shade700, fontSize: 24)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text("${provider.height.round()}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 45,
                                fontWeight: FontWeight.bold)),
                        SizedBox(
                          width: 3,
                        ),
                        Text("cm",
                            style: TextStyle(
                                color: Colors.grey.shade700, fontSize: 20)),
                      ],
                    ),
                    Slider(
                      value: provider.height,
                      onChanged: (value) {
                        Provider.of<BmiProvider>(context,listen: false).changeHeight(value);
                      },
                      min: 80,
                      max: 220,
                      activeColor: Color(0xFFE8134A),
                      inactiveColor: Colors.grey.shade700,
                    ),
                  ],
                ),
              ),
            )),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.43,
                    height: 180,
                    decoration: BoxDecoration(
                        color: Color(0xFF1A1A2C),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Weight".toUpperCase(),
                            style: TextStyle(
                                color: Colors.grey.shade700, fontSize: 20)),
                        Text("${provider.weight}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 45,
                                fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleButton(icon: Icons.remove, onPress: Provider.of<BmiProvider>(context,listen: false).lessWeight),
                            CircleButton(icon:Icons.add, onPress:Provider.of<BmiProvider>(context,listen: false).addWeight),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.43,
                    height: 180,
                    decoration: BoxDecoration(
                      color: Color(0xFF1A1A2C),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Age".toUpperCase(),
                            style: TextStyle(
                                color: Colors.grey.shade700, fontSize: 20)),
                        Text("${provider.age}",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 45,
                                fontWeight: FontWeight.bold)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleButton(icon:Icons.remove, onPress:Provider.of<BmiProvider>(context,listen: false).lessAge),
                            CircleButton(icon:Icons.add,onPress:Provider.of<BmiProvider>(context,listen: false).addAge),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.09,
              child: TextButton(
                child: Text(
                  "Calculate".toUpperCase(),
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Color(0xFFE8134A)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25)),
                          side: BorderSide(color: Color(0xFFE8134A)))),
                ),
                onPressed: () {
                  Provider.of<BmiProvider>(context,listen: false).calculateBMI();
                  showAlert(provider);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

 Future<void> showAlert(BmiProvider provider){
   return  showDialog<void>(
       context: context,
       barrierDismissible: false,
       builder: (BuildContext context) =>   AlertDialog(
         title: Column(
           children: [
             Text("Gender = ${provider.isMale?"Male":"Female"}".toUpperCase()),
             Text("height = ${provider.height.round()}".toUpperCase()),
             Text("weight = ${provider.weight}".toUpperCase()),
             Text("age = ${provider.age}".toUpperCase()),
           ],
         ),
         content: Text("BMI = ${provider.result!.round()}".toUpperCase(),style: TextStyle(fontSize: 40),),
         actions: [
           TextButton(onPressed: (){
             Navigator.pop(context);
           }, child: Text("Ok")),
         ],
       )
   );
 }


}
