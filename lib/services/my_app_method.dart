import 'package:ecommerce2/services/assets_manager.dart';
import 'package:ecommerce2/widgets/subtitle_text.dart';
import 'package:ecommerce2/widgets/title_text.dart';
import 'package:flutter/material.dart';

class MyappMethods {
  static Future<void> showErrorORWarningDialog({
    required BuildContext context,
    required String subtitle,
    required Function fct,
    bool isError = true,
  }) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  AssetsManager.warning,
                  height: 60,
                  width: 60,
                ),
                const SizedBox(
                  height: 16,
                ),
                SubtitleTextWidget(
                  label: subtitle,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: isError,
                      child: TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const SubtitleTextWidget(
                            label: 'Cancel',
                            color: Colors.red,
                          )),
                    ),
                    TextButton(
                        onPressed: () {
                          fct();
                          Navigator.pop(context);
                        },
                        child: const SubtitleTextWidget(
                          label: 'Ok',
                          color: Colors.green,
                        )),
                  ],
                )
              ],
            ),
          );
        });
  }

  static Future<void> imagePickerDialog(
      {required BuildContext context,
      required Function cameraFCT,
      required Function galaryFCT,
      required Function removeFCT}) async {
    await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Center(
              child: TitlesTextWidget(label: 'Choose option'),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  TextButton.icon(
                      onPressed: () {
                        cameraFCT();
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                      },
                      icon: const Icon(Icons.camera),
                      label: const Text("Camera")),
                  TextButton.icon(
                      onPressed: () {
                        galaryFCT();

                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                      },
                      icon: const Icon(Icons.image),
                      label: const Text("Galary")),
                  TextButton.icon(
                      onPressed: () {
                        removeFCT();
                        if (Navigator.canPop(context)) {
                          Navigator.pop(context);
                        }
                      },
                      icon: const Icon(Icons.remove_circle),
                      label: const Text("Remove")),
                ],
              ),
            ),
          );
        });
  }
}
