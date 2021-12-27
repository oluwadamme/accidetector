// Saving the data the sensors give

// first one
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class SaveFile {
  Future<String> getFilePath(String path) async {
    Directory appDocsDirectory = await getApplicationDocumentsDirectory();
    String appDocsPath = appDocsDirectory.path;
    String filePath = "$appDocsPath + '$path'+/.json";

    return filePath;
  }

  Future<void> saveFile(Map<String, dynamic> text) async {
    File file = File(await getFilePath('acc'));
    file.writeAsString(text.toString());
  }

  Future<Map<String, dynamic>> readFile() async {
    File file = File(await getFilePath('acc'));
    Map fileContent = (await file.readAsString()) as Map;
    print('$fileContent');
    return fileContent;
  }
}
