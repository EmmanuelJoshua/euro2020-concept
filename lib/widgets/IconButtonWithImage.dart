import 'package:flutter/material.dart';

class IconButtonWithImage extends StatelessWidget {
  const IconButtonWithImage({
    Key? key,
    required this.onPressed,
    required this.asset,
  }) : super(key: key);

  final Function? onPressed;
  final String? asset;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed,
      child: Container(
        padding: const EdgeInsets.all(2),
        alignment: Alignment.center,
        child: Image.asset(
          asset!,
          width: 28,
        ),
      ),
    );
  }
}
