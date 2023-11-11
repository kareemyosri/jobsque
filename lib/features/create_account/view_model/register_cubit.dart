
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/database/remoteDatabase/DioHelper.dart';
import '../../../../core/database/remoteDatabase/endpoints.dart';
import '../model/register_model.dart';


part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  static RegisterCubit get(context) => BlocProvider.of(context);
  bool isChecked= false;
  bool obscure= true;
  int colorIndex = 0;
  String? errorText;

  // LoginModel? loginModel;
  RegisterModel? registerModel;
  void userRegister({
    required String name,
    required String email,
    required String password,
  }) {
    emit(RegisterLoadingState());
    DioHelper.PostData(url: register, data: {
      'name': name,
      'email': email,
      "password": password,

    }).then((value) {
      registerModel = RegisterModel.fromJson(value.data);
      //print(loginModel?.token);
      //print(loginModel?.data?.id);
      //print(value.data);
      emit(RegisterSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(RegisterErrorState());
    });
  }

  changeColorIndex(index){
    colorIndex=index;
    emit(ChangeColorIndexState());
  }


  void changeIcon() {
    obscure =! obscure;
    print(obscure);
    emit(ChangeIconState());
  }

  List<String> interestedWork=[];
  void addItem(String work){
    interestedWork.add(work);
    emit(InterestedWorkState());
  }
  void deleteItem(String work){
    interestedWork.remove(work);
    emit(InterestedWorkState());
  }

   changeTapped(bool isTapped){
    isTapped= ! isTapped;
    emit(ChangeTappedState());
  }


  List<String> selectedCountries=[];
  void addItemCountry(String country){
    selectedCountries.add(country);
    emit(SelectCountryState());
  }
  void deleteItemCountry(String country){
    selectedCountries.remove(country);
    emit(SelectCountryState());
  }

int activeIndex = 0;
  changeIndex(index){
    activeIndex=index;
    emit(ChangeIndexState());
  }



  void userDataSetup() {
    DioHelper.PutData(url: editProfile, data: {
      'interested_work': interestedWork.join(","),
      'offline_place':(activeIndex==0).toString(),
      'remote_place':(activeIndex==1).toString(),
      'address':selectedCountries.join(",")
    },
      token: registerModel!.token,

    ).then((value) {
      emit(DataLoadingState());

      print(value.data);
      print(registerModel!.token);
      emit(DataSuccessfullyState());
    }).catchError((error) {
      print(error.toString());
      emit(DataErrorState());
    });
  }



}
