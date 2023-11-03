import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/util/database/remoteDatabase/endpoints.dart';
import 'package:meta/meta.dart';

import '../../../../util/database/remoteDatabase/DioHelper.dart';
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
          print(profileDetails);




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
}
      )
  {
    emit(UpdateProfileDetailsLoading());

    DioHelper.PutData(url: editProfile, data: {
      'interested_work': interestedWork,
      'mobile':mobile,
      'address':address
    },


    ).then((value) {

      print(value.data);

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
      print(value.data);
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
      getProfileNameAndEmail();
      profile.clear();
      getProfileNameAndEmail();

      print(value.data);

      emit(UpdateProfileSuccessfully(

      ));
    }).catchError((error) {
      print(error.toString());
      emit(UpdateProfileError());
    });
  }


}
