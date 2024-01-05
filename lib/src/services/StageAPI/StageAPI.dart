import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:stageclient/src/DTOs/Weather.dart';
import '../../DTOs/Activity/Activity.dart';
import '../../common/constants/StageAPI/StageAPIConstants.dart';

class StageAPI {
  static Future<List<Activity>> getAllActivities(
      String pageNumber, String pageSize) async {
    var url =
        Uri.http(StageAPIConstant.localApiUrl, StageAPIConstant.activities, {
      'pageNumber': {pageNumber},
      'pageSize': {pageSize}
    });
    try {
      var response = await http.get(url);

      if (response.statusCode == 200 && response.body != null) {
        List<dynamic> jsonResponse = convert.jsonDecode(response.body);
        List<Activity> activities =
            jsonResponse.map((json) => Activity.fromJson(json)).toList();
        return activities;
      } else {
        throw Exception("Failed to load data");
      }
    } catch (error) {
      throw Exception("Failed to load data");
    }
  }

  static Future<Activity> getActivity(String id) async {
    var url = Uri.http(StageAPIConstant.localApiUrl, '/api/activities/${id}');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200 && response.body != null) {
        dynamic jsonResponse = convert.jsonDecode(response.body);
        Activity activity = Activity.fromJson(jsonResponse);
        return activity;
      } else {
        throw Exception("Failed to load data");
      }
    } catch (error) {
      throw Exception("Failed to load data");
    }
  }

  static Future<bool> updateActivity(Activity activity) async {
    var url =
        Uri.http(StageAPIConstant.localApiUrl, StageAPIConstant.activities);
    String activityJson = convert.jsonEncode(activity.toJson());
    try {
      var response = await http.put(
        url,
        body: activityJson,
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 307) {
        // Handle redirect manually
        var redirectUrl = response.headers['location'];
        if (redirectUrl != null) {
          var redirectResponse = await http.put(
            Uri.parse(redirectUrl),
            body: activityJson,
            headers: {'Content-Type': 'application/json'},
          );
          if (redirectResponse.statusCode >= 200 &&
              redirectResponse.statusCode < 300) {
            return true;
          } else {
            throw Exception(
              "Failed to update activity after redirect. Status Code: ${redirectResponse.statusCode}",
            );
          }
        }
      } else if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        throw Exception(
          "Failed to update activity. Status Code: ${response.statusCode}",
        );
      }
    } catch (error) {
      print("Error updating activity: $error");
      throw Exception("Failed to load data");
    }
    return false;
  }

  static Future<bool> createActivity(Activity activity) async {
    var url =
        Uri.http(StageAPIConstant.localApiUrl, StageAPIConstant.activities);
    String activityJson = convert.jsonEncode(activity.toJson());
    try {
      var response = await http.post(
        url,
        body: activityJson,
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 307) {
        // Handle redirect manually
        var redirectUrl = response.headers['location'];
        if (redirectUrl != null) {
          var redirectResponse = await http.post(
            Uri.parse(redirectUrl),
            body: activityJson,
            headers: {'Content-Type': 'application/json'},
          );
          if (redirectResponse.statusCode >= 200 &&
              redirectResponse.statusCode < 300) {
            return true;
          } else {
            throw Exception(
              "Failed to update activity after redirect. Status Code: ${redirectResponse.statusCode}",
            );
          }
        }
      } else if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        throw Exception(
          "Failed to update activity. Status Code: ${response.statusCode}",
        );
      }
    } catch (error) {
      print("Error updating activity: $error");
      throw Exception("Failed to load data");
    }
    return false;
  }

  static Future<bool> deleteActivity(String id) async {
    var url = Uri.http(StageAPIConstant.localApiUrl, '/api/activities/${id}');
    try {
      var response = await http.delete(
        url,
        headers: {'Content-Type': 'application/json'},
      );
      if (response.statusCode == 307) {
        // Handle redirect manually
        var redirectUrl = response.headers['location'];
        if (redirectUrl != null) {
          var redirectResponse = await http.delete(
            Uri.parse(redirectUrl),
            headers: {'Content-Type': 'application/json'},
          );
          if (redirectResponse.statusCode >= 200 &&
              redirectResponse.statusCode < 300) {
            return true;
          } else {
            throw Exception(
              "Failed to delete activity after redirect. Status Code: ${redirectResponse.statusCode}",
            );
          }
        }
      } else if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        throw Exception(
          "Failed to delete activity. Status Code: ${response.statusCode}",
        );
      }
    } catch (error) {
      print("Error deleting activity: $error");
      throw Exception("Failed to load data");
    }
    return false;
  }



  static Future<Weather> getWeather(String city, String datetime) async {
    var url = Uri.http(StageAPIConstant.localApiUrl, '/api/weather/daily', {
      'city': city,
      'datetime': datetime,
    });
    try {
      var response = await http.get(url);
      if (response.statusCode == 200 && response.body != null) {
        dynamic jsonResponse = convert.jsonDecode(response.body);
        Weather weather = Weather.fromJson(jsonResponse);
        return weather;
      } else {
        throw Exception("Failed to load data");
      }
    } catch (error) {
      throw Exception("Failed to load data");
    }
  }
}
