
import 'package:db_one/dbhandler/db.dart';
import 'package:db_one/models/model.dart';
import 'package:db_one/screens/signup.dart';
import 'package:db_one/screens/view.dart';


import 'package:flutter/material.dart';

import 'package:db_one/screens/forgot.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // final Future<SharedPreferences> pref = SharedPreferences.getInstance();

  final _formKey = GlobalKey<FormState>();
  bool hidepassword = true;

  // TextEditingController uidController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  // final emailController = TextEditingController();

  DBHelper? dbHelper;

  @override
  void initState(){
    super.initState();

  }

     login()
     {
     //   String uid =DBHelper.userid as String;
     //   String uname =DBHelper.username;
     //
     //   if(uid.isEmpty)
     //     {
     //       alert(context,title: const Text('Please Enter Username'));
     //     }
     }
     // Future setSP(UserModel userModel) async
     // {
     //   // final SharedPreferences sp = await pref;
     //   // sp.setInt(uid, userModel.uid);
     //   sp.setString('uname', userModel.uname);
     //   sp.setString('pass', userModel.pass);
     //   sp.setString('email', userModel.email);
     // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SAMPLE APP'),
        centerTitle: true,
      ),
      body:  SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children:<Widget> [
                Container(
                  alignment: Alignment.center,

                  padding: const EdgeInsets.all(10.0),
                  child: const Text('TECHFIRST By',

                    style: TextStyle(color: Colors.grey,
                        decoration: TextDecoration.underline,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(10.0),
                  child: const Text('SIGN IN',
                    style: TextStyle(color: Colors.black87,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),),
                ),
                SizedBox(
                  height: 100,
                  child: Image.asset('assets/images/1.png',),
                ),
                Container(
                  padding: const EdgeInsets.all(18.0),
                  child: TextFormField(

                    controller: nameController,
                    // keyboardType: TextInputType,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter UserName',
                      labelText: 'USERNAME',
                      prefixIcon:Icon(Icons.person,size: 30,color: Colors.blue,) ,
                    ),
                        validator: (val){
                          if(val == null || val.isEmpty)
                            {
                              return 'Required';
                            }
                          else{
                            return null;
                          }
                        },
                    ),
                  ),
                Container(
                  // padding:  EdgeInsets.symmetric(10.0,10.0),
                  margin: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: TextFormField(
                    obscureText: hidepassword,
                    controller: passController,
                    decoration: InputDecoration(
                      border: const UnderlineInputBorder(),
                      hintText: 'Enter Password',
                      labelText: 'PASSWORD',
                      prefixIcon: const Icon(Icons.security,size: 20,color: Colors.blue,),
                      suffixIcon: IconButton( icon: const Icon(Icons.visibility),
                        color: Colors.blue,
                        onPressed: ()
                        {

                          // if(hidepassword == true)
                          // {
                          //         hidepassword = false;
                          // }else{
                          //   hidepassword = true;
                          // }
                          setState(() {
                              hidepassword = !hidepassword; //above code same use 1 line
                          });
                        },
                      )
                    ),
                        validator: (val){
                          // login();
                         if(val == null || val.isEmpty)

                           {
                             return 'Required';
                           }else{
                           return null;
                         }
                        },
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(10.0),
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: ()
                      {
                        Navigator.push(context,
                            MaterialPageRoute(builder:(BuildContext context) => const ResetPassword(),
                        ),
                        );
                      },
                  child:  const Text('Forgot Password',
                      style:TextStyle(color: Colors.indigo,
                          fontSize: 20),
                  ),
                  ),
               ),
                Container(
                  alignment: Alignment.center,
                  child:  ElevatedButton(
                    onPressed: ()
                    {
                      if(_formKey.currentState!.validate())
                        {
                          Navigator.push(context,
                              MaterialPageRoute(builder:
                                   (BuildContext context)=> LoginView(name:nameController.text),
                              ),
                          );
                        }
                        // print(nameController.text);
                        // print(passController.text);
                    },
                      child: const Text('LOGIN',
                        style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold),)
                  ),
                ),
                
                Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Does Have Not Account ?'),
                      TextButton(onPressed: ()
                        {
                          Navigator.push(context,
                          MaterialPageRoute(builder: (BuildContext context) => const Signup(),
                          ),
                          );
                        },
                          child: const Text('SIGNUP',
                            style: TextStyle(color: Colors.indigo,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),)
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
