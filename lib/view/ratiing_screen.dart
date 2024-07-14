import 'package:flutter/material.dart';

import '../res/core/constants/dimension_constants.dart';
import '../res/core/helpers/Text/review.dart';
import '../res/core/helpers/asset_helper.dart';
import '../res/widget/app_bar_container.dart';
import '../res/widget/evaluation_widget.dart';
import '../res/widget/feedback_widget.dart';
class RattingScreen extends StatefulWidget {
  const RattingScreen({super.key});
  static const String routeName = '/ratting_scrren';
  @override
  State<RattingScreen> createState() => _RattingScreenState();
}

class _RattingScreenState extends State<RattingScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  double _rating = 0.0;

  void _submitReview() {
    if (_formKey.currentState!.validate()) {
      // Xử lý gửi đánh giá
      String name = _nameController.text;
      String comment = _commentController.text;
      double rating = _rating;

      // Thực hiện logic gửi đánh giá (ví dụ: gửi lên server hoặc lưu vào cơ sở dữ liệu)
      print('Name: $name');
      print('Rating: $rating');
      print('Comment: $comment');

      // Clear form sau khi gửi
      _nameController.clear();
      _commentController.clear();
      setState(() {
        _rating = 0.0;
      });

      // Hiển thị thông báo
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Đánh giá của bạn đã được gửi')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContinerWidget(
      titleString: 'Reviews',
      child: SingleChildScrollView(
        child: Column(
          children: [
            const EvaluationWidget(score: 4.9),
            const SizedBox(height: kDefaultPadding),
            const FeedBackWidget(
              avatar: AssetHelper.person,
              name: 'Nguyen Minh Duc',
              rate: 4,
              comment: Review.rv1,
              image: [AssetHelper.comment1, AssetHelper.comment2],
              time: 24,
            ),
            const SizedBox(height: kDefaultPadding),
            const FeedBackWidget(
              avatar: AssetHelper.avt2,
              name: 'Nguyen Van Nam',
              rate: 4,
              comment: Review.rv2,
              image: [AssetHelper.room3, AssetHelper.room4],
              time: 11,
            ),
            const SizedBox(height: kDefaultPadding),
            const FeedBackWidget(
              avatar: AssetHelper.avt1,
              name: 'Hoang Son Hai',
              rate: 5,
              comment: Review.rv3,
              image: [AssetHelper.room1, AssetHelper.hotel3],
              time: 43,
            ),
            const SizedBox(height: kDefaultPadding),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(labelText: 'Name'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _commentController,
                      decoration: InputDecoration(labelText: 'Comment'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your comment';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: kDefaultPadding),
                    Text('Rating: $_rating'),
                    Slider(
                      value: _rating,
                      min: 0,
                      max: 5,
                      divisions: 5,
                      onChanged: (value) {
                        setState(() {
                          _rating = value;
                        });
                      },
                    ),
                    SizedBox(height: kDefaultPadding),
                    ElevatedButton(
                      onPressed: _submitReview,
                      child: Text('Submit Review'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
