import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tripit/modules/login/login_screen.dart';
import 'package:tripit/shared/cubit/cubit.dart';
import 'package:tripit/shared/cubit/state.dart';

class sign extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<appcubit,appstate>(
      listener: (context,state){
        if(appcubit.get(context).registerModel?.code==200){
          Fluttertoast.showToast(

            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            msg: 'register successfully',
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 20.0,
          );
        }else{
          Fluttertoast.showToast(
              msg: 'your information is incorrect',
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 20.0);
        }

      },
      builder: (context,state){
        bool agree = true;
        var emailcontrol = TextEditingController();
        var firstnamecontrol = TextEditingController();
        var lastnamecontrol = TextEditingController();
        var passwordcontrol = TextEditingController();
        var gendercontrol = TextEditingController();
        var agecontrol = TextEditingController();
        return Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Container(
              height: 900,
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/screen_background.png'))),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Image.asset('assets/images/Logo_White.png'),
                  SizedBox(
                    height: 50,
                  ),
                  Stack(
                    children: [
                      Center(child: Image.asset('assets/images/signbg.png')),
                      Padding(
                        padding: const EdgeInsets.only(left: 70, right: 70),
                        child: Column(
                          children: [
                            SizedBox(height: 29),
                            Text(
                              'Sign Up',
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            TextFormField(
                                controller: firstnamecontrol,
                                decoration: InputDecoration(
                                    hintText: 'first name',
                                    hintStyle: TextStyle(
                                        fontSize: 14, color: Colors.grey))),
                            SizedBox(
                              height: 2,
                            ),
                            TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'last name',
                                    hintStyle: TextStyle(
                                        fontSize: 14, color: Colors.grey)),
                                controller: lastnamecontrol),
                            SizedBox(
                              height: 2,
                            ),
                            TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'email',
                                    hintStyle: TextStyle(
                                        fontSize: 14, color: Colors.grey)),
                                controller: emailcontrol),
                            SizedBox(
                              height: 2,
                            ),
                            TextFormField(
                              controller:passwordcontrol,
                              decoration: InputDecoration(
                                  hintText: 'password',
                                  hintStyle:
                                  TextStyle(fontSize: 14, color: Colors.grey)),
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'age',
                                    hintStyle: TextStyle(
                                        fontSize: 14, color: Colors.grey)),
                                controller: agecontrol),
                            SizedBox(
                              height: 2,
                            ),
                            TextFormField(
                                decoration: InputDecoration(
                                    hintText: 'gender',
                                    hintStyle: TextStyle(
                                        fontSize: 14, color: Colors.grey)),
                                controller: gendercontrol),
                            Row(
                              children: [
                                Checkbox(
                                  value:agree,
                                  onChanged: (value){
                                    value=agree;
                                  },
                                ),
                                Text(
                                  'I agree the Terms & Conditions',
                                  style: TextStyle(fontSize: 12),
                                )
                              ],
                            ),
                            InkWell(
                              onTap: () {
                                appcubit.get(context).userregister(
                                  context: context,
                                  email: emailcontrol.text,
                                  password: passwordcontrol.text,
                                  firstname: firstnamecontrol.text,
                                  lastname: lastnamecontrol.text,
                                  age: agecontrol.text,
                                  gender: gendercontrol.text,
                                );
                              },
                              child: Container(
                                height: 40,
                                width: 272,
                                child: Center(
                                    child: Text(
                                      'Sign In',
                                      style:
                                      TextStyle(color: Colors.white, fontSize: 16),
                                    )),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/Buttonlogin.png'))),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 110,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/facebook.png'),
                      SizedBox(
                        width: 25,
                      ),
                      Image.asset('assets/images/google.png'),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?',
                          style: TextStyle(color: Colors.white)),
                      TextButton(
                          onPressed: () {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(builder: (context) => Login()));
                          },
                          child: Text(
                            'Login',
                            style: TextStyle(color: Colors.white),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

