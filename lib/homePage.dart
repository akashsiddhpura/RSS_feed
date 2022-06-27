import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rss_feed/rssApiCall.dart';
import 'package:rss_feed/rssModal.dart';
import 'package:rss_feed/rss_controller.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final controller = Get.put(RssController());
  final apicon = Get.put(RssApi());



  Widget MediaType() {
    return  Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [

            Obx(
            ()=> DropdownButtonFormField2(
                value: controller.selectesMedia.value,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.teal),
                  ),

                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                // isExpanded: true,

                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: 30,
                buttonHeight: 60,

                buttonPadding: const EdgeInsets.only(right: 8,left: 5),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                items: List.from(controller.mediaTypes)
                    .map((item) => DropdownMenuItem<String>(
                          value: item['mediaType'],
                          child: Text(
                            item['mediaType'],
                            style: const TextStyle(
                              fontSize: 17,
                            ),
                          ),
                        ))
                    .toList(),

                onChanged: (value) {

                  controller.selectesMedia.value = value.toString();
                  controller.onChangedtype(value.toString());
                  print(controller.feedList);
                  print(controller.typeList);

                  apicon.getData();
                  // controller.display.addAll(controller.mediaTypes.singleWhere((element) => element['mediaType'] == controller.selectType(value)  ));
                },
              ),
            ),
          ],
        ),
    );
  }

  Widget Types() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(
            () => DropdownButtonFormField2(
              value: controller.selectType.value,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.teal),
                ),

                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              // isExpanded: true,

              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.black45,
              ),
              iconSize: 30,
              buttonHeight: 60,

              buttonPadding: const EdgeInsets.only(right: 8,left: 5),
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              items: controller.typeList
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: (value) {
                controller.selectType.value=value.toString();
                apicon.getData();

              },
            ),
          ),
        ],
      ),
    );
  }

  Widget FeedList() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(
            () => DropdownButtonFormField2(
              value: controller.selectedFeed.value,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.teal),
                ),

                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              // isExpanded: true,

              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.black45,
              ),
              iconSize: 30,
              buttonHeight: 60,

              buttonPadding: const EdgeInsets.only(right: 8,left: 5),
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              items: controller.feedList.keys
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: (value) {

                controller.feedList.keys;
                apicon.getData();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget Country() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(
            () => DropdownButtonFormField2(
              value: controller.selCountry.value,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.teal),
                ),

                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              // isExpanded: true,

              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.black45,
              ),
              iconSize: 30,
              buttonHeight: 60,

              buttonPadding: const EdgeInsets.only(right: 8,left: 5),
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              items: controller.countries.keys
                  .map((item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: (value) {

                controller.selCountry.value = value.toString();
                apicon.getData();
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget DataCount() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Obx(
            () => DropdownButtonFormField2(
              value: controller.selCount.toString(),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.teal),
                ),

                isDense: true,
                contentPadding: EdgeInsets.zero,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              // isExpanded: true,

              icon: const Icon(
                Icons.arrow_drop_down,
                color: Colors.black45,
              ),
              iconSize: 30,
              buttonHeight: 60,

              buttonPadding: const EdgeInsets.only(right: 8,left: 5),
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              items: controller.dataCount
                  .map((item) => DropdownMenuItem(
                        value: item.toString(),
                        child: Text(
                          item.toString(),
                          style: const TextStyle(
                            fontSize: 17,
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: (value) {

                controller.selCount.value = value.toString();
                apicon.getData();
              },
            ),
          ),
        ],
      ),
    );
  }
@override
  void initState() {
    // TODO: implement initState
    apicon.getData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "RSS feed",
          style: TextStyle(color: Colors.red),
        ),
        centerTitle: true,
        backgroundColor: Color(0x121B3BFF),
        actions: [
          IconButton(
            onPressed: () {
              Get.defaultDialog(
                  title: "GetX Dialog",
                  content: Container(
                    child: Column(
                      children: [
                        MediaType(),
                        SizedBox(
                          height: 5,
                        ),
                        Types(),
                        SizedBox(
                          height: 5,
                        ),
                        FeedList(),
                        SizedBox(
                          height: 5,
                        ),
                        Country(),
                        SizedBox(
                          height: 5,
                        ),
                        DataCount(),
                        SizedBox(height: 5,),
                        // ElevatedButton(onPressed: (){
                        //   apicon.getData();
                        //   Get.back();
                        // }, child: Text("submit"))
                      ],
                    ),
                  )

                  // actions: [Designation()],
                  );
            },
            icon: Icon(Icons.menu),
          )
        ],
      ),
      backgroundColor: Color(0x121B3BFF),
      body:  Container(
        color: Color(0x121B3BFF),
        child:  Obx(
            ()=> controller.responsedata.isEmpty
            ? Center(child: CircularProgressIndicator(color: Colors.red,),): GridView.builder(
              // primary: false,
              padding: const EdgeInsets.all(7),
              // crossAxisSpacing: 10,
              // mainAxisSpacing: 10,
              // childAspectRatio: 3 / 3.5,
              // maxCrossAxisExtent: 180.0,


              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 9/12,
                  crossAxisSpacing: 10
              ),
              itemCount: controller.responsedata.length,
              // shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(5),
                  child: Column(

                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Column(

                          children: [
                            Image(
                              image: NetworkImage(controller.responsedata[index].artworkUrl100),
                              fit: BoxFit.cover,
                              height: 150,
                              width: 230,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 2),
                        child: Text(
                          controller.responsedata[index].name,maxLines: 3,
                          style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 2, left: 3),
                        child: Text(
                         controller.responsedata[index].artistName,
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                      )
                    ],
                  ),
                );
              },

            )

        ),
      )
    );
  }
}
