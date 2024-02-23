import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/helpers/Text/review.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';
import 'package:travel_app/representation/widgets/evaluation_widget.dart';

import '../../core/helpers/asset_helper.dart';
import '../widgets/feedback_widget.dart';

class RattingScreen extends StatefulWidget {
  const RattingScreen({super.key});
  static const String routeName = '/ratting_scrren';
  @override
  State<RattingScreen> createState() => _RattingScreenState();
}

class _RattingScreenState extends State<RattingScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContinerWidget(
      titleString: 'Reviews',
      child: SingleChildScrollView(
        child: Column(
          children: const [
            EvaluationWidget(score: 4.9),
            SizedBox(height: kDefaultPadding,),
            FeedBackWidget(
              avatar: AssetHelper.person,
              name: 'Nguyen Minh Duc',
              rate: 3,
              comment:
                  Review.rv1,
              image: [AssetHelper.comment1,AssetHelper.comment2], time: 24,
            ),
            SizedBox(height: kDefaultPadding,),
            FeedBackWidget(
              avatar: AssetHelper.person,
              name: 'Nguyen Minh Duc',
              rate: 4,
              comment:
              Review.rv1,
              image: [AssetHelper.comment1,AssetHelper.comment2], time: 24,
            ),
            SizedBox(height: kDefaultPadding,),
            FeedBackWidget(
              avatar: AssetHelper.person,
              name: 'Nguyen Minh Duc',
              rate: 5,
              comment:
              Review.rv1,
              image: [AssetHelper.comment1,AssetHelper.comment2], time: 24,
            ),
          ],
        ),
      ),
    );
  }
}
