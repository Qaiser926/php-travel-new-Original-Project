import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:phptravelapp/app/colors.dart';
import 'package:phptravelapp/app/mobules/homePage/component/HomePageComponent.dart';
import 'package:phptravelapp/app/mobules/homePage/component/feature_tourData.dart';
import 'package:phptravelapp/app/mobules/homePage/component/topRowIcon.dart';
import 'package:phptravelapp/app/mobules/homePage/controller/homeController.dart';
import 'package:phptravelapp/app/mobules/homePage/component/feature_hotel.dart';
import 'package:phptravelapp/app/mobules/menu_filterPage/dataFilteration.dart';
import 'package:phptravelapp/app/mobules/tourPage/tourView/tourDetailpage.dart';
import 'package:phptravelapp/app/mobules/visaPage/visaView/visaDetailPage.dart';
import 'package:phptravelapp/app/reusableText/reusableText.dart';

import '../component/flightdestinationData.dart';
import '../../hotelPage/hotelView/hotelSearchPage.dart';

class HomeViewPage extends GetView<HomeController>{
  final homecontroller=Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: Get.size.height*0.04,),
              appBar(),
              sizeBox(),
              TabComponent(),
          // Obx(() =>Container(
          //     TopRowIcon(),

              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.center,
                  child: commonText(
                    title: 'topflightdestination'.tr,
                    size: 25,
                    fontWeight: FontWeight.bold,
                  )),


              // FeatureFlight(),
              SizedBox(height:Get.size.height*0.01),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 1,color: Colors.grey),
                          shape: BoxShape.circle,
                        ),
                        width: 14,
                        height: 14,
                        child: Icon(Icons.question_mark,size: 8,),

                      ),
                    ),
                    SizedBox(width: 5,),
                    Expanded(child: Text('belowFlightdestinationText'.tr,style: TextStyle(fontSize: 12),))
                  ],
                ),
              ),
              SizedBox(height:Get.size.height*0.05),
              Container(
               color: TColor.mainColor.withOpacity(0.6),
               child: Column(
                 children: [
                   SizedBox(height: 12,),
                   Align(
                       alignment: Alignment.center,
                       child: commonText(
                         title: 'featurehotel'.tr,
                         size: 25,
                         fontWeight: FontWeight.bold,
                       )),

                   // FeatureHotel(),
                   SizedBox(height: 20,),
                 ],
               ),
             ),


              SizedBox(
                height: 13,
              ),
              Align(
                  alignment: Alignment.center,
                  child: commonText(
                    title: 'featuretour'.tr,
                    size: 25,
                    fontWeight: FontWeight.bold,
                  )),
              SizedBox(
                height: 12,
              ),
              // FeatureTourData(),
              SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.center,
                  child: commonText(
                    title: 'Featured Cars',
                    size: 20,
                    fontWeight: FontWeight.bold,
                  )),

              // FeatureCars()
            ],
          ),
        ),
      ),
    );
  }
  Widget appBar(){
    return Container(
      width: Get.size.width,
      height: Get.size.height * 0.08,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
                decoration: BoxDecoration(
                    color: TColor.mainIconColor,
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {
                        Get.to(DataFilteration());
                      },
                      child: Icon(Icons.menu)),
                )),
          ),
           Text(
            'appbartitle'.tr,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w400,
                fontSize: 17),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
                decoration: BoxDecoration(
                    color: TColor.mainIconColor,
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.notifications_none),
                )),
          ),
        ],
      ),
    );
  }
  Widget sizeBox(){
    return   const SizedBox(
      height: 10,
    );
  }
}

