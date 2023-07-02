import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  RoundIconButton({required this.icon, required this.onPressed});
  IconData icon;
  void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RawMaterialButton(
        elevation: 6.0,
        // disabledElevation: 10,
        constraints: const BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
        shape: const CircleBorder(),
        fillColor: const Color(0xFF4C4F5E),
        onPressed: onPressed,
        child: Icon(icon),
      ),
    );
  }
}
