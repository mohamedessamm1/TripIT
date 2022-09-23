import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:tripit/home_layout/home_layout.dart';
import 'package:tripit/models/login_model.dart';
import 'package:tripit/models/register_model.dart';
import 'package:tripit/modules/calender/calender_screen.dart';
import 'package:tripit/modules/favourite/favourite.dart';
import 'package:tripit/modules/home/home_screen.dart';
import 'package:tripit/modules/location/location.dart';
import 'package:tripit/modules/profile/profile_screen.dart';
import 'package:tripit/modules/settings/settings_screen.dart';
import 'package:tripit/network/dio/dio.dart';
import 'package:tripit/shared/cubit/cubit.dart';
import 'package:tripit/shared/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class appcubit extends Cubit<appstate> {
  appcubit() : super(appinitialstate());
  static appcubit get(context) => BlocProvider.of(context);
  List<IconData> iconlist = [
    Icons.home_outlined,
    Icons.favorite_border,
    Icons.work_outline,
    Icons.calendar_month_outlined,
    Icons.person_outline_rounded,
  ];
  List<String> titlelist = ['TOURS', 'FAVOURITE', 'MY TRIP', 'PROFILE','LOCATION'];
  List<Widget> screens = [
    Home_Screen(),
    Fav(),
    loc(),
    Calender(),
    profile_screen(),
  ];
  int currentindex = 0;
  changebottom(index) {
    currentindex = index;
    emit(changebottomstate());
  }

  LoginModel? login;
  RegisterModel? registerModel;
  void userlogin(
      {required context, required String email, required String password}) {
    dio_helper.postdatalogin(data: {
      'email': email,
      'password': password,
    }).then((value) {
      login = LoginModel.fromJson(value.data);
      if (login?.code == 200) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeLayout()));
      }
      emit(apploginsuccesstate(login!));
    }).catchError((error) {
      emit(apploginerrorstate());
    });
  }

  void userregister({
    required context,
    required String email,
    required String password,
    required String firstname,
    required String lastname,
    required String age,
    required String gender,
  }) {
    print(email);
    dio_helper.postdataregister(data: {
      'email': email,
      'password': password,
      'first_name': firstname,
      'last_name': lastname,
      'age': age,
      'gender': gender,
    }).then((value) {
      registerModel = RegisterModel.fromJson(value.data);
      if (registerModel?.code == 200) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomeLayout()));
      }
      emit(appregistersuccesstate(registerModel!));
    }).catchError((error) {
      print(error.toString());
      emit(appregistererror());
    });
  }
  List<Image> imageloclist=[
    Image.asset('assets/images/france.png'),
    Image.asset('assets/images/india.png'),
    Image.asset('assets/images/england.png'),
    Image.asset('assets/images/australia.png'),
    Image.asset('assets/images/usa.png'),
  ];
  List<Image> cardimaglist=[
    Image.asset('assets/images/card1.png'),
    Image.asset('assets/images/card2.png'),
    Image.asset('assets/images/card3.png'),
    Image.asset('assets/images/card4.png'),
  ];
  List<Image> placelist=[
    Image.asset('assets/images/plc1.png'),
    Image.asset('assets/images/plc2.png'),
    Image.asset('assets/images/plc3.png'),
  ];

}
