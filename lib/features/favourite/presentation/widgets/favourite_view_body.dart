import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_planner/constants.dart';
import 'package:meal_planner/core/utility/styles.dart';
import 'package:meal_planner/features/explore/presentation/views/widgets/list_view_meal_explore_card.dart';
import 'package:meal_planner/features/favourite/data/local/Favourite/add_meal_cubit.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal.dart';

class FavouriteViewBody extends StatelessWidget {
  const FavouriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddMealCubit, AddMealState>(
      listener: (context, state) {
        // إظهار رسائل للمستخدم
        if (state is RemoveMealSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Meal removed from favorites'),
              backgroundColor: Colors.green,
              duration: Duration(seconds: 2),
            ),
          );
        } else if (state is AddMealFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errMessage),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 3),
            ),
          );
        }
      },
      builder: (context, state) {
        List<Meal> meals = [];
        
       /* if (state is MealsLoaded) {
          meals = state.meals.reversed.toList();
        } else if (state is AddMealSuccess) {
          meals = state.meals.reversed.toList();
        } else if (state is RemoveMealSuccess) {
          meals = state.meals.reversed.toList();
        } else if (state is AddMealLoading) {
          */
          meals = context.read<AddMealCubit>().favoriteMeals.reversed.toList();
        

        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Text("Your Favourites", style: Styles.textStyleregular36),
                  const SizedBox(width: 16),
                  const Icon(Icons.favorite, color: Colors.red),
                ],
              ),
              const SizedBox(height: 16),
              
              // المحتوى الرئيسي
              Expanded(
                child: _buildContent(context, state, meals),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContent(BuildContext context, AddMealState state, List<Meal> meals) {
    /*// حالة التحميل الأولى
    if (state is AddMealInitial) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }*/

    // حالة الخطأ
    if (state is AddMealFailure) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              "Error: ${state.errMessage}",
              style: Styles.textStyleMedium18,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => context.read<AddMealCubit>().refreshFavorites(),
              child: const Text("Try Again"),
            ),
          ],
        ),
      );
    }

    // لا توجد وجبات مفضلة
    if (meals.isEmpty) {
      return const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_border,
              size: 64,
              color: Colors.grey,
            ),
            SizedBox(height: 16),
            Text(
              "No Favorites yet, Add Now !",
              style: Styles.textStyleMedium18,
            ),
          ],
        ),
      );
    }

    // عرض القائمة
    return CustomScrollView(
      slivers: [
        // مؤشر التحميل أثناء العمليات
        if (state is AddMealLoading)
          const SliverToBoxAdapter(
            child: LinearProgressIndicator(),
          ),
        
        const SliverToBoxAdapter(child: SizedBox(height: 8)),
        
        // قائمة الوجبات
        ListViewMealExploreCard(
          meals: meals,
          iconButtonBuilder: (context, index) => IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () => _showDeleteDialog(context, meals[index]),
          ),
        ),
      ],
    );
  }

  void _showDeleteDialog(BuildContext context, Meal meal) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        backgroundColor: kAlertColor,
        title: const Text("Confirm Delete"),
        content: Text(
          "Are you sure you want to remove '${meal.strMeal ?? 'this meal'}' from favorites?",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(dialogContext).pop(),
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(dialogContext).pop();
              // استخدام context الأصلي وليس dialogContext
              await context.read<AddMealCubit>().deleteMeal(meal);
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }
}