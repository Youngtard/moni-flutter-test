import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:moni_flutter_test/modules/cluster/models/cluster.dart';
import 'package:moni_flutter_test/modules/cluster/service/cluster_service.dart';
import 'package:http/http.dart' as http;
import 'package:moni_flutter_test/utils/app_exceptions.dart';
import 'package:moni_flutter_test/utils/constant.dart';

class ClusterServiceImpl extends ClusterService {
  late String url;
  late Map<String, String?> headers;
  late http.Response response;
  late Map<String, dynamic> responseBody;

  @override
  Future<Cluster> fetchClusterAgents({required String path}) async {
    url = baseUrl + path;

    headers = {"Content-Type": "application/json",};

    try {
      response = await http.get(Uri.parse(url)).timeout(const Duration(seconds: 30));

      responseBody = jsonDecode(response.body);

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return Cluster.fromJson(responseBody["data"]);
      } else {
        throw NetworkException(message: responseBody["message"]);
      }
    } catch (error, stack) {
      if (error is Exception) {
        if (error is SocketException) {
          throw NetworkFailure("Unable to connect, please try again.", 0);
        } else if (error is TimeoutException) {
          throw NetworkFailure("Unable to connect, please try again.", 0);
        } else {
          throw NetworkFailure(error.toString(), 0);
        }
      } else {
        print(error.toString());
        print(stack);
        throw NetworkFailure(error.toString(), 0);
      }
    }
  }
}