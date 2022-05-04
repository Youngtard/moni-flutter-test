import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  final String title;
  final String value;

  const ProfileInfo({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headline3,
        ),
        Expanded(
          child: Text(
            value,
            style: Theme.of(context).textTheme.bodyText1!.copyWith(
              fontSize: 16
            ),
            textAlign: TextAlign.right,
            overflow: TextOverflow.ellipsis,
          ),
        )
      ],
    );
  }
}