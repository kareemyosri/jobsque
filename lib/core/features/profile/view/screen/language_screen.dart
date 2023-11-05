import 'package:flutter/material.dart';
import 'package:jobsque/core/features/profile/model/languageModel.dart';

import '../../../../../util/widgets/app_bar.dart';
import '../widgets/language_item.dart';


class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('Language',context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(children: [
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: languages.length,
              itemBuilder: (BuildContext context, int index) =>
                  CustomLanguageItem(index + 1, languages[index]),
              separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
            ),
          ]),
        ),
      ),
    );
  }
}
