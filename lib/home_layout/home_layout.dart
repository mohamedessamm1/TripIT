import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripit/modules/location/location.dart';
import 'package:tripit/modules/settings/settings_screen.dart';
import 'package:tripit/shared/cubit/cubit.dart';
import 'package:tripit/shared/cubit/state.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appcubit, appstate>(
        listener: (context, state) {},
        builder: (context, state) {

          return Scaffold(
              bottomNavigationBar: ConvexAppBar(
                height: 44,
                elevation: 8,
                shadowColor: Colors.blue.shade200,
                style: TabStyle.fixedCircle,
                color: Colors.indigo,
                backgroundColor: Colors.white,
                activeColor: Colors.black,
                items: [
                  TabItem(icon: appcubit.get(context).iconlist[0], title: ''),
                  TabItem(icon: appcubit.get(context).iconlist[1], title: ''),
                  TabItem(icon: appcubit.get(context).iconlist[2], title: ''),
                  TabItem(icon: appcubit.get(context).iconlist[3], title: ''),
                  TabItem(icon: appcubit.get(context).iconlist[4], title: ''),


                ],

                onTap: (index){
                  appcubit.get(context).changebottom(index);

                },
              ),
              backgroundColor: Colors.white,
              appBar: AppBar(
                actions: [
                  appcubit.get(context).currentindex==0? IconButton(onPressed: (){}, icon:Icon(Icons.search,color: Colors.black,size: 30,)): SizedBox(width: 2,) ],
                centerTitle: true,
                title: Text('${appcubit.get(context).titlelist[appcubit.get(context).currentindex]}',style: TextStyle(color: Colors.black,fontSize: 24),),
                  backgroundColor: Colors.white,
                  elevation: 0,
                  leading: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings()));
                      },
                      icon: Image.asset('assets/images/side.png'))),
              body: appcubit.get(context).screens[appcubit.get(context).currentindex]);
        });
  }
}
