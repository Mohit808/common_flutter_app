// Custom Suggestions

import 'package:flutter/material.dart';
import 'package:modular_ui_package/common_functions/image_network.dart';
import 'package:modular_ui_package/text_atoms/text_common.dart';
import 'package:modular_ui_package/theme/app_colors.dart';
import 'package:modular_ui_package/utils/utils.dart';
import 'package:searchfield/searchfield.dart';


class UserSelect extends StatefulWidget {
  const UserSelect({super.key});

  @override
  State<UserSelect> createState() => _UserSelectState();
}

class UserModelTest{
  String? name;
  String? email;
  UserModelTest({this.name,this.email});
}
class _UserSelectState extends State<UserSelect> {
  final List<UserModelTest> users = [];

  @override
  void initState() {
    super.initState();
    users.add(UserModelTest(name: "Amit Yadav",email: "Amityadav@gmail.com"));
    users.add(UserModelTest(name: "Abhinav saxena",email: "Abhinav@gmail.com"));
  }

  @override
  Widget build(BuildContext context) {
    return SearchField<UserModelTest>(
      maxSuggestionsInViewPort: 5,
      itemHeight: 50,
      onTapOutside: (v){
        hideKeyboard();
      },
      hint: 'Search for users',
      suggestionsDecoration: SuggestionDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
        ),
      ),
      suggestionItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          shape: BoxShape.rectangle,
          border: Border.all(
              color: Colors.transparent,
              style: BorderStyle.solid,
              width: 1.0)),
      searchInputDecoration: SearchInputDecoration(contentPadding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
        filled: true,
        searchStyle: TextStyle(fontSize: 12),
        hintStyle: TextStyle(fontSize: 12),
        fillColor: AppColors.scaffoldBackgroundColor,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade500,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(8.0),
        ),
        border: OutlineInputBorder(),
      ),
      marginColor: Colors.grey.shade300,
      suggestions: users
          .map((e) => SearchFieldListItem<UserModelTest>(e.name!,
          child: SmallText(text: "${e.name}")))
          .toList(),
    );
  }
}