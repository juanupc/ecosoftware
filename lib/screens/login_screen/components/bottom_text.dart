//import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:ing_economica_ecosoft/screens/login_screen/animations/change_screen_animation.dart';
import 'package:ing_economica_ecosoft/screens/login_screen/components/login_content.dart';
import 'package:ing_economica_ecosoft/utils/constants.dart';
import 'package:ing_economica_ecosoft/utils/helper_functions.dart';

class BottomText extends StatefulWidget {
  const BottomText({Key? key}) : super(key: key);

  @override
  State<BottomText> createState() => _BottomTextState();
}

class _BottomTextState extends State<BottomText> {
  bool _isHovered = false;
  @override
  void initState() {
    ChangeScreenAnimation.bottomTextAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return HelperFunctions.wrapWithAnimatedBuilder(
      animation: ChangeScreenAnimation.bottomTextAnimation,
      child: GestureDetector(
        onTap: () {
          if (!ChangeScreenAnimation.isPlaying) {
            ChangeScreenAnimation.currentScreen == Screens.createAccount
                ? ChangeScreenAnimation.forward()
                : ChangeScreenAnimation.reverse();

            ChangeScreenAnimation.currentScreen =
                Screens.values[1 - ChangeScreenAnimation.currentScreen.index];
          }
        },
        behavior: HitTestBehavior.opaque,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: MouseRegion(
            onEnter: (_) => setState(() => _isHovered = true),
            onExit: (_) => setState(() => _isHovered = false),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 16, fontFamily: 'Montserrat'),
                children: [
                  TextSpan(
                    text:
                        ChangeScreenAnimation.currentScreen ==
                                Screens.createAccount
                            ? 'Ya tienes una cuenta? '
                            : 'No tienes una cuenta? ',
                    style: const TextStyle(
                      color: kprimaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  TextSpan(
                    text:
                        ChangeScreenAnimation.currentScreen ==
                                Screens.createAccount
                            ? 'Iniciar sesión'
                            : 'Crear cuenta',
                    style: TextStyle(
                      color: _isHovered ? kprimaryColor : ksecondaryColor,
                      fontWeight: FontWeight.bold,
                      decoration:
                          _isHovered
                              ? TextDecoration.underline
                              : TextDecoration.none,
                      decorationColor: kprimaryColor,
                      decorationThickness: 2,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
