import 'package:flutter/material.dart';
import 'package:meal_planner/core/utility/assets_generator.dart';
import 'package:meal_planner/core/utility/styles.dart';
import 'package:meal_planner/features/search/presentation/views/widgets/custom_text_field.dart';
import 'package:meal_planner/features/search/presentation/views/widgets/list_view_search_item.dart';
import 'package:meal_planner/features/search/presentation/views/widgets/search_view_app_bar.dart';

class FirstSearchBodyView extends StatelessWidget {
  const FirstSearchBodyView({super.key, this.onChanged, this.onTap});
  final void Function(String)? onChanged;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SearchViewAppBar(),
          SizedBox(height: 32),
          CustomTextField(onChanged: onChanged, onTap: onTap),
          SizedBox(height: 32),
          Text("Recent Searches", style: Styles.textStyleMedium18),
          SizedBox(height: 16),
          ListViewSearchItem(
            searchIcoon: Image.asset(Assets.imagesSearchIconPurple),
          ),
          SizedBox(height: 16),
          Text("Popular Searches", style: Styles.textStyleMedium18),
          SizedBox(height: 16),
          ListViewSearchItem(
            searchIcoon: Image.asset(Assets.imagesPopularSearch),
          ),
        ],
      ),
    );
  }
}
