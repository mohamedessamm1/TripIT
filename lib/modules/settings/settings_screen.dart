import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripit/shared/cubit/cubit.dart';
import 'package:tripit/shared/cubit/state.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<appcubit, appstate>(
      listener: (context, stat) {},
      builder: (context, state) {
        List<Image> listimages = [
          Image.asset('assets/images/Notification.png'),
          Image.asset('assets/images/Location.png'),
          Image.asset('assets/images/Tours.png'),
          Image.asset('assets/images/Invite Friends.png'),
          Image.asset('assets/images/Help Center.png'),
          Image.asset('assets/images/Setting.png'),
          Image.asset('assets/images/Log Out.png'),
        ];
        return Scaffold(
          appBar: AppBar(
            leading: const Text(''),
            elevation: 0,
            backgroundColor: Colors.white,
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 35,
                  )),
              SizedBox(
                width: 10,
              )
            ],
          ),
          backgroundColor: Colors.white,
          body: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Center(
                  child: Image.asset(
                'assets/images/personal.png',
                scale: .7,
              )),
              SizedBox(
                height: 20,
              ),
              Text(
                '${appcubit.get(context).login?.data?.name.toString()?? appcubit.get(context).registerModel?.data?.name.toString()}',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                '${appcubit.get(context).login?.data?.email.toString()??
                    appcubit.get(context).registerModel?.data?.email.toString()}'
                ,style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.separated(
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) =>
                      GestureDetector(child: listimages[index]),
                  separatorBuilder: (context, index) => Divider(height: 31),
                  itemCount: listimages.length,
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        );
      },
    );
  }
}
