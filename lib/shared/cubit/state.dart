
import 'package:tripit/models/login_model.dart';
import 'package:tripit/models/register_model.dart';
import 'package:tripit/shared/cubit/state.dart';

abstract class appstate {}
class appinitialstate extends appstate{}
class changebottomstate extends appstate{}
class initialloginstate extends appstate{}
class apploginsuccesstate extends appstate{
  final LoginModel loginModel;
  apploginsuccesstate(this.loginModel);
}
class apploginerrorstate extends appstate{}
class appregistersuccesstate extends appstate{
  final RegisterModel registerModel;
  appregistersuccesstate(this.registerModel);
}
class appregistererror extends appstate{}
class appinitialregisterstate extends appstate{}
class getdatasuccesstate extends appstate{}
class getdataarror extends appstate{}