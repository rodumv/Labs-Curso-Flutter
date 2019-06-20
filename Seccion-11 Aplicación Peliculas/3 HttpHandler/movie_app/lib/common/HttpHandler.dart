import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HttpHandler{

    Future<dynamic> getJson(Uri uri) async{
      http.Response response = await http.get(uri);
      return json.decode(response.body).toString();
    }
}