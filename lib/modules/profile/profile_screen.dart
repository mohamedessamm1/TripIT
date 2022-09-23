import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripit/shared/cubit/cubit.dart';
import 'package:tripit/shared/cubit/state.dart';

class profile_screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appcubit,appstate>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            children: [
               Center(child:  Column(
                 children: [
                   Image.asset('assets/images/pesonaledit.png'),
                   SizedBox(height: 30,),
                   Image.asset('assets/images/infoedit.png')
                 ],
               ))

            ],
          ),

        );
      },
    );
  }
}
