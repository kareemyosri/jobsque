import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/util/database/remoteDatabase/DioHelper.dart';
import 'package:meta/meta.dart';

import '../../../../util/database/remoteDatabase/endpoints.dart';
import '../model/job_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context)=>BlocProvider.of(context);
  List<JobData> recentJobsData=[];
  void getAllRecentJobs(){
    emit(GetAllRecentJobsLoading());
    DioHelper.getData(url: allJobsURL)
        .then((value) {
          for(var job in value.data['data']){
            recentJobsData.add(JobData.fromJson(job));
          }
          print(recentJobsData);
          emit(GetAllRecentJobsSuccessfully());
    })
        .catchError((error){
          print(error.toString());
          emit(GetAllRecentJobsError());
    });


  }

}
