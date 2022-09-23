import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripit/modules/city_screen/city_screen.dart';
import 'package:tripit/shared/cubit/cubit.dart';
import 'package:tripit/shared/cubit/state.dart';

class loc extends StatelessWidget {

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
                    itemBuilder: (context,index)=>InkWell(child: appcubit.get(context).imageloclist[index],
                        onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>city_screen()));}),
                    separatorBuilder: (context,index)=>Divider(height: 2,),
                    itemCount: appcubit.get(context).imageloclist.length
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
