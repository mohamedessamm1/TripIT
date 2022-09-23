import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripit/shared/cubit/cubit.dart';
import 'package:tripit/shared/cubit/state.dart';

class Home_Screen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appcubit,appstate>(
        listener: (context,state){},
        builder: (context,state){
          return Scaffold(
            body:  SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('  Popular Destination',style: TextStyle(color: Colors.indigo,fontSize: 26,fontWeight:FontWeight.bold ),),
                  Text('    10 Tours Avialable',style: TextStyle(color: Colors.grey,fontSize: 14,fontWeight: FontWeight.bold ),),
                  Container(height: 120,
                       child: ListView.separated(
                         physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                         itemBuilder: (context, index) => InkWell(child: appcubit.get(context).cardimaglist[index]),
                         separatorBuilder: (context,index)=>Divider(),
                         itemCount: appcubit.get(context).cardimaglist.length
                  ),
                     ),
                  Stack(

                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Container(
                        alignment: AlignmentDirectional.topCenter,
                        child: Image.asset('assets/images/man.png',fit: BoxFit.cover,width: double.infinity),height:230,width: double.infinity),
                        Container(
                          height: 150,
                          child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                             itemBuilder: (context,index)=>Image.asset('assets/images/Offer.png'),
                             separatorBuilder: (context,index)=>Divider(),
                             itemCount: 5
                       ),
                        )

                    ],
                  ),
                  Text('  Discover New Places',style: TextStyle(color: Colors.indigo,fontSize: 26,fontWeight:FontWeight.bold ),),
                  Container(
                    height: 370,
                    child: ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => appcubit.get(context).placelist[index],
                        separatorBuilder: (context,index)=>Divider(),
                        itemCount: 3,
                    ),
                  ),
                ],
              ),
            ),

          );
        },
    );
  }
}
