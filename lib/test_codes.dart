// Saving the data the sensors give

// check if accidetector folder exists
// 	if yes, open it
// 	check if sensor folders exist
// 		if yes, open it
// 		write files to individual folders

// 		if no, create it
// 		write files to individual folders

// 	if no, create it
// 	create sensor folders
// 	write files to individual folders

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

// second one

// Future<void> write(Map<String, dynamic> text) async {
//   final Directory directory = await getApplicationDocumentsDirectory();
//   final File file = File('${directory.path}/sensorData.txt');
//   await file.writeAsString(text.toString());
// }

// Future<Map<String, dynamic>> read(File file) async {
//   String text;
//   try {
//     final Directory directory = await getApplicationDocumentsDirectory();

//      file = File('${directory.path}/sensorData.txt');
//     text = await file.readAsString();
//   } catch (e) {
//     print("Couldn't read file");
//   }
//   return text as Map;
// }

// // save data as list
// Future<bool> setStringList(String key, List<String> value) =>
//     _setValue('StringList', key, value);
}
