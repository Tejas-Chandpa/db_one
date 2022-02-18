
import 'package:db_one/dbhandler/db.dart';
import 'package:db_one/models/model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:flutter/services.dart';
import 'package:the_validator/the_validator.dart';
import 'package:db_one/screens/signupwithdb.dart';




class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  DBHelper dbHelper = DBHelper.instance;
   List<UserModel?> users = [];

  final _formKey = GlobalKey<FormState>();

  // final TextEditingController uidController = TextEditingController();
  final  nameController = TextEditingController();
  final  emailController = TextEditingController();
  final  mobController= TextEditingController();
  final  passController = TextEditingController();
  final  cpassController = TextEditingController();
// late int mob;


  // DBHelper dbHelper = DBHelper as DBHelper ;
  // List<UserModel?> userModels = [];

  @override
  void initState()
    {
      super.initState();
      dbHelper.getAllContacts().then((rows)
      {
        setState(() {
          rows?.forEach((row)
          {
            users.add(UserModel.map(row));
          });
        });
      });
    }

// signup(){
//     String uname = DBHelper.username;
// }


  // validateEmail(String email)
  // {
  //   final emailreg = RegExp(
  //       r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
  //   return emailreg.hasMatch(email);
  // }
  //
  // validatePass(String pass)
  // {
  //
  // }
late UserModel currentusers;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('SIGNUP PAGE'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formKey,
              child: Column(
                    children:<Widget> [
                      // ListView.builder(
                      //     itemCount:users.length,
                      //     itemBuilder: (context,index)
                      // {
                      //   return ListTile(
                      //     leading: Text('${users[index].id}'),
                      //   );
                      // }
                      // ),
                      // Container(
                      //   padding: const EdgeInsets.all(10.0),
                      //   child: TextFormField(
                      //     keyboardType: TextInputType.name,
                      //     controller: uidController,
                      //     decoration:  InputDecoration(
                      //         border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(30.0),
                      //         ),
                      //         prefixIcon: const Icon(Icons.person),
                      //         labelText: 'USER ID',
                      //         hintText: 'Enter UserId Here'),
                      //     validator: (val) {
                      //       if (val == null || val.isEmpty) {
                      //         return "Required";
                      //       } else {
                      //         return null;
                      //       }
                      //
                      //     },
                      //     // validator: (val) => val!.isEmpty ? 'Please Enter $hintName':null,
                      //     // onSaved: (val) => Controller.text = val,
                      //   ),
                      // ),

                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: nameController,
                          decoration:  InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              prefixIcon: const Icon(Icons.person),
                              labelText: 'USER NAME',
                              hintText: 'Enter UserName Here'),
                          validator: (val) {
                            if (val == null || val.isEmpty) {
                              return "Required";
                            } else {
                              return null;
                            }
                          },
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          controller: emailController,
                          validator: FieldValidator.email(),
                          decoration:  InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              prefixIcon: const Icon(Icons.email),
                              labelText: 'EMAIL',
                              hintText: 'Tez25@gmail.com'),
                          // validator: (val) {
                          //   if (val == null || val.isEmpty) {
                          //     return "Required";
                          //   } if(!validateEmail(val)) {
                          //       return "Please Enter Valid Email";
                          //   }
                          //     return null;
                          //   }

                            ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: IntlPhoneField(
                          decoration:  InputDecoration(
                            labelText: 'Mobile Number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          initialCountryCode: 'IN',
                          onChanged: (phone) {
                            if (kDebugMode) {
                              print(phone.completeNumber);
                            }
                          },
                        ),
                      ),
                      // Container(
                      //   padding: const EdgeInsets.all(10.0),
                      //   child: TextFormField(
                      //     keyboardType: TextInputType.text,
                      //     controller: mobController,
                      //     // validator:,
                      //
                      //
                      //   decoration:  InputDecoration(
                      //         border: OutlineInputBorder(
                      //           borderRadius: BorderRadius.circular(30.0),
                      //         ),
                      //         prefixIcon: const Icon(Icons.person),
                      //         labelText: 'MOBILE NO',
                      //         hintText: 'Enter Number Here'),
                      //
                      //     // validator: (val) {
                      //     //   if (val == null || val.isEmpty) {
                      //     //     return "Required";
                      //     //   } else {
                      //     //     return null;
                      //     //   }
                      //     // },
                      //   ),
                      // ),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          controller: passController,
                          validator: FieldValidator.password(
                              minLength: 8,
                              shouldContainNumber: true,
                              shouldContainCapitalLetter: true,
                              shouldContainSmallLetter: true,
                              shouldContainSpecialChars: true,
                              errorMessage: "Password must match the required format",
                              onNumberNotPresent: () { return "Password must contain number"; },
                              onSpecialCharsNotPresent: () { return "Password must contain special characters"; },
                              onCapitalLetterNotPresent: () { return "Password must contain capital letters"; }
                          ),
                          decoration:  InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              prefixIcon: const Icon(Icons.lock),
                              labelText: 'PASSWORD',
                              hintText: 'Tejas@25'),
                          // validator: (val) {
                          //   if (val == null || val.isEmpty) {
                          //     return "Required";
                          //   } else {
                          //     return null;
                          //   }
                          // },
                          //   validator: (val) {
                          //     final pass = val ;
                          //     if (val == null || val.isEmpty) {
                          //       return "Required";
                          //     } else if (val.length < 8) {
                          //       return "Password must be atleast 8 characters long";
                          //     } else {
                          //       return null;
                          //     }
                          //   }
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          keyboardType: TextInputType.text,

                          obscureText: true,
                          validator: FieldValidator.equalTo(passController, message: "Password Mismatch"),
                          controller: cpassController,
                          decoration:  InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              prefixIcon: const Icon(Icons.lock),
                              labelText: 'CONFIRM PASSWORD',
                              hintText: 'Confirm Password'),
                          // validator: (val) {
                          //   if (val == null || val.isEmpty) {
                          //     return "Required";
                          //   } else {
                          //     return null;
                          //   }
                          // },
                          // validator: (val) {
                          //   final cpass = val;
                          //   // final pass = val;
                          //   if (val == null || val.isEmpty) {
                          //     return "Required";
                          //   } else if (val.length < 8) {
                          //     return "Password must be atleast 8 characters long";
                          //   } else if (val != cpass) {
                          //     return "Password must be same as above";
                          //   } else {
                          //     return null;
                          //   }
                          // },
                        ),
                      ),
                        SizedBox(
                          height: 40,
                          width: 120,
                          child: ElevatedButton(
                            onPressed: () async
                            {
                              // _insert(){
                              print('username'  + nameController.text);
                              print('email'  + emailController.text);
                              print('mobile' + mobController.text);
                              print('password' + passController.text);
                            // }

                                final UserModel? currentusers = await _inputValueDialog(context)  ;
                                if(currentusers != null)
                                {
                                  _insert(currentusers);
                                }

                                if(_formKey.currentState!.validate())
                              {
                                // String uname = unameController as String;
                                Navigator.push(context,
                                MaterialPageRoute(builder:
                                (BuildContext context)=>UseDatabase()),
                                );

                                // ScaffoldMessenger.of(context).showSnackBar(
                                //     const SnackBar(content: Text('Signup Successfully...!',
                                //     textAlign: TextAlign.center,
                                //     style: TextStyle(fontSize: 20,
                                //         fontWeight: FontWeight.bold,
                                //     color: Colors.blueGrey,),
                                //     ),
                                //       duration: Duration(seconds: 6),
                                //     )
                                // );
                              }
                            },
                            child: const Text('SIGN UP',
                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0)
                              ),
                            ),
                          ),
                        ),
                    ],
               ),
          ),
        ),
      ),
    );
  }
}

Future<UserModel?>_inputValueDialog(BuildContext context)async
{
  UserModel userModel;
  TextEditingController name = TextEditingController();
}

void _insert(UserModel currentusers) async
{
  Map<String,dynamic> row =
  {
    DBHelper.colName:currentusers.name,
    DBHelper.colEmail:currentusers.email,
    DBHelper.colMob:currentusers.mob,
    DBHelper.colPass:currentusers.pass,
  };
  try
      {
        var dbHelper;
        await dbHelper.insertData(row).then((id)
        {
          print('inserted row id $id');
        }

        );
      }catch(_){

  }
}
