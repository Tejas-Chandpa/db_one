

import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
   const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _formKey = GlobalKey<FormState>();
  late bool hidepassword = true;

  TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RESET PAGE'),
        centerTitle: true,
      ),
      body:Form(
        key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Reset Password',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  obscureText: hidepassword,
                  controller: passController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    hintText: 'Enter New Password',
                    labelText: 'Reset Password',
                    prefixIcon: const Icon(Icons.security,color: Colors.blue,size: 20,),
                    suffixIcon: IconButton( icon: const Icon(Icons.visibility),
                      color: Colors.blue,
                      onPressed: ()
                      {
                        setState(() {
                          hidepassword = !hidepassword;
                        });
                      },

                  ),
                  ),
                  validator: (val){
                    if(val == null || val.isEmpty){
                      return 'Required';
                    }else{
                      return null;
                    }
                  },
              ),
              ),
              Container(
                padding: const EdgeInsets.all(2.0),
                height: 40,
                width: 100,
                child: ElevatedButton(
                  onPressed: ()
                  {
                    if(_formKey.currentState!.validate()){

                    }
                  },
                  child: const Text('RESET',
                    style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 20),
                  ),
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                ),
              ),
            ],
          ),
      ),
    );
  }
}
