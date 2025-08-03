import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planner/constants.dart';
import 'package:meal_planner/core/utility/service_locator.dart';
import 'package:meal_planner/features/explore/data/repo/explore_repo_impl.dart';
import 'package:meal_planner/features/explore/presentation/view_models/fetch_area/fetch_area_cubit.dart';
import 'package:meal_planner/features/explore/presentation/view_models/fetch_category/fetch_category_cubit.dart';
import 'package:meal_planner/features/explore/presentation/views/widgets/explore_view_body.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
  providers: [
    BlocProvider(create: (_) => FetchAreaCubit(getIt<ExploreRepoImpl>())..fetchArea()),
    BlocProvider(create: (_) => FetchCategoryCubit(getIt<ExploreRepoImpl>())..fetchCategory()),
  ],
      child: GestureDetector(
        onTap: () {
          hideKeyboardFromScreen(context);
        },
        child: SafeArea(child: ExploreViewBody()),
      ),
    );
  }
}
