import 'package:flutter/material.dart';
import 'package:meal_planner/features/search/presentation/views/widgets/custom_text_field.dart';
import 'package:meal_planner/features/search/presentation/views/widgets/first_search_body_view.dart';
import 'package:meal_planner/features/search/presentation/views/widgets/list_view_custom_search_result_item.dart';
import 'package:meal_planner/features/search/presentation/views/widgets/list_view_search_result_item.dart';
import 'package:meal_planner/features/search/presentation/views/widgets/search_view_app_bar.dart';

class SearchViewBodyLoaded extends StatelessWidget {
  const SearchViewBodyLoaded({super.key, this.onTapBack, this.onTapRemove, this.controller});
  final void Function()? onTapBack;
  final void Function()? onTapRemove;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SearchViewAppBar(),
          SizedBox(height: 32),
          CustomTextField(
            controller: controller,
            suffixIcon: GestureDetector(onTap: onTapRemove, child: Icon(Icons.close)),
            prefixIcon: GestureDetector(
              onTap: onTapBack,
              child: Icon(Icons.arrow_back),
            ),
          ),
          Divider(color: Color(0xff757780), thickness: 1.5, height: 1),
          Container(
            decoration: BoxDecoration(
              color: Color(0xffEEEFF3),
              borderRadius: BorderRadius.circular(16),
            ),
            //  height: 300,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListViewSearchResultItem(),
                  SizedBox(height: 16),
                  Divider(color: Color(0xffC5C6D0), thickness: 1, height: 1),
                  ListViewCustomSearchResultItem(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
