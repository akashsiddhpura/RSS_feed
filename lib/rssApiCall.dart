import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rss_feed/rssModal.dart';
import 'package:rss_feed/rss_controller.dart';

class RssApi extends GetxController {
  final RssController apiControl = Get.put(RssController());

  List<RssModal> feedFromJson(String str) =>
      List<RssModal>.from(json.decode(str).map((x) => RssModal.fromJson(x)));
  String feedToJson(List<RssModal> data) =>
      json.encode(List<dynamic>.from(data.map((e) => e.toJson())));

 getData() async {
    // print(response.statusCode);
    apiControl.responsedata.clear();
    apiControl.responsedata.refresh();

    final country = apiControl.countries[apiControl.selCountry.value];
    print(
        "https://rss.applemarketingtools.com/api/v2/${country}/${apiControl.selectesMedia.value.toLowerCase()}/${apiControl.selectedFeed.value.toLowerCase().replaceAll(" ", "-")}/${apiControl.selCount.value.toLowerCase()}/${apiControl.selectType.value.toLowerCase().replaceAll(" ", "-")}.json");

    try {
      var response = await http.get(
        Uri.parse(
            "https://rss.applemarketingtools.com/api/v2/${country}/${apiControl.selectesMedia.value.toLowerCase()}/${apiControl.selectedFeed.value.toLowerCase().replaceAll(" ", "-")}/${apiControl.selCount.value.toLowerCase()}/${apiControl.selectType.value.toLowerCase().replaceAll(" ", "-")}.json"),
      );

      // print(response.statusCode);
      // feed = json.decode(response.body);
      // print(feed);
      // print( json.decode(response.body)["feed"]['results']);

      if (response.statusCode == 200) {
        print(apiControl.responsedata);
        final _a = List.from(json.decode(response.body)["feed"]['results']);
        _a.forEach((element) {
          apiControl.responsedata.add(Results.fromJson(element));
          apiControl.responsedata.refresh();
        });

        print(apiControl.responsedata);

        RssModal abc = RssModal.fromJson(jsonDecode(response.body));
        return abc;
      }
    } catch (e) {
      RssModal data = RssModal();
      return data;

      print(e);
    }
  }
}
