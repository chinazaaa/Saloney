import 'package:flutter/material.dart';

class SalonSignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
          child: Scaffold(
        
               appBar:AppBar(bottom: TabBar(
                 
                
                              labelColor: Theme.of(context).primaryColor,
                              indicatorColor: Theme.of(context).primaryColor,
                              indicatorSize: TabBarIndicatorSize.tab,
                              indicatorPadding: EdgeInsets.symmetric(horizontal: 30),
                              tabs: [
                                Text(
                                  'Details',
                                ),
                                Text('More'),
                              ],
                              
                            ),
                              backgroundColor: Theme.of(context). scaffoldBackgroundColor,
               ),
        
              body: SafeArea(
            
                child: Expanded(
                  child: SizedBox(
                    // height: 200,
                    child: Column(
                      children: <Widget>[
                        Container(
                         height: MediaQuery.of(context).size.height - 50,
                          width: double.infinity,
                          color: Color(0xffededed),
                          
                        ),
                        Expanded(
                          child: TabBarView(
                            children: [
                              Container(
             
              height: MediaQuery.of(context).size.height - 50,
              width: double.infinity,
              

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                   Container(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                             
 
                  Container(
                     padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        Text("Sign up", style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),),
                        SizedBox(height: 20,),

                        Text("Welcome to Saloney", style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[700]
                        ),),
                      ],
                    ),
                  ),
                  Padding(
                   padding: EdgeInsets.symmetric(horizontal: 40),
                   

                    child: Column(
                       
                      children: <Widget>[
                        makeInput(hint: "Username"),
                    
                         makeInput(hint: "Email"),
                       makeInput(hint: "Password", obscureText: true),
                      makeInput(hint: "Confirm Password", obscureText: true),
                      ],
                    ),
                  ),
                  Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          height: 60,
                          padding: EdgeInsets.only(top: 3, left: 3),
                          decoration: BoxDecoration(
                              color: Color(0xfff3236e),
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.black)),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Already have an account?"),
                      Text(" Login", style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18
                      ),),
                    ],
                  ),
                ],
              ),
            ),
               Container(
                              // color: Colors.blue,
                             height: MediaQuery.of(context).size.height - 50,
              width: double.infinity,
              

              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                   Container(
                      alignment: Alignment.topLeft,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back_ios,
                          size: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                             
 
                  Container(
                     padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[
                        Text("Sign up", style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold
                        ),),
                        SizedBox(height: 20,),

                     Text("Welcome to Saloney", style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[700]
                        ),),
                      ],
                    ),
                  ),
                  Padding(
                   padding: EdgeInsets.symmetric(horizontal: 40),
                   

                    child: Column(
                       
                      children: <Widget>[
                         makeInput(hint: "Username"),
                    
                         makeInput(hint: "Email"),
                         makeInput(hint: "Password", obscureText: true),
                        makeInput(hint: "Confirm Password", obscureText: true),
                      ],
                    ),
                  ),
                   Padding(
                        padding: EdgeInsets.symmetric(horizontal: 40),
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          height: 60,
                          padding: EdgeInsets.only(top: 3, left: 3),
                          decoration: BoxDecoration(
                              color: Color(0xfff3236e),
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.black)),
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                          ),
                    ),
                  ),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Already have an account?"),
                      Text(" Login", style: TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 18
                      ),),
                    ],
                  ),
                ],
              ),
                            ),
                            ],
                          ),
                        ),
                      ],
        ),
                  )
                )
              )
              
      ),
    );
    
    
  }
  Widget makeInput({obscureText = false, String hint}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
       
        TextField(
          obscureText: obscureText,
          decoration: InputDecoration(
hintText: hint, 
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400])
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey[400])
            ),
          ),
        ),
        SizedBox(height: 30,),
      ],
    );
  }
}