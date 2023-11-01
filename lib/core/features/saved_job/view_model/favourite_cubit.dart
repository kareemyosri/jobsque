import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../util/database/local_database/cache_helper.dart';
import '../../../../util/database/remoteDatabase/DioHelper.dart';
import '../../../../util/database/remoteDatabase/endpoints.dart';
import '../../../../util/enums.dart';
import '../model/favourite_model.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());
 static FavouriteCubit get(context)=>BlocProvider.of(context);

  // List<FavouriteData> favouriteItems=[];
  // void getFavouriteJobs() {
  //   favouriteItems=[];
  //   emit(GetFavouriteJobsLoading());
  //   DioHelper.getData(url: favouriteJobsURL)
  //       .then((value) {
  //     for (var job in value.data['data']) {
  //       favouriteItems.add(FavouriteData.fromJson(job));
  //       print(job);
  //     }
  //
  //
  //     emit(GetFavouriteJobsSuccessfully());
  //   })
  //       .catchError((error) {
  //     print(error.toString());
  //     emit(GetFavouriteJobsError());
  //   });
  // }
}
