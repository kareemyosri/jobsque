import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/util/database/remoteDatabase/DioHelper.dart';
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
    emit(ChangeStepState());
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

  void applyJob(
      String cvFile,
      String name,
      String email,
      String mobile,
      String workType,
      String otherFile,
      String jobsId,
      String userId
      ){
    emit(ApplyJobLoadingState());
    DioHelper.PostData(url: applyJobURL,
        data: {
      'cv_file':cvFile,
       'name':name,
          'email':email,
          'mobile':mobile,
          'work_type':workType,
          'other_file':otherFile,
          'jobs_id':jobsId,
          'user_id':userId
        }

    )

        .then((value) {
      print(value.data);
      emit(ApplyJobSuccessState());
    }
    )
        .catchError((error){
          print(error.toString());
          emit(ApplyJobErrorState());
    });
  }





}
