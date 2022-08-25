//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:phptravelapp/app/mobules/homePage/api_servies/api_provider.dart';
// import 'package:phptravelapp/app/mobules/homePage/bottomNav/bottomNavigation.dart';
//
// import '../HomeModel/homePageModelClass.dart';
//
// class HomeController extends GetxController{
//
//   RxInt currentIndex=0.obs;
//
//   var name=''.obs;
//   var isLoading=false.obs;
//   var model=HomeOfferListModelClass().obs;
//   var isEmptyData=false.obs;
//
//
//
//   List<Widget> homeViewWidget = [
//     BottomNavigationBarPage(),
//     // SearchFlightView(),
//     // MyTripCompleteView(),
//     // OffersView(),
//     // ProfileView(),
//   ];
//
//   // List<TourAppModel> modelDataList=List<TourAppModel>.empty().obs;
//   //
//   // @override
//   // void onInit(){
//   //   super.onInit();
//   //   fetchTourData();
//   // }
//   //
//   // fetchTourData() async{
//   //
//   //   List<TourAppModel> modelClass=[
//   //
//   //     TourAppModel(
//   //       name: 'lahore',
//   //       id: 4,
//   //       price: 25,
//   //       star: 5,
//   //       image: 'https://images.unsplash.com/photo-1543536775-f62c9e0ca216?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
//   //       des: 'this is lahore ',
//   //     ),
//   //     TourAppModel(
//   //       name: 'lahore',
//   //       id: 4,
//   //       price: 235,
//   //       star: 1,
//   //       image: 'https://images.unsplash.com/photo-1572015833682-3d3633889189?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=338&q=80',
//   //       des: 'this is karachi',
//   //     ), TourAppModel(
//   //       name: 'karachi',
//   //       id: 4,
//   //       price: 27,
//   //       star: 3.5,
//   //       image: 'https://images.unsplash.com/photo-1615281378393-6225797ba2b9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80',
//   //       des: 'this is london',
//   //     ), TourAppModel(
//   //       name: 'london',
//   //       id: 4,
//   //       price: 45,
//   //       star: 4.1,
//   //       image: 'https://images.unsplash.com/photo-1572015833682-3d3633889189?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=338&q=80',
//   //       des: 'this is view',
//   //     ), TourAppModel(
//   //       name: 'room',
//   //       id: 4,
//   //       price: 85,
//   //       star: 1.5,
//   //       image: 'https://images.unsplash.com/photo-1643841368618-4aa128ae63c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80',
//   //       des: 'this is beautiful room',
//   //     ), TourAppModel(
//   //       name: 'china',
//   //       id: 4,
//   //       price: 125,
//   //       star: 2.3,
//   //       image: 'https://images.unsplash.com/photo-1543536775-f62c9e0ca216?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80',
//   //       des: 'this is china',
//   //     ),
//   //
//   //
//   //
//   //
//   //   ];
//   //   modelDataList.assignAll(modelClass);
//   //   print(modelClass);
//   //   update();
//   //
//   // }
//
//   @override
//   void onInit()  {
//     // TODO: implement onInit
//     super.onInit();
//     // fatchProductList();
//
//   }
//   fatchProductList() async {
//     // print("tapped $id");
//     try {
//       isLoading(true);
//       var product = await ApiProvider.getUserData();
//       print(product);
//       if (product is HomeOfferListModelClass) {
//         print("data not null");
//         model.value = product as HomeOfferListModelClass;
//         update();
//       } else {
//         isEmptyData(true);
//       }
//     } finally {
//       isLoading(false);
//     }
//   }
//   @override
//   void onReady() {
//     super.onReady();
//   }
//
//
// }



import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:phptravelapp/app/mobules/homePage/HomeModel/homePageModelClass.dart';
import 'package:phptravelapp/app/mobules/homePage/HomeModel/modelClass.dart';
import 'package:phptravelapp/app/mobules/homePage/api_servies/api_provider.dart';
import 'package:phptravelapp/app/mobules/homePage/bottomNav/bottomNavigation.dart';


// class HomeController extends GetxController with StateMixin<List<dynamic>> {
// class HomeController extends GetxController with StateMixin<List<dynamic>>{
class HomeController extends GetxController {
  RxInt currentIndex = 0.obs;

  var name = "".obs;
  var isLoading = false.obs;
  var modal = HomeOfferListModelClass().obs;
  var isEmptyData = false.obs;

  List<TourAppModel> modelDataList=List<TourAppModel>.empty().obs;


  List<Widget> homeViewWidget = [
    BottomNavigationBarPage()
  ];


  @override
  void onInit() {
    super.onInit();

    fatchProductList();
  }

  fatchProductList() async {
    // print("tapped $id");
    try {
      isLoading(true);
      var product = await ApiProvider.getUserData();
      print(product);
      if (product is HomeOfferListModelClass) {
        print("data not null");
        modal.value = product as HomeOfferListModelClass;
        update();
      } else {
        isEmptyData(true);
      }
    } finally {
      isLoading(false);
    }
  }
  @override
  void onReady() {
    super.onReady();
  }

  //
  //
  // fetchTourData() async{
  //
  //   List<TourAppModel> modelClass=await [
  //
  //     TourAppModel(
  //       image: 'images/hotel.svg',
  //     ),
  //     TourAppModel(
  //       image: 'images/plane.svg',
  //     ),
  //     TourAppModel(
  //       image: 'images/bus.svg',
  //     ),
  //     TourAppModel(
  //       image: 'images/visa_card.svg',
  //     ),
  //   ];
  //   modelDataList.assignAll(modelClass);
  //   print(modelClass);
  //   update();
  //
  // }


}




