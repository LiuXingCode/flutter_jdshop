import 'dart:convert';
import 'package:flutter_jdshop/services/storage.dart';

class SearchServices {
  static setHistoryData(keywords) async {
    var searchList = await Storage.getString("searchList");
    if (searchList != null) {
      List searchListData = json.decode(searchList);
      var hasData = searchListData.any((element) {
        return keywords == element;
      });
      if (!hasData) {
        searchListData.add(keywords);
      }
      await Storage.setString("searchList", json.encode(searchListData));
    } else {
      List tempList = [];
      tempList.add(keywords);
      await Storage.setString("searchList", json.encode(tempList));
    }
  }

  static getHistoryList() async {
    String? searchList = await Storage.getString("searchList");
    if (searchList != null) {
      return json.decode(searchList);
    } else {
      return [];
    }
  }

  static removeHistoryData(keywords) async {
    String? searchList = await Storage.getString("searchList");
    if (searchList != null) {
      List searchListData = json.decode(searchList);
      searchListData.remove(keywords);
      await Storage.setString("searchList", json.encode(searchListData));
    }
  }

  static clearHistoryList() async {
    await Storage.remove("searchList");
  }
}
