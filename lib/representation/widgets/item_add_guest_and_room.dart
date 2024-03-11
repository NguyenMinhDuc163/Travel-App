import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dimension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';

class ItemAddGuestAndRoom extends StatefulWidget {
  const ItemAddGuestAndRoom(
      {super.key,
      required this.title,
      required this.icon,
      required this.initDate});
  final String title;
  final String icon;
  final int initDate;
  @override
  State<ItemAddGuestAndRoom> createState() => _ItemAddGuestAndRoomState();
}

class _ItemAddGuestAndRoomState extends State<ItemAddGuestAndRoom> {
  late final TextEditingController _textEditingController ;
  final FocusNode _focusNode = FocusNode();
  late int number;

  @override
  void initState() { // khi text duoc thay doi thi gtr dc gan lai vao num
    super.initState();
    number = widget.initDate;
    _textEditingController = TextEditingController(text: widget.initDate.toString())..addListener(() {
      number = int.parse(_textEditingController.text);
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
          SizedBox(width: kDefaultPadding,),
          Text(widget.title,), // lay data tu class tren
          Spacer(),
          GestureDetector(
            onTap: (){
              // neu nho hon 1 thi khong lm gi nua
              if(number > 1){
                setState(() {
                  number--;
                  _textEditingController.text = number.toString();
                  if(_focusNode.hasFocus){
                    _focusNode.unfocus();
                  }
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
              onSubmitted: (String submitValue) {},
            ),
          ),

          GestureDetector(
            onTap: (){
              setState(() {
                number++;
                _textEditingController.text = number.toString();
                if(_focusNode.hasFocus){
                  _focusNode.unfocus();
                }
              });
            },
            child: ImageHelper.loadFromAsset(AssetHelper.icoIncre),
          ),
        ],
      ),
    );
  }
}
