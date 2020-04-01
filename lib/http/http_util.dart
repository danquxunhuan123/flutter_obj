import 'dart:convert';
import 'package:http/http.dart' as http;


class HttpUtils {
  static Utf8Decoder utf8decoder = Utf8Decoder();
  static Future<Map<String, dynamic>> fetchData(String url) async {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return jsonDecode(utf8decoder.convert(response.bodyBytes));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

}
