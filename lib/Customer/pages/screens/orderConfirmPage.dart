import 'package:flutter/material.dart';
import 'package:starter_project/Customer/pages/screens/StyleScheme.dart';
import 'package:starter_project/Customer/pages/screens/orders.dart';
class OrderConfirmPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: orderConfirmPage(),
    );
  }
}
class orderConfirmPage extends StatefulWidget {
  @override
  _orderConfirmPageState createState() => _orderConfirmPageState();
}

class _orderConfirmPageState extends State<orderConfirmPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: IconButton(
        //   onPressed: () {
        //       Navigator.pop(context);
        //     },
        //   icon: Icon(Icons.arrow_back_ios,size: 20,
        //       color: Colors.black,),
        // ),
        title: Text("Booking Confirmed", style: TextStyle(
            color: Colors.black
        ),),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Navigator.pop(context);
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/1.png')
                )
              ),
            ),
            SizedBox(height: 15,),
            Text("Thank you Naza for choosing us!", style: headingStyle,),
            Text("Your appointment has been booked!", style: contentStyle,textAlign: TextAlign.center,),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Booking ID", style: headingStyle,),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    gradient: gradientStyle,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Text("1001", style: headingStyle.copyWith(
                    color: Colors.white
                  ),),
                )
              ],
            ),
            divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Services Count", style: headingStyle,),
                Text("7", style: headingStyle.copyWith(
                  color: Colors.grey
                ),),
              ],
            ),
            divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Total Amount", style: headingStyle,),
                Text("225", style: headingStyle.copyWith(
                    color: Colors.grey
                ),),
              ],
            ),
            divider(),
            Column(

              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Date & Time", style: headingStyle,),
                Text("Wednesday, 07 Aug, 2021.  1:00PM", style: contentStyle.copyWith(
                    color: Colors.grey,
                  fontSize: 16
                ),),
              ],
            ),
            // divider(),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text("Payment Method", style: headingStyle,),
            //     Text("Cash", style: headingStyle.copyWith(
            //         color: Colors.grey
            //     ),),
            //   ],
            // ),
            Expanded(
              child: Container(),
            ),
            InkWell(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Orders()));},
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 20),
                decoration: BoxDecoration(
                    gradient: gradientStyle
                ),
                child: Center(
                  child: Text("VIEW BOOKING", style: contentStyle.copyWith(
                      color: Colors.white,
                      fontSize: 22
                  ),),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Container divider()
  {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 15),
      height: 1,
      color: Colors.grey,
    );
  }
}

