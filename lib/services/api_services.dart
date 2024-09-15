import 'dart:convert';

import 'package:http/http.dart';
import 'package:logger/logger.dart';
import 'package:mobileapp/constants/api_endpoint_constants.dart';
import 'package:mobileapp/exceptions/app_exceptions.dart';
import 'package:mobileapp/models/items_model.dart';

class ApiServices {
  static final Logger _logger = Logger();
  static Future<ItemsModel> fetchAllItems() async {
    try {
      _logger.i("Making GET Request to Get All Items");
      Response response = await get(Uri.parse(
          "${ApiEndPointContants.baseUrl}/${ApiEndPointContants.itemRoute}/getAllItems"));
      var jsonResponse = _getItemJsonResponse(response: response);
      _logger.i("Fetched All Data");
      return ItemsModel.fromJson(jsonResponse);
    } catch (e) {
      _logger.e("An error occured while fetching items");
      return Future.error(e);
    }
  }

  static Future<ItemsModel> deleteItem({required int id}) async {
    try {
      _logger.i("Making a DELETE Request to delete item with id $id");
      Response response = await delete(Uri.parse(
          "${ApiEndPointContants.baseUrl}/${ApiEndPointContants.itemRoute}/deleteItem/$id"));

      var jsonResponse = _getItemJsonResponse(response: response);
      _logger.i("Deleted a item of id $id");
      return ItemsModel.fromJson(jsonResponse);
    } catch (e) {
      _logger.e("An error Occured while making Delete item request");
      return Future.error(e);
    }
  }

  static _getItemJsonResponse({required Response response}) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(
            message: jsonDecode(response.body)["message"] ?? "Bad Request");
      case 500:
        throw InternalServerException(
            message: jsonDecode(response.body)["message"] ??
                "Internal Server Error");
      default:
        throw const AppExceptions(message: "An unknown error occured");
    }
  }
}
