import 'dart:convert';
import 'package:http/http.dart' as http;

class AccountRemoteDataProvider {
  final _baseURL = "http://192.168.1.72:8080";
  final http.Client httpClient;

  AccountRemoteDataProvider({required this.httpClient});

  Future<String> signUpAdmin(
      {required String name,
      required String email,
      required String password}) async {
    // Map data = {'name': name, 'email': email, 'password': password};
    const urlPath = "/signup";
    final response = await httpClient.post(
      Uri.parse('$_baseURL/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "name": name,
        "email": email,
        "password": password,
      }),
      // data: signUpPayload.toMap(),
    );
    if (response.statusCode == 200) {
      print('Response Status : ${response.statusCode}');
      print('Response body: ${response.body}');
      return jsonDecode(response.body)['token'];
    } else {
      throw Exception("Failed to signup new admin");
    }
  }

  Future<String> login(String email, String password) async {
    const urlPath = "/accounts/signin";
    // SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {'email': email, 'password': password};
    final response = await http.post(Uri.parse('$_baseURL/login'),
        // headers: <String, String>{
        //   'Content-Type': 'application/json; charset=UTF-8',
        // },
        body: data);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      print('Response Status : ${response.statusCode}');
      print('Response body: ${response.body}');
      if (jsonResponse != null) {
        // sharedPreferences.setString('token', jsonResponse['token']);
        return jsonResponse['token'];
      } else {
        throw Exception("failed to get token from response"); // todo -> check
      }
    } else {
      throw Exception("failed to signin admin user");
    }
  }
}
