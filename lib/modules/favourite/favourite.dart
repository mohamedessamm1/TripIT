import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripit/shared/cubit/cubit.dart';
import 'package:tripit/shared/cubit/state.dart';

class Fav extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appcubit,appstate>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: ListView.separated(
                    itemBuilder: ((context, index) => Image.asset('assets/images/imgparis.png')),
                    separatorBuilder: (context,index)=>Divider(),
                    itemCount: 9
                ),
              )
            ],
          ),

        );
      },
    );
  }
}
