import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripit/models/login_model.dart';
import 'package:tripit/modules/home/home_screen.dart';
import 'package:tripit/modules/signin/register_screen.dart';
import 'package:tripit/shared/cubit/cubit.dart';
import 'package:tripit/shared/cubit/state.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.white,
      body: BlocConsumer<appcubit,appstate>(
          listener: (context,state){
            if(appcubit.get(context).login?.code==200){
              Fluttertoast.showToast(

                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                msg: 'Login successfully',
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 20.0,
              );
            }else{
              Fluttertoast.showToast(
                  msg: 'your email or password is incorrect',
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 20.0);
            }
          },
        builder: (context,statae){
            var emailcontrol = TextEditingController();
            var passwordcontrol = TextEditingController();
            LoginModel? login;
            return SingleChildScrollView(
              child: Container(
                height: 900,
                width: double.infinity,
                decoration: BoxDecoration(
                    image: DecorationImage(fit: BoxFit.cover,
                        image: AssetImage('assets/images/screen_background.png')
                    )
                ),
                child: Column(
                  children: [
                    SizedBox(height: 50,),
                    Image.asset('assets/images/Logo_White.png'),
                    SizedBox(height: 50,),
                    Stack(
                      children: [
                        Center(child: Image.asset('assets/images/backgroundlogin.png')),
                        Padding(
                          padding: const EdgeInsets.only(left: 70,right: 70),
                          child: Column(
                            children: [
                              SizedBox(height: 55),
                              Text('Sign In',style: TextStyle(fontSize: 22,fontWeight:FontWeight.bold
                              ),),
                              SizedBox(height: 5,),
                              TextFormField(
                                  controller: emailcontrol,
                                  decoration: InputDecoration(
                                      hintText: 'Email',hintStyle: TextStyle(fontSize: 14,color: Colors.grey)
                                  )),
                              SizedBox(height: 5,),

                              TextFormField(
                                controller: passwordcontrol,
                                  decoration: InputDecoration(
                                  hintText: 'Password',hintStyle: TextStyle(fontSize: 14,color: Colors.grey),

                              )),
                              Row(
                                children: [
                                  Spacer(),
                                  TextButton(onPressed: (){}, child: Text('Forgot pasword?')),
                                ],
                              ),
                              SizedBox(height: 15,),

                              InkWell(
                                onTap: (){
                                  appcubit.get(context).userlogin(context: context,email: emailcontrol.text, password: passwordcontrol.text);
                                },
                                child: Container(
                                  height: 50,
                                  width: 272,
                                  child: Center(child: Text('Sign In',style: TextStyle(color: Colors.white,fontSize: 16),)),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      image: DecorationImage(
                                          image: AssetImage('assets/images/Buttonlogin.png')
                                      )
                                  ),
                                ),
                              )


                            ],
                          ),
                        ),


                      ],
                    ),
                    SizedBox(height: 200,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/facebook.png'),
                        SizedBox(width: 25,),
                        Image.asset('assets/images/google.png'),
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Don\'t have an account?',style: TextStyle(color: Colors.white)),
                        TextButton(onPressed: (){
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>sign()));
                        }, child: Text('Sign up',style: TextStyle(color: Colors.white),))
                      ],
                    ),

                  ],
                ),
              ),
            );
        },

      )
    );
  }
}
