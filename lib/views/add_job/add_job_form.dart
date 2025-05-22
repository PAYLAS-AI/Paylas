import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:paylas/locator/locator.dart';
import 'package:paylas/provider/all_providers.dart';
import 'package:paylas/tools/screen_sizes.dart';
import 'package:paylas/tools/text_controllers.dart';
import 'package:paylas/views/add_job/add_job_image.dart';
import 'package:paylas/views/add_job/category_dropdown.dart';
import 'package:paylas/views/add_job/custom_input.dart';
import 'package:paylas/views/ui_helpers/color_ui_helper.dart';
import 'package:paylas/views/ui_helpers/text_style_helper.dart';

class AddJobForm extends ConsumerWidget {
  AddJobForm({
    super.key,
  });

  final screen = locator<ScreenSizes>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    int currentStep = ref.watch(currentStepProvider);
    debugPrint(currentStep.toString());
    return ListView(
      children: [
        Stepper(
            currentStep: currentStep,
            physics: NeverScrollableScrollPhysics(),
            onStepContinue: () {
              if (currentStep < 7) {
                ref.read(currentStepProvider.notifier).state = currentStep + 1;
              }
            },
            onStepCancel: () {
              if (currentStep > 0) {
                ref.read(currentStepProvider.notifier).state = currentStep - 1;
              }
            },
            controlsBuilder: (BuildContext context, ControlsDetails details) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  // Özelleştirilmiş Continue (İleri) butonu
                  details.currentStep != 7
                      ? ElevatedButton(
                          onPressed: details.onStepContinue,
                          child: Text('Devam Et'),
                        )
                      : Container(),
                  SizedBox(width: 8),
                  // Özelleştirilmiş Cancel (Geri) butonu
                  details.currentStep != 0
                      ? TextButton.icon(
                          style: ButtonStyle(
                              backgroundColor: WidgetStatePropertyAll(
                                  ColorUiHelper.favoriteIconColor)),
                          onPressed: details.onStepCancel,
                          icon: Icon(Icons.cancel,
                              color: ColorUiHelper.mainSubtitleColor),
                          label: Text(
                            'Geri',
                            style: TextStyle(
                                color: ColorUiHelper.mainSubtitleColor),
                          ),
                        )
                      : Container(),
                ],
              );
            },
            stepIconBuilder: (stepIndex, stepState) {
              if (stepIndex == 0) {
                return Image.asset(
                  "assets/icon/category.png",
                  height: 25,
                );
              } else if (stepIndex == 1) {
                return Image.asset(
                  "assets/icon/add-image.png",
                  height: 25,
                );
              } else if (stepIndex == 2) {
                return Image.asset(
                  "assets/icon/title.png",
                  height: 25,
                );
              } else if (stepIndex == 3) {
                return Image.asset(
                  "assets/icon/placeholder.png",
                  height: 25,
                );
              } else if (stepIndex == 4) {
                return Image.asset(
                  "assets/icon/money.png",
                  height: 25,
                );
              } else if (stepIndex == 5) {
                return Image.asset(
                  "assets/icon/time-passing.png",
                  height: 25,
                );
              } else if (stepIndex == 6) {
                return Image.asset(
                  "assets/icon/info.png",
                  height: 25,
                );
              } else {
                return Image.asset(
                  "assets/icon/success.png",
                  height: 25,
                );
              }
            },
            steps: [
              Step(
                  isActive: currentStep == 0,
                  title: Text(
                    "İlan Kategorisi",
                    style: TextStyleHelper.homeLabelStyle,
                  ),
                  content: CategoryDropdown()),
              Step(
                  isActive: currentStep == 1,
                  title: Text(
                    "İlan Görseli",
                    style: TextStyleHelper.homeLabelStyle,
                  ),
                  content: AddJobImage()),
              Step(
                  isActive: currentStep == 2,
                  title: Text(
                    "İlan Başlığı",
                    style: TextStyleHelper.homeLabelStyle,
                  ),
                  content: AddJobCustomInput(
                    height: 60,
                    hintText: "Başlık",
                    iconAssetUrl: "assets/icon/title.png",
                    inputLabel: "İlan Başlığı",
                    maxLine: 2,
                    textController: TextControllerHelper.addJobTitleController,
                  )),
              Step(
                isActive: currentStep == 3,
                title: Text(
                  "İlan Lokasyonu",
                  style: TextStyleHelper.homeLabelStyle,
                ),
                content: AddJobCustomInput(
                  height: 60,
                  hintText: "Lokasyon",
                  iconAssetUrl: "assets/icon/placeholder.png",
                  inputLabel: "İlan Lokasyonu",
                  maxLine: 2,
                  textController: TextControllerHelper.addJobLocationController,
                ),
              ),
              Step(
                isActive: currentStep == 4,
                title: Text(
                  "İlan Ücreti",
                  style: TextStyleHelper.homeLabelStyle,
                ),
                content: AddJobCustomInput(
                  height: 50,
                  hintText: "Ücret",
                  iconAssetUrl: "assets/icon/money.png",
                  inputLabel: "İlan Ücreti",
                  maxLine: 1,
                  textController: TextControllerHelper.addJobCostController,
                ),
              ),
              Step(
                isActive: currentStep == 5,
                title: Text(
                  "İlan Geçerliliği",
                  style: TextStyleHelper.homeLabelStyle,
                ),
                content: AddJobCustomInput(
                  height: 50,
                  hintText: "Süre",
                  iconAssetUrl: "assets/icon/time-passing.png",
                  inputLabel: "İlan Geçerliliği",
                  maxLine: 1,
                  textController: TextControllerHelper.addJobTimeController,
                ),
              ),
              Step(
                isActive: currentStep == 6,
                title: Text(
                  "İlan Açıklaması",
                  style: TextStyleHelper.homeLabelStyle,
                ),
                content: AddJobCustomInput(
                  height: 180,
                  hintText: "Açıklama",
                  iconAssetUrl: "assets/icon/info.png",
                  inputLabel: "İlan Açıklaması",
                  maxLine: 6,
                  textController: TextControllerHelper.addJobDescriptionController,
                ),
              ),
              Step(
                isActive: currentStep == 7,
                title: Text(
                  "İlanı Yayınla!",
                  style: TextStyleHelper.homeLabelStyle,
                ),
                content: Container(
                  width: screen.width * 0.65,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      color: ColorUiHelper.inputDarkColor,
                      gradient: LinearGradient(
                          colors: [
                            ColorUiHelper.inputDarkColor,
                            ColorUiHelper.inputSecondDarkColor
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight)),
                  child: Center(
                    child: Text(
                      "İlan Oluştur!",
                      style: TextStyleHelper.loginButtonTextStyle,
                    ),
                  ),
                ),
              ),
            ]),
      ],
    );
  }
}

