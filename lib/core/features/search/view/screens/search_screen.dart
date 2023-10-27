import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:sizer/sizer.dart';

import '../../../../../util/styles/color.dart';
import '../../../../../util/widgets/header.dart';
import '../../../../../util/widgets/search_bar.dart';

enum SearchType { recent, popular }

class SearchScreen extends StatelessWidget {
   SearchScreen({Key? key}) : super(key: key);
TextEditingController searchController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10.h,
        titleSpacing: 10,
        leading: Padding(
          padding: const EdgeInsets.only(left: 24,right: 12),
          child: IconButton(onPressed: () { Navigator.pop(context); }, icon: const Icon(Iconsax.arrow_left),),
        ),

        title: Padding(
          padding:  const EdgeInsets.only(right: 24,top: 14,bottom: 22),
          child: CustomSearchBar(controller: searchController, hintText: 'Type something...',),
        ),


      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CustomHeader('Recent searches'),
            ListView.builder(
                shrinkWrap: true,
                itemCount: recentSearches.length,
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) =>
                    SearchResultTile(recentSearches[index], SearchType.recent)),
            const CustomHeader('Popular searches'),
            ListView.builder(
                shrinkWrap: true,
                itemCount: popularSearches.length,
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => SearchResultTile(
                    popularSearches[index], SearchType.popular)),
          ],
        ),
      ),
    );
  }
}

class SearchResultTile extends StatelessWidget {
  final String tile;
  final SearchType searchType;
  const SearchResultTile(this.tile, this.searchType, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      contentPadding: EdgeInsets.zero,
      leading: Icon(
          searchType == SearchType.recent
              ? Iconsax.clock
              : Iconsax.search_status,
          size: 13.5.sp, color: AppTheme.neutral9,),
      title: Text(
        tile,
        style:  TextStyle(
          color: AppTheme.neutral9,
          fontSize: 11.5.sp,
          fontFamily: 'SFProDisplay',
          fontWeight: FontWeight.w400,

        ),
      ),
      trailing: Icon(
        searchType == SearchType.recent
            ? Iconsax.close_circle
            : Iconsax.arrow_right_2,
        size: 18.5.sp,
        color: searchType == SearchType.recent ? AppTheme.danger5 : AppTheme.primary5,
      ),
    );
  }
}

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