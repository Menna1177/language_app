import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

import '../models/auth_model.dart';
import '../services/dio_helper.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final TextEditingController Registerusername=TextEditingController();
  final TextEditingController Registeremail=TextEditingController();
  final  TextEditingController Registerpassword=TextEditingController();
  final TextEditingController Loginemail=TextEditingController();
  final TextEditingController Loginpassword=TextEditingController();

  RegisterNewUser()
  {
    emit(AuthRegisterLoading());

    final name = Registerusername.text;
    final email = Registeremail.text;
    DioHelper.post('users', {
      'name':name,
      'email':Registeremail.text,
      'password':Registerpassword.text,
      "avatar": "https://picsum.photos/800"


    }, '').then((value) {
      model = AuthModel(
        name,
        Registeremail.text,
        accesstoken: '',
        refreshtoken: '',
      );
      emit(AuthRegisterSuccess());
    }).catchError((error)
    {
      emit(AuthRegisterError());
    });

  }
  AuthModel ?model;
  LoginAUser()
  {

    emit(AuthLoginLoading());
    DioHelper.post('auth/login',
        {
          'email':Loginemail.text,
          'password':Loginpassword.text
        }

        , '').then((value) {
      model=AuthModel.fromJson(value.data,
        name: "",
        email: Loginemail.text,);
      emit(AuthLoginSuccess());
    }).catchError((error){
      emit(AuthLoginError());

    });

  }
}