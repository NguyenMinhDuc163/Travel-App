import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/provider/hotel_booking_provider.dart';

class ItemAddGuestAndRoom extends StatefulWidget {
  const ItemAddGuestAndRoom({
    super.key,
    required this.title,
    required this.icon,
    required this.initDate,
    required this.onValueChanged,
  });

  final String title;
  final String icon;
  final int initDate;
  final ValueChanged<int> onValueChanged;

  @override
  State<ItemAddGuestAndRoom> createState() => _ItemAddGuestAndRoomState();
}

class _ItemAddGuestAndRoomState extends State<ItemAddGuestAndRoom> {
  late final TextEditingController _textEditingController;
  final FocusNode _focusNode = FocusNode();
  late int number;

  @override
  void initState() {
    super.initState();
    number = widget.initDate;
    _textEditingController = TextEditingController(
      text: widget.initDate.toString(),
    )..addListener(() {
      setState(() {
        number = int.parse(_textEditingController.text);
        widget.onValueChanged(number);  // Gọi callback khi giá trị thay đổi
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kTopPadding),
        color: Colors.white,
      ),
      margin: EdgeInsets.only(bottom: kMediumPadding),
      padding: EdgeInsets.all(kMediumPadding),
      child: Row(
        children: [
          ImageHelper.loadFromAsset(widget.icon),
          SizedBox(width: kDefaultPadding),
          Text(widget.title), // lấy data từ class trên
          Spacer(),
          GestureDetector(
            onTap: () {
              if (number > 1) {
                setState(() {
                  number--;
                  _textEditingController.text = number.toString();
                  if (_focusNode.hasFocus) {
                    _focusNode.unfocus();
                  }
                  widget.onValueChanged(number);  // Gọi callback khi giá trị thay đổi
                });
              }
            },
            child: ImageHelper.loadFromAsset(AssetHelper.icoDecre),
          ),
          Container(
            height: 35,
            width: 60,
            padding: EdgeInsets.only(left: 3),
            alignment: Alignment.center,
            child: TextField(
              controller: _textEditingController,
              textAlign: TextAlign.center,
              focusNode: _focusNode,
              enabled: true,
              autocorrect: false,
              minLines: 1,
              maxLines: 1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                contentPadding: const EdgeInsets.only(
                  bottom: 18,
                ),
              ),
              onChanged: (value) {},
              onSubmitted: (String submitValue) {
                widget.onValueChanged(number);  // Gọi callback khi giá trị thay đổi
              },
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                number++;
                _textEditingController.text = number.toString();
                if (_focusNode.hasFocus) {
                  _focusNode.unfocus();
                }
                widget.onValueChanged(number);  // Gọi callback khi giá trị thay đổi
              });
            },
            child: ImageHelper.loadFromAsset(AssetHelper.icoIncre),
          ),
        ],
      ),
    );
  }
}
