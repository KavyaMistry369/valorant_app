import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:valorant_app/models/agents_model.dart';

class APIService {
  APIService._();

  static final APIService apiService = APIService._();

  String endPoint = "https://valorant-api.com/v1/agents";

  List allAgents = [];
  List<AbilitiesModel> allAbilites = [];

  void getData() async {
    http.Response res = await http.get(Uri.parse(endPoint));
    if (res.statusCode == 200) {
      Map<String, dynamic> Mydata = jsonDecode(res.body);
      allAgents = Mydata["data"];
      log("$allAgents");
    }
  }
}
