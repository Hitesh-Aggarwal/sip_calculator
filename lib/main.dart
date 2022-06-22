import 'package:flutter/material.dart';
import 'MyTextBox.dart';

void main() => runApp(const MaterialApp(
  home: Home(),
));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double principal=10000;
  double rate=4;
  int tenure=20;
  double amount=0;
  TextEditingController principalController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController tenureController = TextEditingController();
  
  void calculateAmount() {
    principal = double.parse(principalController.text);
    rate = double.parse(rateController.text);
    tenure = int.parse(tenureController.text);
    amount = principal;
    int i=0;
    while (i<tenure) {
      amount += amount*rate/100;
      i++;
    }
    if (amount < 100000) {
      amount = double.parse(amount.toStringAsFixed(4));
    }else {
      amount = double.parse(amount.toStringAsFixed(1));
    }
  }

  String showAmount() {
    if (amount > 100000000000) {
      return "Infinite";
    }
    return formatAmount(amount.toString());
  }

  String formatAmount(String price){
    String priceInText = "";
    int counter = 0;
    for(int i = (price.indexOf(".")-1);  i >= 0; i--){
      counter++;
      String str = price[i];
      if((counter % 3) != 0 && i !=0){
        priceInText = "$str$priceInText";
      }else if(i == 0 ){
        priceInText = "$str$priceInText";

      }else{
        priceInText = ",$str$priceInText";
      }
    }
    for (int i= price.indexOf("."); i<price.length; i++) {
      String str = price[i];
      priceInText = "$priceInText$str";
    }
    return priceInText.trim();
  }

  Widget MyTextField(TextEditingController mycontroller) {
    return Container(
      width: 160,
      child: TextField(
        controller: mycontroller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: "0",
          hintStyle: TextStyle(
            color: Colors.grey,
            fontFamily: "Lato",
            fontStyle: FontStyle.italic,
          )
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SIP Calculator'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        color: Colors.grey[50],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const MyTextBox(text: "Principal"),
                MyTextField(principalController),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const MyTextBox(text: "Rate(%)"),
                MyTextField(rateController),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const MyTextBox(text: "Tenure"),
                MyTextField(tenureController),
              ],
            ),
            const Divider(height: 10, color: Colors.grey, thickness: 1,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: const Center(
                    child: Text("Amount:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: "Lato",
                        letterSpacing: 1,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 180,
                  padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 5),
                  margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  color: Colors.lightBlue[600],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(Icons.currency_rupee_rounded,color: Colors.white,),
                      Center(
                        child: Text(showAmount(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Lato",
                            letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  calculateAmount();
                });
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.blue,
                padding: const EdgeInsets.all(15),
              ),
              child: const Text("Calculate",
                style: TextStyle(
                  fontFamily: "Lato",
                  letterSpacing: 1,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            const Text("Made by:",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: "Lato",
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                Text("Name:  Hitesh Aggarwal"),
                Text("Roll No:  102103596"),
              ],
            )
          ],
        ),
      ),
    );
  }
}
