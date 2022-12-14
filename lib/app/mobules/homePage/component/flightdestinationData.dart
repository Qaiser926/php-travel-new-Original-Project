import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:phptravelapp/app/colors.dart';
import 'package:phptravelapp/app/mobules/homePage/HomeModel/homePageModelClass.dart';
import 'package:phptravelapp/app/mobules/homePage/controller/homeController.dart';

import '../api_servies/api_provider.dart';

class FeatureFlight extends StatefulWidget {
  @override
  State<FeatureFlight> createState() => _FeatureFlightState();
}

class _FeatureFlightState extends State<FeatureFlight> {
  HomeController controller = Get.find<HomeController>();
  int currentIndex = 0;
  final PageController pageController = PageController();
  double height = 0;
  double width = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ApiProvider.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade200, width: 0.7),
              borderRadius: BorderRadius.circular(8.0),
              // color: Colors.grey.shade200.withOpacity(0.99),

              boxShadow: [
                BoxShadow(
                  color: Colors.transparent,
                  blurRadius: 0,
                  spreadRadius: 0.0,
                  offset: Offset(0, 0), // shadow direction: bottom right
                )
              ],
            ),
            width: Get.size.width,
            height: Get.size.height * 0.2,
            child: GetBuilder<HomeController>(

              builder: (controller){
                if (controller.isLoading.value) {
                  return Center(child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: const CircularProgressIndicator(),
                  ));
                }
                if (controller.isEmptyData.value) {
                  return Center(
                      child: InkWell(
                        onTap: () {},
                        child:  Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: Text("nodatafoundText".tr),
                        ),
                      ));
                }
                return
                  PageView.builder(
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      currentIndex =
                          index % controller.modal.value.featuredFlights!.length;
                    });
                  },
                  // itemCount:controller.modal.value.featuredFlights!.length ,
                  itemBuilder: (context, index) {
                    if (controller.isLoading.value) {
                      return Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: const CircularProgressIndicator(),
                          ));
                    }
                    if (controller.isEmptyData.value) {
                      return Center(
                          child: InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 15),
                              child: Text("nodatafoundText".tr),
                            ),
                          ));
                    }
                    final item = controller.modal.value.featuredFlights;
                    // var item = index as  List<HomeOfferListModelClass>;

                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          color: TColor.mainColor,
                          width: Get.size.width * 0.4,
                          height: Get.size.height,
                          child: Image.network(
                            item?[index % controller.modal.value.featuredFlights!.length].thumbnail??"value",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 10),
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  item?[index %
                                      controller.modal.value
                                          .featuredFlights!.length]
                                      .title ??
                                      'title not show ',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700, fontSize: 15),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  '---------------',
                                  style: TextStyle(
                                      color: Colors.grey, letterSpacing: 1.7),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Container(
                                  width: Get.size.width * 0.45,
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: Text(
                                            item?[index %
                                                controller.modal.value
                                                    .featuredFlights!.length]
                                                .title ??
                                                'not show',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black87),
                                          )),
                                      SizedBox(
                                        width: 0,
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        size: 19,
                                        color: Colors.grey.shade600,
                                      ),
                                      SizedBox(
                                        width: 15,
                                      ),
                                      Expanded(
                                          child: Text(
                                            item?[index %
                                                controller.modal.value
                                                    .featuredFlights!.length]
                                                .title ??
                                                'not show',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black87),
                                          )),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 16,
                                ),
                                RichText(
                                    text: TextSpan(children: [
                                      TextSpan(
                                          text: 'From'.tr,
                                          style: TextStyle(
                                              color: Colors.black, fontSize: 15)),
                                      TextSpan(text: '    '),
                                      TextSpan(
                                          text: 'USD',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                              fontSize: 16.5)),
                                      TextSpan(text: '  '),
                                      // TextSpan(text: item[index%controller.modal.value.featuredFlights!.length].price??"",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16.5,color: Colors.black)),
                                    ]))
                              ],
                            ),
                          ),
                        )
                      ],
                    );

                    /*Column(
    children: [
    Stack(
    children: [
    SizedBox(
    width: Get.size.width,
    height: Get.size.height*0.23,
    child: Image.network(item![index%controller.modal.value.featuredFlights!.length].thumbnail.toString(),),
    // child: Image.network(item![index%controller.modal.value.featuredFlights!.length].featuredFlights![index].thumbnail.toString(),),
    ),
    ],
    ),
    Padding(
    padding:  EdgeInsets.only(left: 10,right: 10,top: 10),
    child: Container(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Align(
    alignment:Alignment.topLeft,
    child: Text(item[index%controller.modal.value.featuredFlights!.length].title.toString(),style: TextStyle(fontWeight: FontWeight.w700),)),
    // child: Text(item[index%controller.modal.value.featuredFlights!.length].featuredFlights![index].title.toString(),style: TextStyle(fontWeight: FontWeight.w700),)),

    Text('------------------------',style: TextStyle(fontSize: 14,letterSpacing: 1.2,color: Colors.grey),),

    Row(
    children: [
    Text(item[index%controller.modal.value.featuredFlights!.length].from.toString(),style: TextStyle(),),
    // Text(item[index%controller.modal.value.featuredFlights!.length].featuredFlights![index].from.toString(),style: TextStyle(),),
    SizedBox(width: 10,),
    Icon(Icons.arrow_forward,size: 17,),
    SizedBox(width: 10,),
    Text(item[index%controller.modal.value.featuredFlights!.length].to.toString(),style: TextStyle(),),
    // Text(item[index%controller.modal.value.featuredFlights!.length].featuredFlights![index].to.toString(),style: TextStyle(),),

    ],
    ),
    SizedBox(height: 10,),
    RichText(text: TextSpan(
    children: [
    TextSpan(text: 'flightFromPrice'.tr,style: TextStyle(color: Colors.black)),
    TextSpan(text: '  '),
    TextSpan(text: 'usdtext'.tr,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17)),
    TextSpan(text: ' '),
    TextSpan(text: item[index%controller.modal.value.featuredFlights!.length].price.toString(),style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black)),
    // TextSpan(text: item[index%controller.modal.value.featuredFlights!.length].featuredFlights![index].price.toString(),style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold,color: Colors.black)),
    ]
    )),


    ],
    ),
    ),
    )
    ],
    );
*/
                  },
                );
              },
            )
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (var i = 0;
                  i < controller.modal.value.featuredFlights!.length;
                  i++)
                biuldIndicator(currentIndex == i),
            ],
          ),
        )
      ],
    );
  }

  Widget biuldIndicator(bool isSelected) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 2),
      child: Container(
        height: isSelected ? 15 : 12,
        width: isSelected ? 15 : 12,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
                width: isSelected ? 0 : 2,
                color:
                    isSelected ? Colors.grey : Colors.grey.withOpacity(0.35)),
            color:
                isSelected ? Colors.black : TColor.mainColor.withOpacity(0.1)),
      ),
    );
  }
}
