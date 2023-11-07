import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/core/features/saved_job/model/favourite_model.dart';
import 'package:meta/meta.dart';
import 'package:sizer/sizer.dart';

import '../../../../util/database/remoteDatabase/DioHelper.dart';
import '../../../../util/database/remoteDatabase/endpoints.dart';
import '../../../../util/styles/color.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());
static SearchCubit get(context)=>BlocProvider.of(context);

  List<String> recentSearches = [
    'Junior UI Designer',
    'Junior UX Designer',
    'Product Designer',
    'Project Manager',
    'UI/UX Designer',
    'Front-End Developer',
  ];

  List<String> popularSearches = [
    'UI/UX Designer',
    'Project Manager',
    'Product Designer',
    'UX Designer',
    'Front-End Developer',
  ];


  bool isSearching = false;
  late String searchKey;
  void searchTextChanged(String text) {
    searchKey = text;
    if (text.isEmpty) {
      isSearching = false;
    } else {
      isSearching = true;
    }
  }

  List<JobData> foundResults = [];
  void searchJob({required String name}) {
    foundResults.clear();
    searchTextChanged(name);
    emit(SearchLoading());

    DioHelper.PostData(url: searchJobUrl,data: {'name':name}).then((value) {
      for (var job in value.data['data']) {
        foundResults.add(JobData.fromJson(job));
      }
      if (foundResults.isEmpty) {
        emit(SearchEmpty());
      } else {
        emit(SearchLoaded());
      }
    }).catchError((error) {
      print(error);
      emit(SearchError());
    });
  }
  String? selectedValue ;

  changeSelectedSalary(String? value){
    selectedValue=value;
    emit(ChangeSalaryFilter());
  }

  List<DropdownMenuItem<String>> menuItems = [
    DropdownMenuItem(
        value: "",
        child: Text(
          'Select Salary',
          style: TextStyle(
            color: AppTheme.neutral9,
            fontSize: 11.5.sp,
            fontFamily: 'SFProDisplay',
            fontWeight: FontWeight.w500,
          ),
        )),
    DropdownMenuItem(
        value: "16",
        child: Text(
          '\$16K - \$17K',
          style: TextStyle(
            color: AppTheme.neutral9,
            fontSize: 11.5.sp,
            fontFamily: 'SFProDisplay',
            fontWeight: FontWeight.w500,
          ),
        )),
    DropdownMenuItem(
        value: "18",
        child: Text(
          '\$18K - \$19K',
          style: TextStyle(
            color: AppTheme.neutral9,
            fontSize: 11.5.sp,
            fontFamily: 'SFProDisplay',
            fontWeight: FontWeight.w500,
          ),
        )),
    DropdownMenuItem(
        value: "20",
        child: Text(
          '\$20K - \$21K',
          style: TextStyle(
            color: AppTheme.neutral9,
            fontSize: 11.5.sp,
            fontFamily: 'SFProDisplay',
            fontWeight: FontWeight.w500,
          ),
        )),

  ];

  fetchDataWithFilters({
    String? location,
    String? salary,

  }) {
    foundResults.clear();

    emit(SearchLoading());
    DioHelper.PostData(
      url: searchJobUrl,
      data: {
        'name': searchKey,
        'location': location,
        'salary': selectedValue,

      },
    ).then((value) {
      print(value.data);
      for (var job in value.data['data']) {
        foundResults.add(JobData.fromJson(job));
      }
      if (foundResults.isEmpty) {
        emit(SearchEmpty());
      } else {
        emit(SearchLoaded());
      }
    }).catchError((error) {
      print(error.toString());
      emit(FilterError());
    });
  }


  List<String> jobTypeFilter=[];
  void addItem(String work){
    jobTypeFilter.add(work);
    emit(ChangeJobTypeColor());
  }
  void deleteItem(String work){
    jobTypeFilter.remove(work);
    emit(ChangeJobTypeColor());
  }





}
