import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobsque/core/database/local_database/cache_helper.dart';
import 'package:jobsque/core/database/remoteDatabase/endpoints.dart';
import 'package:jobsque/core/enums.dart';
import 'package:meta/meta.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../core/database/remoteDatabase/DioHelper.dart';
import '../model/NotificationSettingsModel.dart';
import '../model/portfolio_model.dart';
import '../model/profile_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState>  {
  ProfileCubit() : super(ProfileInitial());



  static ProfileCubit get(context)=>BlocProvider.of(context);

  Set<String> completeProfile={};
  void addItem(String item){
    emit(AddItemCompleteProfileLoading());
    completeProfile.add(item);
    if(completeProfile.length==4){
      CashHelper.putString(key: MySharedKeys.completeProfile, value: 'true');
    }
    emit(AddItemCompleteProfile());
  }

List<Portfolio> portfolios=[];
List<Profile> profileDetails=[];

  getProfileDetailsAndPortfolios(){
    emit(GetPortfolioLoading());
    DioHelper.getData(url: portofolioUrl)
        .then((value) {
         // print(value.data);
      // for (var portfolio in value.data['data']['portfolio']) {
      //   portfolios.add(Portfolio.fromJson(portfolio));
      //   print(portfolio);
      // }
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


  File? selectedCVFile;
  File? selectedOtherFile;


  Future<void> pickFile(String target) async {
    emit(PickCVLoading());
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: target == 'CV' ? ['pdf'] : ['jpg', 'png','heic','jpeg','gif','svg'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);

      if (target == 'CV') {
        selectedCVFile = file;
      } else if (target == 'Other') {
        selectedOtherFile = file;
      }
      emit(PickCVSuccess());


    } else {
      emit(PickCVError());
      return;
    }
  }



   File? savedImage;




  Future<void> pickAndSaveProfileImage() async {
    final ImagePicker picker = ImagePicker();
       emit(PickImageLoading());


    try {
      final XFile? imageFile = await picker.pickImage(source: ImageSource.gallery);

      if (imageFile == null) {
        emit(PickImageError());

        // User canceled image selection
        return;
      }

      // Get the application documents directory where you want to save the image.
      final Directory directory = await getApplicationDocumentsDirectory();

      final String imagePath = '${directory.path}/profile_image.png';
     // final String imagePath = '${_appDirectory.path}/profile_image.png';

      print(' from picked $imagePath');

      // Check if the old image exists and delete it.
      final File oldImage = File(imagePath);
      if (await oldImage.exists()) {

        await oldImage.delete();
       // emit(OldImageDeleted());

      }

      // Move the selected image to the desired location.
      //final File newImage = File(imageFile.path);
      savedImage = await File(imageFile.path).copy(imagePath);

      emit(PickImageSuccess());

    } catch (e) {
      print("Error picking and saving image: $e");
      emit(PickImageError());
    }
  }

  Future<void> loadSavedProfileImage() async {
    emit(GetImageLoading());

    try {
      final Directory directory = await getApplicationDocumentsDirectory();
      final String imagePath = '${directory.path}/profile_image.png';
      //final String imagePath = '${_appDirectory.path}/profile_image.png';

      print(' from device load $imagePath');

        savedImage = File(imagePath);

      if (await savedImage!.exists()) {
        emit(GetImageSuccess());
      }
      else{
        savedImage=null;
        emit(GetImageError());

      }
    } catch (e) {
      print("Error loading saved profile image: $e");
      emit(GetImageError());

    }
  }

  @override
  Future<void> close() {
    // TODO: implement close
    return super.close();
  }
}




// void addPortofolio(
  //
  //     ) async {
  //
  //
  //   try {
  //     emit(AddCVLoadingState());
  //
  //
  //
  //     FormData formData = FormData.fromMap({
  //       'cv_file': await MultipartFile.fromFile(selectedCVFile!.path),
  //
  //       'image': await MultipartFile.fromFile(selectedCVFile!.path),
  //
  //     });
  //
  //
  //     final response = await DioHelper.PostFormData(url: portofolioUrl, data: formData);
  //
  //     if (response.statusCode == 200) {
  //       print(response.data);
  //       emit(AddCVSuccessState());
  //     } else {
  //       print('Request failed with status: ${response.statusCode}');
  //       emit(AddCVErrorState());
  //     }
  //   } catch (error) {
  //     print(error);
  //     emit(AddCVErrorState());
  //   }
  // }



