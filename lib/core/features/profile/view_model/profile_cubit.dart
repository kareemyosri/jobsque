import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/util/database/remoteDatabase/endpoints.dart';
import 'package:meta/meta.dart';

import '../../../../util/database/remoteDatabase/DioHelper.dart';
import '../model/NotificationSettingsModel.dart';
import '../model/portfolio_model.dart';
import '../model/profile_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState>  {
  ProfileCubit() : super(ProfileInitial());
  static ProfileCubit get(context)=>BlocProvider.of(context);

List<Portfolio> portfolios=[];
List<Profile> profileDetails=[];

  getProfileDetailsAndPortfolios(){
    emit(GetPortfolioLoading());
    DioHelper.getData(url: portofolioUrl)
        .then((value) {
         // print(value.data);
      for (var portfolio in value.data['data']['portfolio']) {
        portfolios.add(Portfolio.fromJson(portfolio));
        print(portfolio);
      }
      profileDetails.add(Profile.fromJson(value.data['data']['profile']) );
          print(profileDetails[0]);




          emit(GetPortfolioSuccessfully());
    })
        .catchError((error) {
      print(error.toString());
      emit(GetPortfolioError());
    });
  }

  void updateUserData(
  {
  required String interestedWork,

  required String mobile, required String address,
    required String bio,
}
      )
  {

    emit(UpdateProfileDetailsLoading());

    DioHelper.PutData(url: editProfile, data: {
      'interested_work': interestedWork,
      'mobile':mobile,
      'address':address,
      'bio':bio
    },


    ).then((value) {
      profileDetails.clear();

      print(value.data);
      getProfileDetailsAndPortfolios();

      emit(UpdateProfileDetailsSuccessfully());
    }).catchError((error) {
      print(error.toString());
      emit(UpdateProfileDetailsError());
    });
  }


List<ProfileData> profile=[];
  getProfileNameAndEmail(){
    emit(GetProfileLoading());
  DioHelper.getData(url: profileUrl)
        .then((value) {
     // print(value.data);
      profile.add(ProfileData.fromJson(value.data['data']) );
      emit(GetProfileSuccessfully());
    })
        .catchError((error) {
      print(error.toString());
      emit(GetProfileError());
    });
  }


  void updateProfileNameAndPassword(
      {
        required String name,
        required String password,
      }
      )
  {
    emit(UpdateProfileLoading());

    DioHelper.PostData(url: updateProfileUrl, data: {
      'name': name,
      'password':password,
    },


    ).then((value) {
      //getProfileNameAndEmail();
      profile.clear();
      getProfileNameAndEmail();

      //print(value.data);

      emit(UpdateProfileSuccessfully(

      ));
    }).catchError((error) {
      print(error.toString());
      emit(UpdateProfileError());
    });
  }

  // change language

  int selectedChoice=1;
  void selectChoice(value){
    selectedChoice=value;
    emit(ChangeSelectedChoiceState());
  }

  void selectSettingNotificationItem(List<NotificationSettingsModel> settings, index,bool value){
      settings[index].mode = value;
      emit(ChangeSettingsItemeState());

  }

  // change password suffix icon

  bool obscure= true;

  void changeIcon() {
    obscure =! obscure;
    print(obscure);
    emit(ChangeIconState());
  }

  String? password;
  int colorIndex=0;
  int colorIndex1=0;
  int colorIndex2=0;

  String? errorText;
  String? errorText2;
  String? errorText3;

  changeColorIndex(index){
    colorIndex=index;
    emit(ChangeColorIndexState());
  }
  changeSecondColorIndex(index){
    colorIndex1=index;
    emit(ChangeSecondColorIndexState());
  }
  changeThirdColorIndex(index){
    colorIndex2=index;
    emit(ChangeThirdColorIndexState());
  }


}
