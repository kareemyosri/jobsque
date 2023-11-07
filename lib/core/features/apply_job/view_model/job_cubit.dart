import 'dart:io';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/util/database/local_database/cache_helper.dart';
import 'package:jobsque/util/database/remoteDatabase/DioHelper.dart';
import 'package:jobsque/util/enums.dart';
import 'package:meta/meta.dart';

import '../../../../util/database/remoteDatabase/endpoints.dart';
import '../view/widgets/type_of_work_item_tile.dart';

part 'job_state.dart';

class JobCubit extends Cubit<JobState> {
  JobCubit() : super(JobInitial());
  static JobCubit get(context)=>BlocProvider.of(context);
  int activeIndex = 0;
  void changeIndex(index){
    activeIndex=index;
    emit(ChangeIndexState());
  }

  int currentStep = 0;
  void addStep(){

      currentStep=currentStep+1;


    print(currentStep);
    emit(ChangeAddStepState());
  }

  void minusStep(){

    currentStep=currentStep-1;


    print(currentStep);
    emit(ChangeMinusStepState());
  }

  int? selectedChoice;
  // bool isSelected=false ;

  void selectChoice(value){
    selectedChoice=value;
   // isSelected=true;
    emit(ChangeSelectedChoiceState());
  }

  final List<TypeofWorkTile> typeOfWorkTiles = [
    TypeofWorkTile(title: 'Senior UX Designer', subtitle: 'CV  Portfolio.pdf', value: 1,),
    TypeofWorkTile(title: 'Senior UX Designer', subtitle: 'CV  Portfolio.pdf', value: 2),
    TypeofWorkTile(title: 'Senior UX Designer', subtitle: 'CV  Portfolio.pdf', value: 3,),
    TypeofWorkTile(title: 'Senior UX Designer', subtitle: 'CV  Portfolio.pdf', value: 4,),
  ];

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




  void applyJob(
      String name,
      String email,
      String mobile,
      String jobsId,

      ) async {


    try {
      emit(ApplyJobLoadingState());



      FormData formData = FormData.fromMap({
        'cv_file': await MultipartFile.fromFile(selectedCVFile!.path),
        'name': name,
        'email': email,
        'mobile': mobile,
        'work_type': 'full',
        'other_file': await MultipartFile.fromFile(selectedOtherFile!.path),
        'jobs_id': jobsId,
        'user_id': CashHelper.getString(key: MySharedKeys.userId), // Replace with your user ID
      });
      print(formData.length);

      final response = await DioHelper.PostFormData(url: applyJobURL, data: formData);

      if (response.statusCode == 200) {
        print(response.data);
        emit(ApplyJobSuccessState());
      } else {
        print('Request failed with status: ${response.statusCode}');
        emit(ApplyJobErrorState());
      }
    } catch (error) {
      print(error);
      emit(ApplyJobErrorState());
    }
  }














}
