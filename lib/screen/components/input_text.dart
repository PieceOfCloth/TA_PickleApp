import 'package:flutter/material.dart';
import 'package:pickleapp/theme.dart';

// ignore: must_be_immutable
class MyInputTextMust extends StatelessWidget {
  final String title;
  final String placeholder;
  TextEditingController? value;
  final Widget? widget;

  MyInputTextMust({
    super.key,
    required this.title,
    required this.placeholder,
    required this.value,
    this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: subHeaderStyleGrey,
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          padding: const EdgeInsets.only(
            left: 10,
            right: 10,
          ),
          alignment: Alignment.centerLeft,
          height: 40,
          width: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Expanded(
                child: TextFormField(
                  readOnly: widget == null ? false : true,
                  keyboardType: TextInputType.text,
                  textCapitalization: TextCapitalization.sentences,
                  autofocus: false,
                  style: textStyle,
                  decoration: InputDecoration(
                    hintText: placeholder,
                    hintStyle: textStyleGrey,
                  ),
                  controller: value,
                  // onChanged: (v) {
                  //   value = v;
                  // },
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'You need to fill these input, please';
                    } else {
                      return null;
                    }
                  },
                ),
              ),
              widget == null
                  ? Container()
                  : Container(
                      child: widget,
                    ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
