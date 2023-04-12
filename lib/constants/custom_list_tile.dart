// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final Widget title;
  Widget? leading;
  Widget? subtitle;
  Widget? trailing;
  CustomListTile({super.key, required this.title, this.leading, this.subtitle, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              leading ?? Container(),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title,
                  const SizedBox(height: 7),
                  subtitle ?? Container(),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: trailing ?? Container(),
        ),
      ],
    );
  }
}