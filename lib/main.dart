import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tripit/home_layout/home_layout.dart';
import 'package:tripit/modules/calender/calender_screen.dart';
import 'package:tripit/modules/favourite/favourite.dart';
import 'package:tripit/modules/login/login_screen.dart';
import 'package:tripit/modules/on_boarding/on_boarding.dart';
import 'package:tripit/modules/profile/profile_screen.dart';
import 'package:tripit/modules/settings/settings_screen.dart';
import 'package:tripit/modules/signin/register_screen.dart';
import 'package:tripit/network/dio/dio.dart';
import 'package:tripit/shared/cubit/cubit.dart';

void main() {
  runApp( MyApp());
  dio_helper.init();
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => appcubit()

          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              appBarTheme: AppBarTheme(
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white
                  )
              )
          ),
          home: OnBoarding(),
        )
    );

  }
}

