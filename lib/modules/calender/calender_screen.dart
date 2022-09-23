import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripit/shared/cubit/cubit.dart';
import 'package:tripit/shared/cubit/state.dart';

class Calender extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appcubit,appstate>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          backgroundColor: Colors.grey.shade100,
          body: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                    itemBuilder: ((context, index) =>  Container(child: Image.asset('assets/images/tripscreen.png'))),
                    separatorBuilder: (context,index)=>Divider(height: 30,),
                    itemCount: 8
                ),
              )
            ],
          ),

        );
      },
    );
  }
}
