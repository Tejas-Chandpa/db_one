
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  var name;

 // const LoginView({Key? key}) : super(key: key);
  LoginView({Key? key, required this.name}) : super(key: key);


  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text('VIEW PAGE'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              margin: const EdgeInsets.only(top: 5),

                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'WELCOME',
                        style: TextStyle(color:Colors.indigo,fontSize: 20,fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.name, //'$name' no lakho to pan hale
                        // Text(name);
                        style: const TextStyle(
                            fontSize: 25,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.w500),
                      ),

                    ],
                ),

            ),
          ),
      ),
      // ),
    );
  }
}
