import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Code extends StatefulWidget {
  const Code({super.key});

  @override
  State<Code> createState() => _CodeState();
}

class _CodeState extends State<Code> {
  final List<TextEditingController> controllers =
  List.generate(4, (index) => TextEditingController());

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double boxSize = screenWidth * 0.125;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            4,
                (index) => SizedBox(
              width: boxSize,
              height: boxSize,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    maxLength: 1,
                    decoration: InputDecoration(
                      counterText: '',
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(boxSize * 0.12), // نسبة تقريبية لـ 6/50
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(boxSize * 0.12), // نسبة تقريبية لـ 6/50
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(boxSize * 0.12), // نسبة تقريبية لـ 6/50
                        borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        ),
                      ),
                    ),
                    controller: controllers[index],
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        if (index < controllers.length - 1) {
                          FocusScope.of(context).nextFocus();
                        }
                      } else {
                        if (index > 0) {
                          FocusScope.of(context).previousFocus();
                        }
                      }
                      setState(() {});
                    },
                  ),
                  Visibility(
                    visible: controllers[index].text.isEmpty,
                    child: Text(
                      '-',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: boxSize * 0.4, // نسبة تقريبية لـ 20/50
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
