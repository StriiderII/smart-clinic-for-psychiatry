import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';



enum AuthenticationType { login, register }

enum FieldType { email, password, phoneNumber, username, confirmPassword, fullName }

enum DateType { day, month, year }

enum Gender { male, female }

enum Selected {t, f}
var selected = Selected.f.obs;




