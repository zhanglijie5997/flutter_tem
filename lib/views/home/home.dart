import 'dart:async';
import 'dart:typed_data';

import 'package:app_3/language/language.dart';
import 'package:app_3/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as Ui;

import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  final GlobalKey _text_key = GlobalKey();
  final GlobalKey _repaintBoundary = GlobalKey();
  @override
  void initState() {
    super.initState();
  }

  Uint8List? _image;

  init() async {
    final devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    Get.log('0');
    Timer.run(() {
      Get.log('3');
    });
    scheduleMicrotask(() {
      Get.log('1');
    });

    final _ = _repaintBoundary.currentContext?.findRenderObject()
        as RenderRepaintBoundary;
    if (_.debugNeedsPaint) {
      Get.log("Waiting for boundary to be painted.");
      await Future.delayed(const Duration(milliseconds: 20));
      init();
    }
    Ui.Image image = await _.toImage(pixelRatio: devicePixelRatio);
    final ByteData? byteData =
        await image.toByteData(format: Ui.ImageByteFormat.png);
    final Uint8List pngBytes = byteData!.buffer.asUint8List();
    setState(() {
      _image = pngBytes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(I18n.capture),
        ),
        body: SingleChildScrollView(
          child: LayoutBuilder(builder: (context, _) {
            String _type = "mobile";
            if (_.maxWidth <= 375) {
              _type = "mobile";
            } else if (_.maxWidth >= 375 && _.maxWidth <= 1080) {
              _type = "ipad";
            } else {
              _type = "pc";
            }
            return RepaintBoundary(
              key: _repaintBoundary,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Transform.scale(
                        scale: _type == "mobile"
                            ? 1
                            : _type == "pc"
                                ? 5
                                : 3,
                        child: Image.network(
                            "https://avatars.githubusercontent.com/u/9287?s=48&v=4"),
                      ),
                      Center(
                          child: Text(
                        _type,
                        style: const TextStyle(color: Colors.red),
                        key: _text_key,
                      )),
                    ],
                  ),
                  const TextField(),
                  TextButton(
                    onPressed: () {
                      init();
                    },
                    child: Text(I18n.hello,
                        style:
                            const TextStyle(color: Colors.pink, fontSize: 30)),
                  ),
                  TextButton(
                      onPressed: () {
                        ThemeController.to
                            .changeMode(!ThemeController.to.isDark);
                        // Get.toNamed(Routes.me);
                        // Get.log("${Get.locale}");
                      },
                      child: const Text("go to me")),
                  TextButton(
                      onPressed: () {
                        if (Get.locale == const Locale("en", "US")) {
                          LanguageController.to.changeLanguage('zh', "CN");
                        } else {
                          LanguageController.to.changeLanguage('en', "US");
                        }
                      },
                      child: const Text("change language")),
                  _image != null ? Image.memory(_image!) : const SizedBox()
                ],
              ),
            );
          }),
        ));
  }
}
