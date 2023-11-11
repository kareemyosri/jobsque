import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/features/saved_job/model/favourite_model.dart';
import 'package:jobsque/util/database/local_database/cache_helper.dart';
import 'package:jobsque/util/database/remoteDatabase/DioHelper.dart';
import 'package:jobsque/util/enums.dart';
import 'package:meta/meta.dart';

import '../../../../util/database/remoteDatabase/endpoints.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  List<JobData> recentJobsData = [];

  void getAllRecentJobs() {
    emit(GetAllRecentJobsLoading());
    DioHelper.getData(url: allJobsURL)
        .then((value) {
      for (var job in value.data['data']) {
        recentJobsData.add(JobData.fromJson(job));
      }

      emit(GetAllRecentJobsSuccessfully());
    })
        .catchError((error) {
      print(error.toString());
      emit(GetAllRecentJobsError());
    });
  }

  List<JobData> suggestJobsData = [];

  void getAllSuggestJobs() {
    emit(GetAllSuggestJobsLoading());
    DioHelper.getData(url: suggestJobsURL)
        .then((value) {
      suggestJobsData.add(JobData.fromJson(value.data['data']));


      emit(GetAllSuggestJobsSuccessfully());
    })
        .catchError((error) {
      print(error.toString());
      emit(GetAllSuggestJobsError());
    });
  }

  List<FavouriteData> favouriteItems=[];
  void getFavouriteJobs() {
    favouriteItems=[];
    emit(GetFavouriteJobsLoading());
    DioHelper.getData(url: favouriteJobsURL)
        .then((value) {
      for (var job in value.data['data']) {
        favouriteItems.add(FavouriteData.fromJson(job));
        print(job);
      }


      emit(GetFavouriteJobsSuccessfully());
    })
        .catchError((error) {
      print(error.toString());
      emit(GetFavouriteJobsError());
    });
  }


  bool checkFavourite(var id) {
    print('checkkkkkiing');
    for (var job in favouriteItems) {
      if (job.jobId == id) {
        return true;
      }
    }
    return false;
  }



  void addFavourite(JobData job){
      emit(AddFavouriteJobsLoading());
      DioHelper.PostData(url: favouriteJobsURL, query: {
        'user_id':CashHelper.getString(key: MySharedKeys.userId),
        'job_id':job.id
      })
          .then((value) {
       // favouriteItems.add(job);
        getFavouriteJobs();


        print(value.data);
        emit(AddFavouriteJobsSuccessfully());
      })
          .catchError((error) {
        print(error.toString());
        emit(AddFavouriteJobsError());
      });
    }


  removeFavourite(String id) {
    emit(RemoveFavouriteItemLoadingState());
    return DioHelper.deleteData(url: '$favouriteJobsURL/$id').then((value) {
      //favouriteItems.removeWhere((element) => element.id == job.id);
      getFavouriteJobs();
      emit(RemoveFavouriteItemSuccessfullyState());
    }).catchError((error) {
      print(error.toString());
      print(RemoveFavouriteItemErrorState());
    });
  }

  handleFavourite(JobData job) {
    if (checkFavourite(job.id!)) {

      removeFavourite(searchFavouriteIdToRemoveItem(job.id!) );

    } else {
      addFavourite( job);
    }
  }

  searchFavouriteIdToRemoveItem(int id){
   for (var job in favouriteItems) {
     if (job.jobId == id) {
       print(job.id.toString());
       print('$favouriteJobsURL/${job.id.toString()}');
       return job.id.toString();
     }
   }
 }

 @override
  Future<void> close() {
    // TODO: implement close
    return super.close();
  }



}
