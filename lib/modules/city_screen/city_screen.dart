import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripit/shared/cubit/cubit.dart';
import 'package:tripit/shared/cubit/state.dart';

class city_screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appcubit,appstate>(
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(),
          backgroundColor: Colors.blue,
          body: Column(
            children: [
            ],
          ),
        );
      },
    );
  }
}
