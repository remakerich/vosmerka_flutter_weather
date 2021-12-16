import 'dart:convert';
import 'package:flutter/services.dart';

String apiKey = '';

getApiKey() async {
  final _apiKeyFromAsset = await rootBundle.loadString('assets/api_key.json');
  apiKey = jsonDecode(_apiKeyFromAsset)['key'];
}
