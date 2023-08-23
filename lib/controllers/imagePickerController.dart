import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dinethruu/pages/addMenu/components/customBottomSheetAppSetting.dart';
import 'package:dinethruu/pages/addMenu/components/customBottomSheetMediaOption.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:permission_handler/permission_handler.dart' as permission;

import '../utils/utilColors.dart';
import '../utils/utilString.dart';

class ImagePickerCtrl extends GetxController {
  // final MenuController menuController = Get.put(MenuController());
  final picker = ImagePicker();

  var imageBase64 = "".obs;
  var compressImgPath = "".obs;
  //
  var selectedImgPath = "";
  var croppedImgSize = 0;
  var croppedImgPath = "";
  var compressImgPathSize = 0;
  var isOldImage = false.obs;

  Future<void> getPermission() async {
    Map<permission.Permission, permission.PermissionStatus> status = await [
      permission.Permission.camera,
      permission.Permission.storage,
    ].request();
    await openBottomSheet();
    print(
        "Camera : ${status[permission.Permission.camera]} -- ${status[permission.Permission.camera]}\n Storage : ${status[permission.Permission.storage]}");
  }

  Future<void> openBottomSheet() async {
    Get.bottomSheet(
      CustomBottomSheetMediaOption(
        onCameraTap: () async {
          var cameraStatus = await permission.Permission.camera.request();
          if (cameraStatus.isGranted) {
            await getImgFromCamera();
            await deleteFile((File(selectedImgPath)));
          } else if (cameraStatus.isDenied) {
          } else {
            Get.bottomSheet(
              CustomBottomSheetAppSetting(
                  title: UtilString.botSheetAddMenuCameraPermissionTitle,
                  onSettingTap: () async {
                    await permission.openAppSettings();
                    Get.back();
                  },
                  onDenyTap: () {
                    Get.back();
                  }),
            );
          }
        },
        onGalleryTap: () async {
          var storageStatus = await permission.Permission.storage.request();
          if (storageStatus.isGranted) {
            await getImgFromGallery();
          } else if (storageStatus.isDenied) {
          } else {
            Get.bottomSheet(
              CustomBottomSheetAppSetting(
                  title: UtilString.botSheetAddMenuStoragePermissionTitle,
                  onSettingTap: () async {
                    await permission.openAppSettings();
                    Get.back();
                  },
                  onDenyTap: () {
                    Get.back();
                  }),
            );
          }
        },
      ),
    );
  }

  Future<void> deleteFile(File file) async {
    try {
      if (await file.exists()) {
        await file.delete();
      }
    } catch (e) {}
  }

  Future<void> getImgFromCamera() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.camera,
      imageQuality: 100,
      // maxHeight: 1024,
      // maxWidth: 1024,
    );
    if (pickedFile != null) {
      selectedImgPath = pickedFile.path;

      print("CAMERAimagePicker ======================  ${selectedImgPath}");
      await cropImgFile(selectedImgPath);
      print("GALLERYcrop ======================  ${croppedImgPath}");
      await compressImgPathFile(croppedImgPath);
      print("GALERRYcompress ======================  ${compressImgPath}");
      await convertImage();
      isOldImage.value = false;
    }

    // deleteFile(File(selectedImgPath.value));
    Get.back();
  }

  Future<void> getImgFromGallery() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.gallery,
      imageQuality: 100,
    );
    if (pickedFile != null) {
      selectedImgPath = pickedFile.path;
      print("GALLERYimagePicker ======================  ${selectedImgPath}");
      await cropImgFile(selectedImgPath);
      print("GALLERYcrop ======================  ${croppedImgPath}");
      await compressImgPathFile(croppedImgPath);
      print("GALLERYcompress ======================  ${compressImgPath}");
      await convertImage();
      isOldImage.value = false;
    }
    Get.back();
  }

  Future<void> cropImgFile(String filePath) async {
    final cropImage = await ImageCropper.cropImage(
      sourcePath: filePath,
      maxHeight: 2400,
      maxWidth: 2400,
      compressFormat: ImageCompressFormat.png,
      androidUiSettings: AndroidUiSettings(
        // lockAspectRatio: false,
        activeControlsWidgetColor: UtilColors.editPhotoActiveControl,
        backgroundColor: UtilColors.editPhotbgColor,
        dimmedLayerColor: UtilColors.editPhotoLayer,
        statusBarColor: UtilColors.editPhotoStatusBarColor,
        toolbarColor: UtilColors.editPhotoAppBarBg,
        toolbarWidgetColor: UtilColors.editPhotoAppBarText,
        initAspectRatio: CropAspectRatioPreset.square,
      ),
      aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
      aspectRatioPresets: [CropAspectRatioPreset.square],
      compressQuality: 100,
    );
    if (cropImage != null) {
      croppedImgPath = cropImage.path;
      croppedImgSize = (File(cropImage.path)).lengthSync();
      print("5 ======================  ${cropImage.path}");
      print("6 ======================  ${(croppedImgSize) / 1024}");
    }
  }

  Future<void> compressImgPathFile(String filePath) async {
    // final tempDir = await path_provider.getTemporaryDirectory();
    // final tempPath = tempDir.path;
    // final targetPath = tempPath + "/tempFile.jpg";
    // print("zzzzzzzzzzzzzzzzzzz $tempPath");
    // final dir = Directory.systemTemp;
    // final targetPath = dir.absolute.path + "/tempFile.jpg";
    // print("zzzzzzzzzzzzzzzzzzz ${dir.absolute.path}");
    final filePath = (File(croppedImgPath)).absolute.path;
    final lastIndex = filePath.lastIndexOf(new RegExp(r'.png'));
    print("LAST: $lastIndex");
    final splitted = filePath.substring(0, (lastIndex));
    print("SPLIT: $splitted");
    final targetPath = "$splitted" + "_${filePath.substring(lastIndex)}";
    print("TARGET: $targetPath");

    var compressedFile = await FlutterImageCompress.compressAndGetFile(
        filePath, targetPath,
        quality: 100,
        minHeight: 500,
        minWidth: 500,
        format: CompressFormat.png);
    compressImgPath.value = compressedFile.path;
    compressImgPathSize = (File(compressImgPath.value)).lengthSync();
    print("yyyyyyyyyyyyyyyyyyy $filePath");
    // print("xxxxxxxxxxxxxxxxxxx $targetPath");
    print("7 ======================  ${compressImgPath.value}");
    print("8 ======================  ${(compressImgPathSize) / 1024}");
  }

  convertImage() async {
    Uint8List imageBytes = (File(compressImgPath.value)).readAsBytesSync();
    imageBase64.value = base64Encode(imageBytes);
  }
}
