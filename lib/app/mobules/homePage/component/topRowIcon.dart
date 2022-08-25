

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:phptravelapp/app/colors.dart';
import 'package:phptravelapp/app/mobules/homePage/controller/homeController.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TopRowIcon extends StatefulWidget {
   TopRowIcon({Key? key}) : super(key: key);

  @override
  State<TopRowIcon> createState() => _TopRowIconState();
}

class _TopRowIconState extends State<TopRowIcon> {
  List<String> imagelist=['images/hotel.svg','images/plane.svg','images/bus.svg','images/visa_card.svg'];


  @override
  Widget build(BuildContext context) {
    return    GetBuilder<HomeController>(builder: (controller){
      if (controller.isLoading.value) {
        return Center(child: const CircularProgressIndicator());
      }
      if (controller.isEmptyData.value) {
        return Center(
            child: InkWell(
              onTap: () {},
              child:  Text("nodatafoundtext".tr),
            ));
      }
      return
        Container(
        width: Get.size.width,
        height: Get.size.height * 0.17,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.modal.value.modules!.length,
          itemBuilder: (context, index) {
            final itemData=controller.modal.value.modules![index];
            return Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15),
                      child: Container(
                        width: Get.size.width * 0.12,
                        height: Get.size.height * 0.12,
                        decoration: BoxDecoration(
                          color: TColor.mainIconColor,
                          shape: BoxShape.circle,
                        ),
                        // child: TopIcon(
                        //   // color: colors[index],
                        //   // onTap: Get.to(ontap[index]),
                        //   image: image[index],
                        //
                        // ),
                        child: Center(child: Text('Pic')),
                      ),
                    ),
                  ],
                ),
                Text(itemData.name
                    .toString()),
                // Text('Text')
              ],
            );
          },
        ),
      );
    });


  }
}
