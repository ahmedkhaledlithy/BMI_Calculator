import 'package:flutter/material.dart';
class CircleButton extends StatelessWidget {
 final IconData icon;
 final VoidCallback onPress;
  const CircleButton({Key? key,required this.icon,required this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: Icon(
        icon,
        size: 25,
      ),
      style: ButtonStyle(
        elevation: MaterialStateProperty.resolveWith<double>(
              (Set<MaterialState> states) {
            // if the button is pressed the elevation is 10.0, if not
            // it is 5.0
            if (states.contains(MaterialState.pressed)) return 15.0;
            return 10.0;
          },
        ),
        shape: MaterialStateProperty.all(CircleBorder()),
        padding: MaterialStateProperty.all(EdgeInsets.all(15)),
        backgroundColor: MaterialStateProperty.all(Color(0xff414552)),
        // <-- Button color
        overlayColor: MaterialStateProperty.resolveWith<Color?>((states) {
          if (states.contains(MaterialState.pressed))
            return Color(0xffE8134A); // <-- Splash color
        }),
      ),
    );
  }
}
