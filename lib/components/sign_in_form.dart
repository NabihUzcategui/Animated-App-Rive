// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rive/rive.dart';

class SingInForm extends StatefulWidget {
  const SingInForm({
    super.key,
  });

  @override
  State<SingInForm> createState() => _SingInFormState();
}

class _SingInFormState extends State<SingInForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isShowLoading = false;
  bool isShowConffeti = false;

  late SMITrigger check;
  late SMITrigger error;
  late SMITrigger reset;
  late SMITrigger confetti;

  StateMachineController getRiveController(Artboard artboard) {
    StateMachineController? controller =
        StateMachineController.fromArtboard(artboard, 'State Machine 1');

    artboard.addController(controller!);
    return controller;
  }

  void signIn(BuildContext context) {
    setState(() {
      isShowLoading = true;
      isShowConffeti = true;
    });

    Future.delayed(
      const Duration(seconds: 1),
      () {
        if (_formKey.currentState!.validate()) {
          check.fire();
          Future.delayed(
            const Duration(seconds: 2),
            () {
              setState(() {
                isShowLoading = false;
                confetti.fire();
                //TODO: Navigate to next screen
              });
            },
          );
        } else {
          error.fire();
          Future.delayed(
            const Duration(seconds: 2),
            () {
              setState(
                () {
                  isShowLoading = false;
                },
              );
            },
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Email',
                style: TextStyle(color: Colors.black54),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  onSaved: (email) {},
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SvgPicture.asset('assets/icons/email.svg'),
                    ),
                  ),
                ),
              ),
              const Text(
                'Password',
                style: TextStyle(color: Colors.black54),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 16),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "";
                    }
                    return null;
                  },
                  onSaved: (password) {},
                  obscureText: true,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: SvgPicture.asset('assets/icons/password.svg'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 24),
                child: ElevatedButton.icon(
                  onPressed: () {
                    signIn(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xfff77d8e),
                    minimumSize: const Size(double.infinity, 56),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                  ),
                  icon: const Icon(
                    CupertinoIcons.arrow_right,
                    color: Color(0xfffe0037),
                  ),
                  label: const Text('Sign In'),
                ),
              ),
            ],
          ),
        ),
        isShowLoading
            ? CustomPositiined(
                child: RiveAnimation.asset(
                  'assets/RiveAssets/check.riv',
                  onInit: (artboard) {
                    StateMachineController controller =
                        getRiveController(artboard);
                    check = controller.findSMI('Check') as SMITrigger;
                    error = controller.findSMI('Error') as SMITrigger;
                    reset = controller.findSMI('Reset') as SMITrigger;
                  },
                ),
              )
            : const SizedBox(),
        isShowConffeti
            ? CustomPositiined(
                child: Transform.scale(
                  scale: 7,
                  child: RiveAnimation.asset(
                    'assets/RiveAssets/confetti.riv',
                    onInit: (artboard) {
                      StateMachineController controller =
                          getRiveController(artboard);
                      confetti =
                          controller.findSMI('Trigger explosion') as SMITrigger;
                    },
                  ),
                ),
              )
            : SizedBox(),
      ],
    );
  }
}

class CustomPositiined extends StatelessWidget {
  final Widget child;
  final double size;

  const CustomPositiined({
    Key? key,
    required this.child,
    this.size = 100,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          const Spacer(),
          SizedBox(height: size, width: size, child: child),
          const Spacer(flex: 2),
        ],
      ),
    );
  }
}
