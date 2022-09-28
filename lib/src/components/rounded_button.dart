import 'package:flutter/material.dart';

/// A button with a rounded shape and an icon
class RoundedButton extends StatelessWidget {
  // ignore: public_member_api_docs
  const RoundedButton({
    super.key,
    this.color = Colors.white,
    this.iconColor = Colors.black,
    required this.press,
    required this.icon,
  });

  /// A variable that is used to store the icon that is passed in.
  final IconData icon;

  /// Declaring a variable called `color` of type `Color`.
  final Color color;

  /// Declaring a variable called `iconColor` of type `Color`.
  final Color iconColor;

  /// A function that is called when the button is pressed.
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 40,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(color),
        ),
        onPressed: press,
        child: Icon(
          icon,
          color: iconColor,
          size: 18,
        ),
      ),
    );
  }
}
