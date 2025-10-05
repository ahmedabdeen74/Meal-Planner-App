const String baseUrl = 'https://www.themealdb.com/api/json/v1/1/';

class AppEndpoints {
  static String randomMeal = '${baseUrl}random.php';
  static String mealDetails(String id) => '${baseUrl}lookup.php?i=$id';
  static String searchMeal(String name) => '${baseUrl}search.php?s=$name';
  static String fetchArea = '${baseUrl}list.php?a=list';
  static String fetchCategory = '${baseUrl}list.php?c=list';
  static String filterByArea(String area) => '${baseUrl}filter.php?a=$area';
  static String filterByCategory(String category) => '${baseUrl}filter.php?c=$category';
  
  

}
