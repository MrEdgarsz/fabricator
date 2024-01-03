import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';

import 'sample_enum.dart';

Map<String, dynamic> loadSampleData(SampleData sampleData) {
  //get current directory
  final Directory current = Directory.current;
  //get file path
  final String filePath =
      '${current.path}/test/test_apis/${sampleData.filename}.json';
  final File file = File(filePath);
  debugPrint(file.existsSync().toString());
  final String fileContent = file.readAsStringSync();
  final Map<String, dynamic> jsonData = jsonDecode(fileContent);
  return jsonData;
}
