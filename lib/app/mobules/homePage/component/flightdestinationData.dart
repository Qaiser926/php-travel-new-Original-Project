

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:phptravelapp/app/colors.dart';
import 'package:phptravelapp/app/mobules/homePage/controller/homeController.dart';

class FeatureFlight extends StatefulWidget {
  @override
  State<FeatureFlight> createState() => _FeatureFlightState();
}

class _FeatureFlightState extends State<FeatureFlight> {
  final controller=Get.find<HomeController>();
  int currentIndex=0;
  final PageController pageController=PageController();
  double height=0;
  double width=0;
  @override
  Widget build(BuildContext context) {
      return Stack(
        children: [
          Column(
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade200,width: 0.7),
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
                  height: Get.size.height*0.4,
                  child: PageView.builder(
                    controller: pageController,
                    onPageChanged: (index){
                      setState((){
                        currentIndex=index%controller.modal.value.featuredFlights!.length;
                      });
                    },
                    // itemCount:controller.modal.value.featuredFlights!.length ,
                    itemBuilder: (context, index){

                      final item=controller.modal.value.featuredFlights;

                      return Column(
                        children: [
                          Stack(
                            children: [

                              SizedBox(
                                width: Get.size.width,
                                height: Get.size.height*0.23,
                                child: Image.network(item![index%controller.modal.value.featuredFlights!.length].thumbnail.toString(),),
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

                                  Text('------------------------',style: TextStyle(fontSize: 14,letterSpacing: 1.2,color: Colors.grey),),

                                  Row(
                                    children: [
                                      Text(item[index%controller.modal.value.featuredFlights!.length].from.toString(),style: TextStyle(),),
                                      SizedBox(width: 10,),
                                      Icon(Icons.arrow_forward,size: 17,),
                                      SizedBox(width: 10,),
                                      Text(item[index%controller.modal.value.featuredFlights!.length].to.toString(),style: TextStyle(),),

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
                                      ]
                                  )),


                                ],
                              ),
                            ),
                          )
                        ],
                      );

                    },
                  ),
                ),
              ),

              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for(var i =0;i<controller.modal.value.featuredFlights!.length ;i++)
                      biuldIndicator(currentIndex ==i)
                  ],
                ),
              )
            ],
          ),
          // Positioned(
          //   top:height*0.5-width*0.3,
          //
          //   child: Container(
          //     width: 70,
          //     height: 30,
          //     decoration: BoxDecoration(
          //         color: TColor.maingreenColor
          //     ),
          //   ),
          // ),
        ],
      );

  }
  Widget biuldIndicator(bool isSelected){
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 2),
      child: Container(
        height: isSelected?15:12,
        width: isSelected?15:12,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(width: isSelected?0:2,color: isSelected?Colors.grey:Colors.grey.withOpacity(0.35)),
          color: isSelected?Colors.black:TColor.mainColor.withOpacity(0.1)
        ),
      ),
    );
  }
}
