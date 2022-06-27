import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rss_feed/rssModal.dart';

class RssController extends GetxController {
  RxString selectType = "Albums".obs;
  RxString selCountry = "India".obs;
  RxString selCount = "10".obs;
  RxList responsedata=<Results>[].obs;

  Map<String, String> countries = {
    "Unites State": "us",
    "India": "in",
    "Fiji": "fj",
    'Dominica': "dm",
    'Canada': 'ca',
    'Poland': 'pl',
    'Namibia': 'na'
  };

  List<String> dataCount = ["10", "15", "20", "25"];

  RxString selectesMedia = 'Music'.obs;
  RxString selectedFeed = 'Most Played'.obs;
  RxList typeList = ['Albums', 'Music Videos', 'Playlists', 'Songs'].obs;
  var feedList = {'Most Played': 'most-played'}.obs;

  onChangedtype(String name) {
    typeList.value = mediaTypes
        .singleWhere((element) => element['mediaType'] == name)['types'];
    feedList.value = mediaTypes
        .singleWhere((element) => element['mediaType'] == name)['feed'];

    selectType.value = typeList.value.first;
    selectedFeed.value = feedList.value.keys.first;

    typeList.refresh();
    feedList.refresh();
  }

  List<Map<String, dynamic>> mediaTypes = [
    {
      'mediaType': 'Music',
      'types': ['Albums', 'Music Videos', 'Playlists', 'Songs'],
      'feed': {'Most Played': 'most-played'}
    },
    {
      'mediaType': 'Podcasts',
      'types': ['Podcasts', 'Podcast Episodes'],
      'feed': {'Top': 'top'}
    },
    {
      'mediaType': 'Apps',
      'types': ['Apps'],
      'feed': {'Top Free': 'top-free', 'Top Paid': 'top-paid'}
    },
    {
      'mediaType': 'Books',
      'types': ['Books'],
      'feed': {'Top Free': 'top-free', 'Top Paid': 'top-paid'}
    },
    {
      'mediaType': 'Audio Books',
      'types': ['Audio Books'],
      'feed': {
        'Top': 'top',
        'Everyday listens for \$9.99.': '1355215958',
        '\$9.99 Fiction & Literature': '1461817928',
        '\$9.99 Mysteries & Thrillers': '1461817926',
        '\$9.99 Nonfiction': '1461817931',
        '\$9.99 Biographies & Memoirs': '1461817929',
        '\$9.99 Business & Self-Development': '1461817927',
        '\$9.99 Romance': '1461817933',
        '\$9.99 Sci-Fi & Fantasy': '1461817932',
        '\$9.99 Kids & Young Adults': '1461817930',
      }
    },
  ];
}
