import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../Models/LoginModel.dart';
import '../database/remoteDatabase/DioHelper.dart';
import '../database/remoteDatabase/endpoints.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);
  bool isChecked= false;
  bool obscure= true;

  LoginModel? loginModel;

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(LoginLoadingState());
    DioHelper.PostData(url: login, data: {
      'email': email,
      "password": password,

    }).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      //print(loginModel?.token);
      //print(loginModel?.data?.id);
      //print(value.data);
      emit(LoginSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LoginErrorState());
    });
  }

  void changeCheckBox(checked) {
    isChecked = checked;
    emit(ChangeRememberState());
  }

  void changeIcon() {
    obscure =! obscure;
    print(obscure);
    emit(ChangeIconState());
  }

}
