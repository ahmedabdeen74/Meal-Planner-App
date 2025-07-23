import 'package:flutter/material.dart';
import 'package:meal_planner/core/utility/assets.dart';
import 'package:meal_planner/core/utility/styles.dart';
import 'package:meal_planner/features/home/data/models/meal_model/meal.dart';
import 'package:webview_flutter/webview_flutter.dart';

class VideoInstraction extends StatefulWidget {
  const VideoInstraction({super.key, required this.meal});
  final Meal meal;

  @override
  State<VideoInstraction> createState() => _VideoInstractionState();
}

class _VideoInstractionState extends State<VideoInstraction> {
  bool isVideoVisible = false;
  late final WebViewController _controller;

  String? get videoUrl {
    final url = widget.meal.strYoutube;
    if (url == null || url.isEmpty) return null;
    final videoId = Uri.parse(url).queryParameters['v'];
    return videoId != null ? "https://www.youtube.com/embed/$videoId" : null;
  }

  @override
  void initState() {
    super.initState();
    final url = videoUrl;
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted);
    if (url != null) {
      _controller.loadRequest(Uri.parse(url));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height * .25,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(10, 10),
                    color: Colors.grey.withOpacity(0.4),
                    blurRadius: 40,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: isVideoVisible && videoUrl != null
                    ? WebViewWidget(controller: _controller)
                    : Image.network(
                        widget.meal.strMealThumb ?? "",
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            if (!isVideoVisible)
              Positioned.fill(
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isVideoVisible = true;
                      });
                    },
                    child: Image.asset(
                      AssetsData.video1,
                      width: 64,
                      height: 64,
                    ),
                  ),
                ),
              ),
          ],
        ),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text("Instructions", style: Styles.textStyleSemibold21),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text(
            widget.meal.strInstructions ?? "",
            style: Styles.textStyleregular15,
          ),
        ),
      ],
    );
  }
}
