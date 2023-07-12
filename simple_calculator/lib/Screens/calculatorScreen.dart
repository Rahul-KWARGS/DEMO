import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:simple_calculator/Const/color.dart';
import 'package:simple_calculator/Controller/calculatorController.dart';
import 'package:simple_calculator/Util/botton.dart';

class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

// CalculatorController = Get.put(CalculatorController());

  @override
  Widget build(BuildContext context) {
    CalculatorController controller = Get.put(CalculatorController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Obx(
        () => controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Container(
                    height: size.height * 0.3,
                    width: size.width,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(20),
                            alignment: Alignment.centerRight,
                            child: Text(
                              controller.userInput.value,
                              style: const TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            alignment: Alignment.centerRight,
                            child: Text(
                              controller.answer.value,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ]),
                  ),
                  Container(
                    // color: Colors.red,
                    height: size.height * 0.65,
                    width: size.width * 0.9,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: GridView.builder(
                          itemCount: controller.buttons.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 10.0,
                                  crossAxisCount: 4),
                          itemBuilder: (BuildContext context, int index) {
                            // Clear Button
                            if (index == 0) {
                              return Button(
                                buttontapped: () {
                                  controller.userInput.value = '';
                                  controller.answer.value = '0';
                                },
                                buttonText: controller.buttons[index],
                                color: AppColors.buttonLight,
                                textColor: Colors.black,
                              );
                            }

                            // +/- button
                            else if (index == 1) {
                              return Button(
                                buttontapped: () {
                                  controller.answer.value = pow(
                                          double.parse(
                                              controller.userInput.value),
                                          2)
                                      .toString();
                                  print(controller.answer.value);
                                },
                                buttonText: controller.buttons[index],
                                color: AppColors.buttonLight,
                                textColor: Colors.black,
                              );
                            }
                            // % Button
                            else if (index == 2) {
                              return Button(
                                buttontapped: () {
                                  controller.userInput.value +=
                                      controller.buttons[index];
                                },
                                buttonText: controller.buttons[index],
                                color: AppColors.buttonLight,
                                textColor: Colors.black,
                              );
                            }
                            // Delete Button
                            else if (index == 3) {
                              return Button(
                                buttontapped: () {
                                  controller.userInput.value =
                                      controller.userInput.substring(
                                          0,
                                          controller.userInput.value.length -
                                              1);
                                },
                                buttonText: controller.buttons[index],
                                color: AppColors.buttonLight,
                                textColor: Colors.red,
                              );
                            }
                            // Equal_to Button
                            else if (index == 18) {
                              return Button(
                                buttontapped: () {
                                  controller.equalPressed();
                                },
                                buttonText: controller.buttons[index],
                                color: AppColors.darkOrange,
                                textColor: Colors.white,
                              );
                            }

                            //  other buttons
                            else {
                              return Button(
                                buttontapped: () {
                                  controller.userInput.value +=
                                      controller.buttons[index];
                                },
                                buttonText: controller.buttons[index],
                                color: controller
                                        .isOperator(controller.buttons[index])
                                    ? AppColors.buttonLight
                                    : Colors.white,
                                textColor: controller
                                        .isOperator(controller.buttons[index])
                                    ? Colors.black
                                    : Colors.black,
                              );
                            }
                          }),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
